Experiment - a 'dataframe' object (like in 'R') - structured as an OrderedCollection the elements of which are the observations - these could be loaded from a CSV file or from a database table. Each 'observation' is a dictionary - note that both CTDBx and CTCSV output 'dictionary data'.

Operations to retrieve subsets of the collection based on the comparison method used. Methods - mean / sum / summarize are provided - more will be added. 

Example (taking data from a SQLite db) :-

| db dataframe |
db := CTDBxIncomeTable new.
dataframe := CTDataFrame new.
db database dbConnection: ( UDBCSQLite3Connection on: '/csv.db' ).
db database dbConnection open.
db dbSearchAll.
dataframe dataset: db dbResultset.
dataframe inspect.

For _things_ to work it is necessary to 'select' data :- 

dataframe selectEquals: 'Year' with: 13. 

Operations can only performed on data that has been selected. Internally the 'resultset' instance variable is populated with the 'selected' data - and all operations are performed against that resultset. On that basis we can do :-

dataframe mean: 'Takings'.
dataframe sum: 'Takings'.

It is also possible to _group_ data using the method groupBy: <field> - this will populate the <groupset> field with a collection of Dictionaries. :-

dataframe groupBy: 'Month':

