# CTDataFrame #
Experiment - a 'dataframe' object (like in 'R') - structured as an OrderedCollection the elements of which are the observations - these could be loaded from a CSV file or from a database table. Each 'observation' is a dictionary - note that both CTDBx and CTCSV output 'dictionary data'.

Operations to retrieve subsets of the collection based on the comparison method used. Methods - `mean` / `sum` / `summarize` are provided - more will be added. 

Example (taking data from a SQLite db) - the `CTDataFrameIncome` class defines the database table from which the data will be retrieved :-
```
| df q r |
df := CTDataFrame new.
q := CTDBxQuery new.
q queryTable: 'CTDataFrameIncome'; dbSearch: { { #year -> 13 } }.
r := CTDataFrameIncome new.
r conn: ( UDBCSQLite3Connection on: '/Users/richardpillar/temp/csv.db').
r conn open.
r resultset: ( r processSearchQuery: ( q queryString ) ).
r conn close.
df dataset: r resultset.
df inspect.
```
For _things_ to work it is necessary to 'select' data :- 
```
df selectEquals: 'Year' with: 13. 
```
Operations can only performed on data that has been selected. Internally the `resultset` instance variable is populated with the 'selected' data - and all operations are performed against that `resultset`. On that basis we can do :-
```
df mean: 'Takings'.
df sum: 'Takings'.
```
The `summarize` method will provide a _summary_ of the _numeric_ fields that are part of the `resultset` :-
```
df summarize.
```
To load a dataframe from a CSV file :-
```
| c df |
c := CTCSV new.
df := CTDataFrame new.
c loadFromCSVFile: '/Users/richardpillar/temp/income.csv'.
df dataset: c data.
df selectEquals: 'Year' with: 13.
df inspect. 
```
This does assume that the first row always contains the column headers - which become the keys in the Dataframe dictionary.

It is possible to export the _contents_ of the dataframe `resultset` to JSON :- 
```
| c df j |
c := CTCSV new.
df := CTDataFrame new.
c loadFromCSVFile: '/Users/richardpillar/temp/income.csv'.
df dataset: c data.
df selectEquals: 'Year' with: 13.
j := df resultsetToJsonString.
j inspect.
```
For graphs / visualisations it may be necessary to send _series_ data (based on a particular field) to the graphing software. For this purpose the method `seriesDataWith: aField` can be used to populate the `series` collection that is then converted to a JSON string using the `toJsonString` method :-
```
| c df j |
c := CTCSV new.
df := CTDataFrame new.
c loadFromCSVFile: '/Users/richardpillar/temp/income.csv'.
df dataset: c data.
df selectEquals: 'Year' with: 13.
df seriesDataWith: 'Takings'.
j := df toJsonString.
j inspect.
```

## Dependencies ##
```
Metacello new
  repository: 'github://svenvc/NeoJSON/repository';
  baseline: 'NeoJSON';
  load.

Gofer it
   smalltalkhubUser: 'SvenVanCaekenberghe' project: 'Neo';
   configurationOf: 'NeoCSV';
   loadStable.
```
Load the `CTCSV` package from my Github repo using the Monticello Browser.
Load the `CTDBx` package from my Github repo using the Monticello Browser.
