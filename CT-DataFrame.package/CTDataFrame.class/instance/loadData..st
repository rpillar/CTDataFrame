accessing
loadData: aCollection

	"load data into the dataframe - a collection of dictionary objects / create metadata"
	self dataset: aCollection.
	
	"set metaData for the current dataset"
	( self dataset at: 1 ) associationsDo: [ :pair|
		( pair value isNumber ) ifTrue: [ self metaData at: pair key asSymbol put: 'Number' ].
		( pair value isString ) ifTrue: [ self metaData at: pair key asSymbol put: 'String' ].
		"( value isDate ) ifTrue: [ self metaData at: key asSymbol put: 'Date' ]."
	].