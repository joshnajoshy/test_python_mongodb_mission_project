import boto3

s3_client = boto3.client('s3')

bucket_name = "data-eng-resources"
file_path = 'cleaned_mission_df_copy.csv'

s3_client.put_object(
    Bucket=bucket_name,
    Key="se-data-folder/joshna/final_data_project/cleaned_mission_df_copy.csv",
    Body=file_path,
    ContentType="text/csv"
)

print("data inserted")