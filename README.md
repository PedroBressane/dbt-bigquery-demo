# dbt-bigquery-demo

Ok, but what is DBT? 
DBT is Data Build Tool, an open-source framework that helps analysts and engineers transform, test and document data in a warehouse. It's designed to simplify and standardize the development of data pipelines inside the lakehouse/data warehouse, in a lifecycle dbt is responsable for transformations after data is loaded, and store enriched/curated data inside wherehouse layer.

DBT is basically divided into 3 major "modules", and a fourth to track data.

First one is Models:
They are basicaly the SQL selects, can reference models or tables either in your data warehouse. 

Second is Macro:
Similar to functions in Python, these macro codes are design to simplify the code reusability process by reusing SQL code fragments across various models.

Third is Tests: 
They are divided in Generic and Singular.
Generic are predefined are out-of-the-box tests that can be applied across multiple data models.
Singular are customized tests for a specific data model.

The forth is Snapshots:
Track (Type 2) slowly changing dimensions over time and track data history. 