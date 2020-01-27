# To the cloud
Attendees provision a new Cosmos DB account, using the SQL API, located in a resource group.
1. In the Azure Portal, navigate to Azure Cosmos DB and click on "Add" button.
2. Provision a new Cosmos DB account, using the SQL API, located in a new resource group.
![image](https://user-images.githubusercontent.com/11271493/73174909-39e45d80-4109-11ea-9a60-e224b448655a.png)

![image](https://user-images.githubusercontent.com/11271493/73174954-5aacb300-4109-11ea-8acf-b566aa2bd0dc.png)

3. When the account is created, navigate to the Data Explorer and create a new Database. Uncheck the "Provision throughput" option.
![image](https://user-images.githubusercontent.com/11271493/73177338-10c6cb80-410f-11ea-80ab-62116643ca07.png)

4. Have a look to the SQL Database schema to create containers (with defautl throughput : 400 RUs) according to the existing tables:
  - Orders
  - OrderDetails
  - Category
  - User
  - Events
  - Item
  - ItemAggregate
  - CartItem

5. 


# Migration
The preferred migration tool to Cosmos DB is Azure Data Factory, given its ability to perform migrations at scale, along with transformations and orchestration using several actions, if needed. Attendees could use Data Flows to connect to the SQL database, reference each table, apply transformations, and write to a Cosmos DB container(s). They could also choose to build a pipeline and define these actions instead.

Within the transformation steps, a good practice would be to add a new derived field that sets the entity type so different entities within the same container can be identified by type, for querying purposes. Attendees will perform optimizations in the next challenge, so don't expect full denormalization and ideal partition strategies at this point. The main goal is for attendees to perform a repeatable raw migration to their NoSQL database.
