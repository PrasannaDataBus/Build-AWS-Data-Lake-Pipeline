# Build-AWS-Data-Lake-Pipeline

## STEP 1: Setting Up S3 Raw Bucket

1. Create Bucket

<img width="1637" height="510" alt="{82A34DDC-2371-40A8-8DBE-8BDE72572DC3}" src="https://github.com/user-attachments/assets/8df48337-a524-4b31-9b92-572ad46d29d6" />

2. Object Ownership

<img width="1619" height="253" alt="{7F921803-3391-422F-B037-3EAED8F66E63}" src="https://github.com/user-attachments/assets/12b279c6-4341-46fc-b231-8d04e07d6c27" />

3. Block Public Acccess

<img width="1625" height="367" alt="{4D078A46-3739-49DE-9FD0-100CE5B374BB}" src="https://github.com/user-attachments/assets/7bc637ef-a64e-4150-958e-f35682e1fe83" />

4. Bucket Versioning

<img width="1622" height="198" alt="{557B96A0-9AF4-4E08-B347-CAD9DAAFF44B}" src="https://github.com/user-attachments/assets/11374038-2f63-488a-951b-e0c3c1c1007a" />

5. Default Encryption

<img width="1632" height="318" alt="{2E175E84-4BFD-4042-B186-7CECC1E003BB}" src="https://github.com/user-attachments/assets/a6acee1c-047d-48b4-ada5-8e5759846a53" />

6. Advanced settings

<img width="1625" height="283" alt="{CF38E7E1-779A-48F6-9FC3-296FA84EE59A}" src="https://github.com/user-attachments/assets/d053a68c-c84a-40b2-b850-442cbbfcdbc9" />

7. Create bucket

********************************************************************** End of Raw Bucket Creation *****************************************************************

## STEP 2: SETUP AWS DMS (Database Migration Service)

Pipeline Overview:

<img width="808" height="281" alt="{330F8075-1F40-4FB2-9BDE-CB9697792157}" src="https://github.com/user-attachments/assets/9c65f1e1-b019-417a-b5a5-70ce989f38da" />

1. Click on Subnet groups

<img width="1590" height="278" alt="{AAA05042-E8FE-4254-A3B9-7748A2F2261A}" src="https://github.com/user-attachments/assets/f0ec186d-5c99-4ff8-b514-8b6fdbecbcab" />

2. Create subnet group

<img width="817" height="809" alt="{7E856A10-A115-4040-A7BF-B2D2B2AEE9AB}" src="https://github.com/user-attachments/assets/590df0ed-e0f6-43ae-836e-35dee845f173" />

Note: You will need to choose atleast 2 VPC based on your EC2 instance details, check EC2 instance

3. Create Replication Instance

<img width="1586" height="299" alt="{F2644708-9DDE-4891-9DD9-4034C3DDD415}" src="https://github.com/user-attachments/assets/9cb5c0f6-251c-41fd-818a-6180284c3940" />

4. Configure settings

<img width="1372" height="414" alt="{B55C7B8E-1B7C-473E-81B4-B90D8488C589}" src="https://github.com/user-attachments/assets/c0ced4f3-0060-4010-8a2f-f325dac8613f" />

5. Instance Configuration

<img width="1367" height="391" alt="{1996EF94-4FBD-474D-87A8-D545F37C352B}" src="https://github.com/user-attachments/assets/4633909e-9b62-49d6-9af6-125c1f74a633" />

Choose instance class -> Select latest engine version -> Choose High Availabilty based on your goal

6. Connectivity and Security

<img width="1358" height="98" alt="{C87DE099-91C6-4ECB-9F0B-A37890DB4DD9}" src="https://github.com/user-attachments/assets/515307c5-0891-4071-bcdc-eefd682c9654" />

Pick your previously created replication subnet group and public access yes (it doesnt mean that you are provideing access to the globe but only to other networks outside AWS)

7. Advanced settings

<img width="1370" height="235" alt="{B9E980D7-C99B-4C03-A19F-3BA4E6EDEB36}" src="https://github.com/user-attachments/assets/b394a1a9-fdcd-4b90-972b-819973261d8f" />

select availabilty zone -> select both security groups

8. Create replication instance

Tips: If you experience error prompt, replication instance cannot be created with the selected vpc / zone, it means simple go to your previously created / associated subnet group to check whether you have chosen the same availability zone that you did chose to create your replication instance.

9. Create source endpoint

*** first you will need to create or use your previously created EC2 address

<img width="1582" height="273" alt="{4CCDD7A2-332B-4C5C-B2A6-821BF8244E64}" src="https://github.com/user-attachments/assets/73d3d1b1-9252-4ed4-9734-89e286f7eb6f" />

10. Configure Endpoint type

<img width="814" height="631" alt="{47E06610-FD42-4C6D-BB5E-04A382BE4B69}" src="https://github.com/user-attachments/assets/65e0c0fc-4c7a-414f-803f-7a9334960d1b" />

provide endpoint identifier -> choose source engine

11. Configure source connection

<img width="805" height="651" alt="{5D84583C-042A-41AD-B5BA-A2D772AA9460}" src="https://github.com/user-attachments/assets/410737ef-a96a-49f6-aab6-e8df2c01f2f8" />

12. Test

13. <img width="830" height="221" alt="{2FB328C5-67E3-4D57-A42D-005A3026CC73}" src="https://github.com/user-attachments/assets/7f490900-ae28-40f0-9d51-813a54e1ff7e" />

make sure you are in right replication instance

14. Create endpoint

15. *************************************** Now create target endpoint ************************************************

<img width="835" height="638" alt="{213B933B-B615-410D-AB23-B91B5013841B}" src="https://github.com/user-attachments/assets/08cd3ac6-2173-40e2-aaa4-a4c2a7f08799" />

choose target endpoint -> select RDS DB instance -> configure endpoint

16. Target Engine -> Choose S3

<img width="794" height="474" alt="{1EDC9D4C-ED16-4D0F-8090-931932EBD43C}" src="https://github.com/user-attachments/assets/487ecabd-4c2b-4c9d-915f-d47ffca6d805" />

provide the bucket path -> choose IAM role.

Tip: When providing bucket path if you didnt create a folder previously while creating S3 bucket, you can create one right in this step - browse your S3 bucket after add /folder name/ For Ex: test-bucket/raw-bronze/

### Note: Dont forget to choose "editor" in Endpoint settings as you will need to use PARQUET format when CDC enabled and it is a best practice to maintain data in a PARQUET format as it is raw injestion. See the next clip

Follow the below Endpoint settings or refer the file TargetEndPointSettings.json

<img width="797" height="573" alt="{323A55CA-DAB3-4C48-87B4-1C21538EEA66}" src="https://github.com/user-attachments/assets/1bb9d4bd-40f5-494a-8fc6-52dac460ee7a" />

**** Extra connection attributes are also important but it will be automatically created when you save the editor. See below clip

<img width="603" height="133" alt="{DF7AE3E1-B0AE-432E-9BEB-AEB94E75E5EE}" src="https://github.com/user-attachments/assets/b556bc4e-0ce1-42d8-9df4-7606db0af779" />

17. Test

<img width="820" height="245" alt="{B91F9608-AC6C-4431-BD91-DE28DFE4FD90}" src="https://github.com/user-attachments/assets/3255a607-0574-48d2-a437-88a856227f33" />

18. Create endpoint

19. Create database migration task

<img width="1582" height="300" alt="{48EF8906-C68E-47A2-B744-B8F69428F815}" src="https://github.com/user-attachments/assets/6aa726d7-474f-4a1b-af2e-2b42842ab228" />

20. Configure task

<img width="1376" height="824" alt="{6F7CCCFC-1BE9-45D9-AFE6-82A939B7121F}" src="https://github.com/user-attachments/assets/ae215737-1fa2-4b27-a452-74898ac53536" />

provide Task identifier -> choose endpoints (source database & target database) -> task mode (provisioned) -> choose provisioned instance -> choose task type (I have chosen Migrate and replicate) to enable CDC

### Note: Sometimes your task might fail due to incompatibity configurations in your host system, in such cases you will not be able to select both full load and CDC rather you will need to select only full load.

21. Configure settings

<img width="1530" height="751" alt="{74B71C02-3DFF-469D-8CCB-3D8772442772}" src="https://github.com/user-attachments/assets/beef506c-97d7-476a-bb62-7450f0a827d5" />

### Note: Please follow the above Settings as it is in the clip. And Why? When ingesting raw data from MySQL DB to S3 bucket, the LOB is Settings should be configured properly in order to have load status (Load completed) or else you will see Load completed with errors.

22. Table mappings

<img width="1370" height="306" alt="{76029513-3F38-4D60-9B77-D36A0F2948D0}" src="https://github.com/user-attachments/assets/c2662867-4b5e-4c8d-b6fc-c73b1563984c" />

choose Wizard -> Add new selection rule -> enter schema and table details -> choose action include

you can add more selection rules if needed

23. Premigration assessment

<img width="1389" height="195" alt="{8D181A08-DD42-4AAA-B014-1465ABBB0D1D}" src="https://github.com/user-attachments/assets/cfcb0e3a-4bd7-4b2d-a226-b084fe1a8aa0" />

you can check this or leave out -> but it is a best practice to check

### Note: Please pre assess your migrations process to evaluate pre-requisites and limitations.

24. Migration task startup configuration

<img width="1372" height="192" alt="{DB608C70-A7B4-4BBD-B217-4280735998BC}" src="https://github.com/user-attachments/assets/1d953489-34b7-491f-ab64-8ce12044ea10" />

choose automatic.

25. Create task

Tips: If fails you will need to check replication instance IP and add the ip to your host.

## CONCLUSION: I have successfully created an S3 bucket to store raw data in parquest format. I have used Database migration service (DMS) to migrate data from MySQL DB to S3 Raw bucket.

## Result:

<img width="1088" height="245" alt="{0083C101-844C-4F2E-8B91-165F7237C883}" src="https://github.com/user-attachments/assets/84c534e2-70da-48bb-8bdf-952d86debd65" />

## Options / Sub Services Used:

1. S3 -> Create bucket
2. DMS -> Subnet groups -> Create subnet group
3. DMS -> Migrate or replicate -> Provisioned instances -> Create replication instance
4. DMS -> Migrate or replicate -> Endpoints -> Create Endpoint
5. DMS -> Migrate or replicate -> Task -> Create task

## Create Data Catelog for Raw bucket:

<img width="752" height="533" alt="{2758F16C-63C3-4796-B3D0-24A9616EBDA1}" src="https://github.com/user-attachments/assets/95c64db7-b946-445e-936c-4b9d3bed1ab4" />

Step1: Add database in AWS Glue

<img width="1884" height="320" alt="{EF701809-D4CC-4B59-BAD6-E15793B00C51}" src="https://github.com/user-attachments/assets/692f6f4a-29d2-4a1c-92e5-fbff77235f32" />

Step 2: Provide database details (name, description, database settings)

<img width="1144" height="508" alt="{E8CB610F-8211-4914-9F20-869629D551B4}" src="https://github.com/user-attachments/assets/d2e24648-7db2-4215-adf1-1a09efa731cb" />

Step 3: Create Glue Crawler

<img width="1612" height="297" alt="{B998FBC1-C324-45E5-B86F-F0F48704DB7F}" src="https://github.com/user-attachments/assets/633295ad-6a9c-425d-b1df-e6d4cf4a7c5d" />

Step 4: Set crawler properties

<img width="969" height="426" alt="{A3838C16-95DE-4EDF-88BF-C879A49BC908}" src="https://github.com/user-attachments/assets/ff10d510-d12b-41ef-b307-d7e03505ded0" />

Step 5: Add data source

<img width="595" height="819" alt="{DB3050E3-4932-48B0-9DCD-EC4307F96145}" src="https://github.com/user-attachments/assets/b0cf8053-7c36-4cf9-ba67-024e969d5317" />

Step 6: Configure security settings

<img width="1317" height="539" alt="{A39B30BC-1442-494F-9754-D1025422DA98}" src="https://github.com/user-attachments/assets/4d597359-1fd6-48c6-b822-1ef799e445ad" />

Step 7: Set Output and scheduling

<img width="1340" height="582" alt="{D10E2501-F071-4CA6-B446-C377A7039EB7}" src="https://github.com/user-attachments/assets/4e1119d0-fb14-46bd-a231-7a5c532990a2" />

choose your target database -> advanced options, look the below clip

<img width="1308" height="614" alt="{09FF5C1B-77FD-4B55-9816-B1DB4BDC51CF}" src="https://github.com/user-attachments/assets/31798d5a-4070-4c08-b805-b2088346f49f" />

choose Frequency using Crawler schedule

<img width="1299" height="148" alt="{99B3E349-AEBE-408A-A7AC-90762960D123}" src="https://github.com/user-attachments/assets/8294292c-a4ae-4eb8-905b-26d3b05742f6" />

Step 8: Review and create

## CONCLUSION: I have successfully created data catalog for raw_bucket using AWS Glue

### Result:

<img width="1596" height="190" alt="{9EEEE878-5774-4863-8A4B-B50B6E842685}" src="https://github.com/user-attachments/assets/51278864-3145-4f20-80e1-fbe324fba077" />

## Note: Sometimes Crawler run will get succeeded but have a look at the Table changes from last run (if it is dash (-)) it means the table load is unsucessful. If you experience such case, you will need update your IAM policy associated with AWS Glue.

<img width="869" height="784" alt="{66F69881-ED0F-45F4-8125-4B76788A967E}" src="https://github.com/user-attachments/assets/af21552c-aa71-4351-b22f-c68182d7a578" />

## Options / Sub Services Used:

1. AWS Glue -> Data Catalog -> Add Database
2. AWS Glue -> Data Catalog -> Crawlers
3. AWS Glue -> Data Catalog -> Tables
4. AWS Glue -> Data Catalog Tables

# Setup Transformed Zone

Step 1: Create a new s3 bucket to store transformed data

<img width="1628" height="781" alt="{A2D65C78-D316-4BA5-A6ED-EB73750E44A9}" src="https://github.com/user-attachments/assets/b6195570-dbeb-497e-8993-07957f7ed85c" />

Step 2: Create Glue Database for the transformed zone

<img width="1629" height="179" alt="{F61A085D-6125-48F7-BAD4-A89B5760B1CE}" src="https://github.com/user-attachments/assets/7579c453-3a5e-4da3-bd6a-81e884fd47f2" />

<img width="1633" height="554" alt="{46669EDC-6B53-4B09-8638-04EA5A8DCE4C}" src="https://github.com/user-attachments/assets/aead10d7-71ef-4298-ad84-2ab655c6ce36" />

Step 3: We Use Athena to perform transformation

<img width="925" height="783" alt="{0809E9B9-8D94-4F92-97BA-8FC0EAF733DE}" src="https://github.com/user-attachments/assets/9a877312-643b-4d0e-b741-1e70f3e4a419" />

### Note: You can either launch Trino SQL query editor or PySpark Editor

Step 4: Review Trino SQL editor in Athena

<img width="1841" height="655" alt="{21C5E5CD-BCE4-43E9-ADA7-9AC3CA3CB4B7}" src="https://github.com/user-attachments/assets/a789fc58-7a8b-4f0e-8096-1f02f79c4b70" />

Step 5: Run the below query to confirm whether raw table is visible

### Query: SHOW TABLES IN raw_zone_db;

## Important: Before you run your first query, you need to set up a query result location in Amazon S3.

Step 5.1: Configure query related editor settings

<img width="1641" height="402" alt="{02A457C7-948C-4F3C-921C-8AFAF3CFC158}" src="https://github.com/user-attachments/assets/bded512a-19a9-4430-a395-97da93d7d270" />

** you can create a dedicated folder in s3 to save Athena query results

<img width="1851" height="635" alt="{545A065C-9BC4-403D-85CE-B7FB9FCDB048}" src="https://github.com/user-attachments/assets/5b44b652-db4a-451b-be50-7aa455396d56" />

The query result is successful.

Step 6: I will convert all column names to lower case and then replace spaces with underscore

### Important Detail: Athena does not automatically change column names. So I should rebuild the SELECT list with renamed columns.

<img width="1499" height="832" alt="{BC46DB52-F7C9-4194-879B-60247350652B}" src="https://github.com/user-attachments/assets/622420c6-719b-4ba9-9be0-a884497e9a37" />

** The above transformation query - refer renamed_col.sql

Step 6.1: Generate the SELECT statement automatically

<img width="1491" height="819" alt="{D1614F80-0D7B-4E8D-9189-F9F15BB2F323}" src="https://github.com/user-attachments/assets/e8738baa-f1fc-433c-8bcb-297eb1539a5a" />

** The above transformation query - refer rename_select.sql

Step 6.2: Build Transformed Table, before that copy the output of previous query

<img width="1491" height="173" alt="{F07322FE-7D05-47F2-B1B6-013DB8B9F529}" src="https://github.com/user-attachments/assets/f3f2a1d4-1957-4921-b09e-116fa94b0e8d" />

** The above transformation query - refer rename_select.sql



















🛡️ Copyright & Compliance Notice

© 2025 PrasannaDataBus. All rights reserved.
This repository and its contents are intended solely for self learning and portfolio demonstration purposes.

All screenshots, configuration snippets, and architecture diagrams related to Amazon Web Services (AWS) are used under fair use for illustrative and informational purposes only.
AWS, the AWS logo, AWS Services and all related marks are trademarks of Amazon Web Services, Inc. or its affiliates.

No proprietary AWS data, credentials, or customer information are included.
Do not reuse or redistribute any part of this repository without explicit permission from the author.



























































