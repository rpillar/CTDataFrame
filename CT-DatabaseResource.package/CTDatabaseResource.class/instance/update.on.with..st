as yet unclassified
update: aTable on: aModel with: anObject

	"pass in a populated model object - process"
	
	| myDb myInstVars myQueryString |
	
	"myInstVars := aModel asClass instVarNames."
	myInstVars := ( self class environment at: aModel asSymbol ) instVarNames.
	myDb := self database.

	"update table set x = y where id = 1"
	myQueryString := 'update ', aTable, ' set '.			
	myInstVars do: [ :i | 
		myQueryString := myQueryString, i, '="', ( anObject instVarNamed: i ) asString, '",' 
	].

	myQueryString := myQueryString allButLast.
	myQueryString := myQueryString, ' where ', anObject tablePrimaryKey, '=', ( anObject instVarNamed: anObject tablePrimaryKey ) asString, ';'.
	myDb execute: myQueryString.

	