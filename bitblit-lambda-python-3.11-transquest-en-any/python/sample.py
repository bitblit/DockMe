import torch
from transquest.algo.sentence_level.monotransquest.run_model import MonoTransQuestModel


model = MonoTransQuestModel("xlmroberta", "TransQuest/monotransquest-da-en_any", num_labels=1, use_cuda=torch.cuda.is_available())
predictions, raw_outputs = model.predict([["Reducerea acestor conflicte este importantă pentru conservare.", "Reducing these conflicts is not important for preservation."]])
print(predictions)