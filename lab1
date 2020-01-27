1 - To the cloud
Attendees provision a new Cosmos DB account, using the SQL API, located in a resource group.

2 - Migration
The preferred migration tool to Cosmos DB is Azure Data Factory, given its ability to perform migrations at scale, along with transformations and orchestration using several actions, if needed. Attendees could use Data Flows to connect to the SQL database, reference each table, apply transformations, and write to a Cosmos DB container(s). They could also choose to build a pipeline and define these actions instead.

Within the transformation steps, a good practice would be to add a new derived field that sets the entity type so different entities within the same container can be identified by type, for querying purposes. Attendees will perform optimizations in the next challenge, so don't expect full denormalization and ideal partition strategies at this point. The main goal is for attendees to perform a repeatable raw migration to their NoSQL database.
