# dbt-bigquery-demo

Ok, but what is DBT?
DBT is Data Build Tool, an open-source framework that helps analysts and engineers transform, test and document data in a warehouse. It's designed to simplify and standardize the development of data pipelines inside the lakehouse/data warehouse, in a lifecycle dbt is responsable for transformations after data is loaded, and store enriched/curated data inside wherehouse layer.

DBT is basically divided into 4 key concepts:

First one is Models:
They are basicaly the SQL selects, can reference views or tables either in your data warehouse.

Second is Macro:
Similar to functions in Python, these macro codes are design to simplify the code reusability process by reusing SQL code fragments across various models.

Third is Tests:
They are divided in Generic and Singular.
Generic are predefined are out-of-the-box tests that can be applied across multiple data models.
Singular are customized tests for a specific data model.

The forth is Snapshots:
Track (Type 2) slowly changing dimensions over time and track data history.

You will need a free dbt account (you can sign up for free, but limited to 1 project) and a GCP Big Query account (but you can use another Lakehouse/Data Warehouse as Azure, AWS or Snowflake, check the documentation for more details)
I generate 3 tables (by code), you can use them to replicate this tests, they are Orders, Customers and Products and they will be inside data_tables.

As I choose Big Query, log in BQ console and start a new project, inside it create a dataset (I created as demo_store_dataset)
Remembeer the dataset name, we will reference it in our SQL statements. Inside dataset, upload this 3 tables.
We will need a service account to connect dbt to Big Query, go to Google IAM (in cloud console), service account and create one with owner role. You can save this account information as .Json file or note the settings to use it later.

Go back to DBT and start your project, we need to set the Data Warehouse (in this case Google Big Query), set a connection name and indicate how we will connect. 
In this case, we can select the service account json file to automatically fill the informations or we can do it manually.
Then we need to set up a repository, I strongly recommend to link to your GitHub but you can manage it, GitClone or set GitLab.
As we need to indicate wich repository we shall connect, firstly create the repository in the hub you choose, then you will need to properly connect 
If everything is ok, start your project in IDE (to run in cloud IDE, in dbt website) or configure Cloud CLI to connect to your IDE (as Python for example).
The system will create the basic structure of dbt, macros, models, snapshots, tests, a dbt_project.yml file and a schema.yml.
I also recommend to create a branch to version control your dbt project.

In models basically we will store our SQL statements and materialize data, you can copy and paste the code from my GitHub, but remember to update the data_store_dataset to the one you created in BQ.
To run without errors, you need to save your models in models folder, and every file need to end with .sql 
If you want to test it, type dbt run <modelname>.sql in console below
The system will run the SQL, using Data Warehouse resourcers and store the results in the same dataset, If there is any errors, It will fail and the system will show what is wrong.
We can create a materialized view too, instead of a table, for this we can create a view folder inside models, and save the sql file (ending with .sql) inside it. We need to use {{(config(materialized='view'))}} in header to identify as view.


In macros we will store macro codes, you can use this codes inside other model.sql codes, they are speciall for reusability and automation.
We need to save in macros folder and end file with .sql again. To use it inside a model or view, use  {{get_date_parts('column')}}. 





