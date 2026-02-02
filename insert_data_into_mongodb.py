import pymongo
import pandas as pd

client = pymongo.MongoClient("mongodb://18.201.181.143:27017/")

db = client["mission_db"]

mission_df = pd.read_csv('cleaned_mission_df_copy.csv')

mission_dictionary = mission_df.to_dict("records")

db.mission_clean.insert_many(mission_dictionary)

print("Inserted Data")