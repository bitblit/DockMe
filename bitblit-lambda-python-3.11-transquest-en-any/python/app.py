import os
import logging
import jsonpickle
import boto3
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.core import patch_all
#import torch
#from transquest.algo.sentence_level.monotransquest.run_model import MonoTransQuestModel

print('1')

logger = logging.getLogger()
logger.setLevel(logging.INFO)
#patch_all()

client = boto3.client('lambda')
#client.get_account_settings()

def handler(event, context):
    print('a')
    #logger.info('## ENVIRONMENT VARIABLES\r' + jsonpickle.encode(dict(**os.environ)))
    #logger.info('## EVENT\r' + jsonpickle.encode(event))
    #logger.info('## CONTEXT\r' + jsonpickle.encode(context))
    #response = client.get_account_settings()
    #return response['AccountUsage']
    country_capitals = {
      "United States": "Washington D.C.",
      "Italy": "Rome",
      "England": "London"
    }
    response = {
        statusCode: 200,
        isBase64Encoded: false,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonpickle.encode(country_capitals)
    }

    print('b')
    return response


#model = MonoTransQuestModel("xlmroberta", "TransQuest/monotransquest-da-en_any", num_labels=1, use_cuda=torch.cuda.is_available())
#predictions, raw_outputs = model.predict([["Reducerea acestor conflicte este importantă pentru conservare.", "Reducing these conflicts is not important for preservation."]])
#print(predictions)