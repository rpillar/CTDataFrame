as yet unclassified
insert: aTable fields: aFieldsArray with: anArgsArray

	| query myDb myFieldsString myValuesString |

	myDb := self database.

	"create the fields portion of the query"
	myFieldsString := '('.
	aFieldsArray do: [ :each | myFieldsString := myFieldsString, each ] separatedBy: [ myFieldsString := myFieldsString , ','].
	myFieldsString := myFieldsString, ')'.
		
	"create the values portion of the query"
	myValuesString := '('.
	anArgsArray do: [ :each | myValuesString := myValuesString, '?' ] separatedBy: [myValuesString := myValuesString, ',' ].
	myValuesString := myValuesString, ')'.

	query := 'insert into ', aTable, ' ', myFieldsString, ' values ', myValuesString.

	myDb execute: query with: anArgsArray.