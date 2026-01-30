import boto3

s3_client = boto3.client('s3')

bucket_name = "data-eng-resources"
file_path = 'cleaned_smartwatch_data.csv'

s3_client.put_object(
    Bucket=bucket_name,
    Key="se-data-folder/joshna/final_data_project/joshna_cleaned_smartwatch_data.csv",
    Body=file_path,
    ContentType="text/csv"
)

print("data inserted")