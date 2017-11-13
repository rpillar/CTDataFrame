# CTDataFrame
A 'dataframe'-like class built using Pharo (Smalltalk). Inspired by 'R'.

```
| database dataframe dbResource modelData |
"populate dataframe ..."
dataframe := CTDataFrame new.
dbResource := CTDatabaseResource new.
database := ( UDBCSQLite3Connection on: '<pathto>/income.db' ).
database open.
dbResource database: database.
modelData := dbResource query: 'select Date, Takings, Donations, Total, Day, Week, Month, Year, CustNumbers from summary' on: 'CTTestModelIncome'.
dataframe dataset: modelData.

"First step - <select> the data that you want to work with - selectAll / selectEquals: ..."
dataframe selectEquals: 'Year' with: 13.

"get a <mean>"
dataframe selectAll; mean: 'Takings'.

"group data - by 'Month' for example and then calculate a <max> value for a particular field. This
will return a <Dictionary> - the 'keys' will be the 'Month' values."
dataframe groupBy: 'Month'; groupByMean: 'Takings'.

"summarize data - return <max> / <min> / <standard dev> / <mean> for each field."
dataframe summarize.

"summarize data by group"
dataframe groupBy: 'Month'; groupSummarize.
```
