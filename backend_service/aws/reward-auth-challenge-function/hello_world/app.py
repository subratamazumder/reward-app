import json
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.core import patch_all
import traceback
import logging
import requests
import string
import random
import os
logger = logging.getLogger()
logger.setLevel(logging.INFO)
SMS_API_KEY = os.environ['SMS_API_KEY'] 
SMS_API_SECRET = os.environ['SMS_API_SECRET']
SMS_ENV = os.environ['SMS_ENV']

SMS_API_URL = "https://www.way2sms.com/api/v1/sendCampaign"
SMS_SENDER_ID = 'SCPJWL'
SMS_TEMPLATE = '{} is your OTP for Reward App Authorisation'

logger.info('Global setups for reuse')
patch_all()

class AuthChallengeFailed(Exception):
    def __init__(self):
        Exception.__init__(self, "Unable to send Auth Challenge")


class SendSMSFailed(Exception):
    def __init__(self, msg):
        Exception.__init__(self, msg)

def respond(err, res=None):
    return {
        'statusCode': '400' if err else '200',
        'body': err if err else json.dumps(res),
        'headers': {
            'Content-Type': 'application/json',
        },
    }


def send_sms(payload, env, sms_text):
    """Send SMS to a mobile number"""
    mobile_number = payload["mobileNumber"]
    send_way2sms(SMS_API_URL, SMS_API_KEY, SMS_API_SECRET, env,
                 mobile_number, SMS_SENDER_ID, sms_text)


def send_way2sms(reqUrl, apiKey, secretKey, useType, phoneNo, senderId, textMessage):
    """Send SMS using way2sms API"""
    req_params = {
        'apikey': apiKey,
        'secret': secretKey,
        'usetype': useType,
        'phone': phoneNo,
        'message': textMessage,
        'senderid': senderId
    }
    sms_response = requests.post(reqUrl, req_params)
    logger.info(sms_response.json())
    if sms_response.status_code != 200:
        raise SendSMSFailed(
            'Failed to send SMS to {} on env {}'.format(phoneNo, useType))
    return requests.post(reqUrl, req_params)


def get_random_digits(no_of_digit=4):
    """Generate a random string of fixed length """
    digits = string.digits
    return ''.join(random.choice(digits) for i in range(no_of_digit))

def save_otp(mobile_number, otp):
    """Save OPT DB"""
    pass


def get_otp(mobile_number):
    """Generate a random 4 digit numbers & save to OPT DB"""
    otp = get_random_digits()
    save_otp(mobile_number,otp)
    return otp


def lambda_handler(event, context):
    """
    Sample event looks like
    {
        "mobileNumber": "9111111111",
        "name": "subrata",
    }
    """
    try:
        logger.info("Received event: " + json.dumps(event, indent=2))
        send_sms(event, SMS_ENV,SMS_TEMPLATE.format(get_otp(event["mobileNumber"])))
        return respond(None, {
            "state": "Auth challenge sent successfully"
        })
    except Exception:
        logger.info(traceback.print_exc())
        return respond(AuthChallengeFailed())
