as yet unclassified
delete: aTable with: anObject
	
	| myDb  myQueryString |
	myDb := self database.

	"delete from table where id = 1"
	myQueryString := 'delete from ', aTable, ' where ', anObject tablePrimaryKey, '=', ( anObject instVarNamed: anObject tablePrimaryKey ) asString, ';'.
	myDb execute: myQueryString.

	