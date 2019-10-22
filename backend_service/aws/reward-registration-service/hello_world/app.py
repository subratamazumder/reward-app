import json
import qrcode
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.core import patch_all
import random
import string
import urllib.parse
import boto3
from io import BytesIO
import traceback
import logging
from cryptography.fernet import Fernet
import base64
import requests
logger = logging.getLogger()
logger.setLevel(logging.INFO)
QR_BUCKET_NAME = "dev-scp-reward-app"
QR_FOLDER_NAME = "qr/"
KEY="5xMGUQOgMpP42AXUEJBf3idL4KRQZPaKht4GU1MH_tk="
SMS_API_KEY="test key here"
SMS_API_SECRET="test secret here"
class S3ImagesUploadFailed(Exception):
    pass

logger.info('Global setups for reuse')
patch_all()
sns = boto3.client("sns")
s3 = boto3.client('s3')
qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_L,
    box_size=10,
    border=4,
)
def encrypt_data(key, data):
    f = Fernet(key)
    return base64.b64encode(f.encrypt(data.encode()))

def get_random_string(stringLength=15):
    """Generate a random string of fixed length """
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(stringLength))

def get_image_as_bytes(image_object, image_extn):
    buffer = BytesIO()
    image_object.save(buffer, image_extn)
    buffer.seek(0)
    return buffer

def upload_to_s3(object_value, object_key, bucket_name):
    # if True: return
    s3_response = s3.put_object(
        ACL='public-read',
        Body = object_value,
        Bucket = bucket_name,
        StorageClass='STANDARD',
        Key=object_key
    )
    if s3_response['ResponseMetadata']['HTTPStatusCode'] != 200:
            raise S3ImagesUploadFailed('Failed to upload image {} to bucket {}'.format(object_key, bucket_name))


def respond(err, res=None):
    return {
        'statusCode': '400' if err else '200',
        'body': err if err else json.dumps(res),
        'headers': {
            'Content-Type': 'application/json',
        },
    }


def create_new_membership(payload):
    logger.info(payload['name'])
        # logger.info(payload['postCode'])
        # logger.info(payload['platform'])
        # logger.info(payload['appVersion'])


def get_qr_data(payload):
    return encrypt_data(KEY,"{}:{}:{}".format(payload['mobileNumber'],payload['name'],payload['postCode']))


def get_qr_image(payload):
    qr_data = get_qr_data(payload)
    logger.info('Generating QR with data -{}'.format(qr_data))
    qr.add_data(qr_data)
    qr.make(fit=True)
    qr_img = qr.make_image(fill_color="black", back_color="white")
    logger.info('QR Generated')
    return get_image_as_bytes(qr_img,'PNG')
    
def get_s3_obj_key():
    return "{}{}.PNG".format(QR_FOLDER_NAME,get_random_string())


def get_qr_cdn_url(s3_object_key):
    return "https://{}.s3.ap-south-1.amazonaws.com/{}".format(QR_BUCKET_NAME,s3_object_key)

def send_sms(payload):
    mobile_number = payload["mobileNumber"]
    send_way2sms(SMS_API_URL, SMS_API_KEY, SMS_API_SECRET, 'prod', mobile_number, 'SCPJWL', 'Sucessfully registered!' )
    # sns.publish(
    #     PhoneNumber=mobile_number,
    #     Message="Successfully registered!"
    # )

SMS_API_URL = "https://www.way2sms.com/api/v1/sendCampaign"

# get request
def send_way2sms(reqUrl, apiKey, secretKey, useType, phoneNo, senderId, textMessage):
  req_params = {
  'apikey':apiKey,
  'secret':secretKey,
  'usetype':useType,
  'phone': phoneNo,
  'message':textMessage,
  'senderid':senderId
  }
  return requests.post(reqUrl, req_params)

def lambda_handler(event, context):
    """
    Sample event looks like
    {
        "mobileNumber": "9111111111",
        "name": "subrata",
        "postCode": "111111",
        "platform": "android",
        "appVersion": "1.0.0"
    }
    """
    try:
        
        logger.info("Received event: " + json.dumps(event, indent=2))
        payload = json.loads(event['body'])
        s3_object_key = get_s3_obj_key()
        upload_to_s3(get_qr_image(payload),s3_object_key,QR_BUCKET_NAME)
        send_sms(payload)
        return respond(None, {
                "qrCdnUrl": get_qr_cdn_url(s3_object_key)
            })
    except Exception:
        logger.info(traceback.print_exc())
        return respond(ValueError('Lambda handler failed'))

