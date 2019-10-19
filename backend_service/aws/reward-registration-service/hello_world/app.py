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
logger = logging.getLogger()
logger.setLevel(logging.INFO)
# import PIL
QR_BUCKET_NAME = 'dev-scp-reward-app'
class S3ImagesUploadFailed(Exception):
    pass

logger.info('Global setups for reuse')
patch_all()
s3 = boto3.client('s3')
qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_L,
    box_size=10,
    border=4,
)
def randomString(stringLength=10):
    """Generate a random string of fixed length """
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(stringLength))

def getImageAsBytes(image_object, image_extn):
    buffer = BytesIO()
    image_object.save(buffer, image_extn)
    buffer.seek(0)
    return buffer

def uploadToS3(object_value, object_key, bucket_name):
    s3_response = s3.put_object(
        ACL='public-read',
        Body = object_value,
        Bucket = bucket_name,
        StorageClass='STANDARD',
        Key=object_key
    )
    if s3_response['ResponseMetadata']['HTTPStatusCode'] != 200:
            raise S3ImagesUploadFailed('Failed to upload image {} to bucket {}'.format(object_key, bucket_name))
    # s3.Bucket(bucket_name).put_object(Key=object_key, Body=object_value)

def respond(err, res=None):
    return {
        'statusCode': '400' if err else '200',
        'body': err if err else json.dumps(res),
        'headers': {
            'Content-Type': 'application/json',
        },
    }

def lambda_handler(event, context):
    """Sample pure Lambda function

    Parameters
    ----------
    event: dict, required
        API Gateway Lambda Proxy Input Format

        Event doc: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html#api-gateway-simple-proxy-for-lambda-input-format

    context: object, required
        Lambda Context runtime methods and attributes

        Context doc: https://docs.aws.amazon.com/lambda/latest/dg/python-context-object.html

    Returns
    ------
    API Gateway Lambda Proxy Output Format: dict

        Return doc: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html
    """
    try:
        random_string = randomString(10)
        qr.add_data(random_string)
        file_name = "qr/"+random_string+".PNG"
        qr.make(fit=True)
        qr_img = qr.make_image(fill_color="black", back_color="white")
        logger.info('QR Generated')
        uploadToS3(getImageAsBytes(qr_img,'PNG'),file_name,QR_BUCKET_NAME)
        qr_image_url = "https://{}.s3.ap-south-1.amazonaws.com/{}".format(QR_BUCKET_NAME,file_name)
        return respond(None, {
                "qrCdnUrl": qr_image_url
            })
    except Exception:
        logger.info(traceback.print_exc())
        return respond(ValueError('S3 Upload Faild'))

