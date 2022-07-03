accessing
loadData: aCollection

	"load data into the dataframe - a collection of dictionary objects / create metadata"
	self dataset: aCollection.

	"set metaData for the current dataset"
	( self dataset at: 1 ) associationsDo: [ :pair |
		( pair value isNumber ) ifTrue: 
			[ 
				self metaData at: pair key asSymbol put: 'Number' 
			].
		( pair value isString ) ifTrue: 
			[ 
				"( [ pair value asDate ] on: Error do: [ ^false ] ) ifFalse: [ self metaData at: pair key asSymbol put: 'String' ]"
				self metaData at: pair key asSymbol put: 'String'.
				
				"test for a Date - I'm sure this could be done in a better way - but for now ..."
				[ ( ( pair value asDate ) isMemberOf: Date ) 
					ifTrue: [ self metaData at: pair key asSymbol put: 'Date'. ] 
				] on: Error do: [ '' ].
			].
	].