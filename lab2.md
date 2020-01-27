# Migration
The preferred migration tool to Cosmos DB is Azure Data Factory, given its ability to perform migrations at scale, along with transformations and orchestration using several actions, if needed. 

1. From the Azure portal, got to Data Factories and create a new instance by clicking the "Add" button.
2. Give it a name, select the resource group you created in the previous lab, a region and unchecked the "enable GIT" option.
3. When the deployment if finished, open the new Data Factory instance and click on Author&Monitor  
![image](https://user-images.githubusercontent.com/11271493/73179751-4de18c80-4114-11ea-8b64-b544a6d333b0.png)
4. In the ADF Editor homepage, click on the Copy Data activity
![image](https://user-images.githubusercontent.com/11271493/73179875-85503900-4114-11ea-8995-3716dfe78eed.png)
5. Define a name, then define the source with SQL Database, the destination with the newly created Cosmos DB account
  - To define the source, select new connection in the Azure tab, then select SQL Managed Instance and set the connection string
  - Select the tables to copy and go next
  - To define the destination, selection new connection in the Azure tab, then select Azure Cosmos DB (SQL API) and set the connection string
  - Start the configuration of the mapping between tables.
  - When everything is done, validate until the deployment page and execute the copy pipeline
6. 

Within the transformation steps, a good practice would be to add a new derived field that sets the entity type so different entities within the same container can be identified by type, for querying purposes. Attendees will perform optimizations in the next challenge, so don't expect full denormalization and ideal partition strategies at this point. The main goal is for attendees to perform a repeatable raw migration to their NoSQL database.
