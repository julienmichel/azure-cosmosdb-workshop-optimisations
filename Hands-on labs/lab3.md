# Optimize NoSQL design

## Context
The team will begin evaluating query patterns as stated within the guide and as observed within the sample web application and 
related artifacts.  
At a high level, the following is a set of specific query patterns that Contoso has explained they want to make sure continue to work in 
the new design, are performant, and are cost-optimized for the following anticipated query volumes:  
  
  - Retrieve list of top 10 movies by biggest popularity and lowest price ~500 requests/second  
  
  - Retrieve the list of categories: ~500 requests/second  
  	
  - Filter movies (items) by category description: ~200 requests/second  
    
  - Retrieve orders with details showing products with quantities: ~10 requests/second  
	   
Contoso currently has 85,000 concurrent users during peak time, but would like to plan for 5 million concurrent users.  
Perform sizing exercise to determine anticipated scale requirements. Optimize the schema design to reduce scale requirements if possible.  

## Tasks
1. Open the Data Explorer  

2. Write the queries that will allow you to meet the previous requirements

3. Test your queries and evaluate the cost of each querie (nb of RUs)

4. Think about possible changes in your data model (embedding...) and to your indexing policies
  
5. Use ADF again to import optimized data model  
  
  
>### Tips  
>   - When optimizing your schema, consider the following:  
>     - The optimal partition key has been applied at the collection level for each collection.  
>     - Related documents/entities are collocated under the same partition. These should be entities that are most often retrieved together.  
>     - If appropriate, some related data is embedded. For example, if you return a product and want to include some information about the category (which may be stored in a different partition) without retrieving the entire category document. In other words, denormalization.  
>     - Adjust indexing appropriate for read or write-optimized workloads.  
>     - The most appropriate consistency model is selected based on usage patterns within the web application, and through testing.  
>   - Take care to consider the differences in modeling data for different data stores.  
>     - Avoid treating collections like tables and understand how multiple entity types can possibly be stored within the same collection.   
  
## Resources  
  - [Choosing a Data Model](https://docs.microsoft.com/azure/architecture/data-guide/big-data/non-relational-data)  
  - [Data Modeling for NoSQL](https://docs.microsoft.com/azure/cosmos-db/modeling-data)  
  - [Partitioning in Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/partitioning-overview)  
  - [Modeling and partitioning a real-world example on Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/how-to-model-partition-example)  
  - [Migrate one-to-few relational data into Azure Cosmos DB SQL API account](https://docs.microsoft.com/en-us/azure/cosmos-db/migrate-relational-to-cosmos-db-sql-api)
