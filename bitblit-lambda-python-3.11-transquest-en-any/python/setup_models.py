import torch
from transquest.algo.sentence_level.monotransquest.run_model import MonoTransQuestModel

model = MonoTransQuestModel("xlmroberta", "TransQuest/monotransquest-da-en_any", num_labels=1, use_cuda=torch.cuda.is_available())

print('Model loaded')