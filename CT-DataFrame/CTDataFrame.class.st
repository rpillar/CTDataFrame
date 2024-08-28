"
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

Dependencies
============

NeoCSV
NeoJSON
CTCollection


"
Class {
	#name : 'CTDataFrame',
	#superclass : 'Object',
	#instVars : [
		'dataset',
		'fields',
		'groupset',
		'metaData',
		'resultset',
		'series'
	],
	#category : 'CT-DataFrame-Base',
	#package : 'CT-DataFrame',
	#tag : 'Base'
}

{ #category : 'transform' }
CTDataFrame >> addColumn: aField with: aBlock [

	"add a column to our dataframe based on evaluating the contents of the block passed in"
	self dataset do: [ :each |
		each at: ( aField asSymbol ) put: aBlock value.
	].

	^ self.			
]

{ #category : 'accessing' }
CTDataFrame >> dataset [
	^ dataset ifNil: [ dataset := CTCollection new ].
]

{ #category : 'accessing' }
CTDataFrame >> dataset: anObject [
	dataset := anObject
]

{ #category : 'accessing' }
CTDataFrame >> fields [
	^ fields
]

{ #category : 'accessing' }
CTDataFrame >> fields: anObject [
	fields := anObject
]

{ #category : 'grouping' }
CTDataFrame >> groupBy: aField [

	"groupset is a dictionary - keys are the distinct values for <aField> / values are the related OrderedCollection of dictionaries."
	self groupset: ( self resultset  groupedBy: [ :i | i at: aField. ] ).	
]

{ #category : 'grouping' }
CTDataFrame >> groupByMean: aField [

	"return a dictionary with the 'mean' of the specified field - for the current groupset (created using a 'previous' groupBy:"
	| myFieldsDict myResult |
	myResult := CTDictionary new.
	
	self groupset keysDo: [ :groupKey |
		myFieldsDict := self rotate: ( self groupset at: groupKey ).
		( myResult at: groupKey put: ( ( myFieldsDict at: aField ) average asFloat round: 2 ) ).
	].

	^ myResult.
]

{ #category : 'grouping' }
CTDataFrame >> groupBySum: aField [

	"return a dictionary with the 'sum' of the specified field - for the current groupset (created using a 'previous' groupBy:"
	| myFieldsDict myResult |
	myResult := CTDictionary new.
	
	self groupset keysDo: [ :groupKey |
		myFieldsDict := self rotate: ( self groupset at: groupKey ).
		myResult at: groupKey put: ( ( myFieldsDict at: aField ) sum round: 2 ).
	].

	^ myResult.
]

{ #category : 'grouping' }
CTDataFrame >> groupBySummarize [

	"Min / Median / Mean / Max - of <number> fields in the groupset - populate summary
	Note - needs the groupBy method to be run so that <groupset> is populated.
	Note - summary data id ONLY returned for <Number> fields"
	
	| myData myFieldsDict myResult mySummary myValues |
	mySummary := CTDictionary new.

	self groupset keysDo: [ :groupKey |
		myFieldsDict := self rotate: ( self groupset at: groupKey ).
		myResult := CTDictionary new.
		myFieldsDict keysDo: [ :key |
			( ( self metaData at: key ) = 'Number' ) ifTrue: [
				myValues := CTDictionary new.
				myData := myFieldsDict at: key.
				myValues at: 'max' put: ( ( myData max ) round: 2 ); at: 'min' put: ( (myData min ) round: 2 ); at: 'mean' put: ( ( myData average ) round: 2 ) asFloat; at: 'median' put: ( ( myData median ) round: 2 ).
				myResult at: key put: myValues.
			].
		].
		mySummary at: groupKey put: myResult.
	].

	^ mySummary.			
]

{ #category : 'grouping' }
CTDataFrame >> groupByVariance: aField [

	| myFieldsDict myResult |
	myResult := Dictionary new.
	
	self groupset keysDo: [ :groupKey |
		myFieldsDict := self rotate: ( self groupset at: groupKey ).
		myResult at: groupKey put: ( ( myFieldsDict at: aField ) variance asInteger ).
	].

	^ myResult.
]

{ #category : 'accessing' }
CTDataFrame >> groupset [
	^ groupset
]

{ #category : 'accessing' }
CTDataFrame >> groupset: anObject [
	groupset := anObject
]

{ #category : 'grouping' }
CTDataFrame >> groupsetToJsonString [

	"returns the groupset as a JSON string"
	^ NeoJSONWriter toString: self groupset.
]

{ #category : 'initialization' }
CTDataFrame >> initialize [

	super initialize.
	self resultset: CTCollection new.
	self metaData: CTDictionary new.
]

{ #category : 'accessing' }
CTDataFrame >> loadData: aCollection [

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
				self metaData at: pair key asSymbol put: 'String'.
				
				"test for a Date - I'm sure this could be done in a better way - but for now ..."
				[ ( ( pair value asDate ) isMemberOf: Date ) 
					ifTrue: [ self metaData at: pair key asSymbol put: 'Date'. ] 
				] on: Error do: [ '' ].
			].
	].
]

{ #category : 'calculate' }
CTDataFrame >> max: aField [

	| myField myFieldsDict |
	
	myField := aField asSymbol.
   myFieldsDict := self rotate: self resultset.

	^ ( myFieldsDict at: myField ) max.
]

{ #category : 'calculate' }
CTDataFrame >> mean: aField [

	| myField myFieldsDict |
	
	myField := aField asSymbol.
   myFieldsDict := self rotate: self resultset.

	^ ( ( myFieldsDict at: myField ) average round: 2 ) asFloat.
]

{ #category : 'accessing' }
CTDataFrame >> metaData [

	^ metaData.
]

{ #category : 'accessing' }
CTDataFrame >> metaData: anObject [

	metaData := anObject
]

{ #category : 'calculate' }
CTDataFrame >> min: aField [

	| myField myFieldsDict |
	
	myField := aField asSymbol.
   myFieldsDict := self rotate: self resultset.

	^ ( myFieldsDict at: myField ) min.
]

{ #category : 'calculate' }
CTDataFrame >> quantile: anArray [

	"for the provided array of numbers this method returns an array of Q1, Q2, Q3 values"
	| q1 q2 q3 sortedArray |
	
	sortedArray := anArray asSortedCollection.
	q2 := sortedArray median.
	
	( sortedArray size odd ) 
		ifTrue: [  
			q1 := ( sortedArray copyFrom: 1 to: ( ( sortedArray size / 2 ) roundDownTo: 1 ) ) median asFloat.		
			q3 := ( sortedArray copyFrom: ( ( sortedArray size / 2 ) roundUpTo: 2 ) to: ( sortedArray size ) ) median asFloat.	
		]
		ifFalse: [  
			q1 := ( sortedArray copyFrom: 1 to: ( sortedArray size / 2 ) ) median asFloat.
			q3 := ( sortedArray copyFrom: ( ( sortedArray size / 2 ) + 1 ) to: ( sortedArray size ) ) median asFloat.
		].
	
	"reformat quantile values if necessary - for floats only pass back with 2 decimal places"	
	q1 isFloat ifTrue: [ q1 := ( q1 round: 2 ) ].
	q2 isFloat ifTrue: [ q2 := ( q2 round: 2 ) ].
	q3 isFloat ifTrue: [ q3 := ( q3 round: 2 ) ].
		
	^ { q1 . q2 . q3 }
]

{ #category : 'transform' }
CTDataFrame >> removeColumn: aColumn [

	"remove a column from our dataframe"
	self dataset do: [ :each |
		each removeKey: ( aColumn asSymbol )
	].

	^ self.			
]

{ #category : 'accessing' }
CTDataFrame >> resultset [
	^ resultset
]

{ #category : 'accessing' }
CTDataFrame >> resultset: anObject [
	resultset := anObject
]

{ #category : 'printing' }
CTDataFrame >> resultsetToJsonString [

	"returns the resulset as a JSON string"
	^ NeoJSONWriter toString: self resultset.
]

{ #category : 'action' }
CTDataFrame >> rotate: aCollection [

	| myFieldValue myFieldValues myValuesDict |

	"rotate objects so that <field> values are in their own collections - specifically used for numeric operations on the contents of the 'values' array"
	myValuesDict := Dictionary new.
	
	(aCollection at: 1) keysDo: [ :field |  
		myFieldValues := CTCollection new.
		aCollection do: [ :each |  
			myFieldValue := each at: field. 
			( myFieldValue isNumber )
				ifTrue: [ myFieldValues add: myFieldValue ]
				ifFalse: [ myFieldValues add: 0 ].
		].
		myValuesDict at: field put: myFieldValues.
	].

	^ myValuesDict.
]

{ #category : 'select' }
CTDataFrame >> selectAll [

	self resultset: CTCollection new.
	self resultset: ( self dataset collect: [ :each | each ] ).
]

{ #category : 'select' }
CTDataFrame >> selectAllValuesForField: aField [
	
	| myField |

	self resultset: CTCollection new.
	myField := aField asSymbol.

	self resultset: ( self dataset collect: [ :each | each at: myField ] ).
	
	^ self.
]

{ #category : 'select' }
CTDataFrame >> selectAllWithSubset: aFieldsArray [

	"create a subset of the _full_ dataset by only selecting a subset of possible fields. These will go to create your resultset"
	
	| myData myField |
	
	self dataset do: [ :data |
		myData := Dictionary new.
		aFieldsArray do: [ :aField | 
			myField := aField asSymbol.
			myData at: myField put: ( data at: myField ).
		].
		self resultset add: myData.
	].
	
	^ self.
]

{ #category : 'select' }
CTDataFrame >> selectEquals: aField with: anArg [
	
	| myField |

	self resultset: CTCollection new.
	myField := aField asSymbol.
	
	self resultset: ( self dataset select: [ :each |  
		( ( each at: myField ) = anArg ) 
	] ).
	
	^ self.
]

{ #category : 'select' }
CTDataFrame >> selectEquals: aField with: anArg and: anotherField with: anotherArg [
	
	| data firstField secondField |

	self resultset: CTCollection new.
	firstField := aField asSymbol.
	secondField := anotherField asSymbol.
		
	data := ( self dataset select: [ :each |  
		( ( each at: firstField ) = anArg ) 
	] ).

	self resultset: ( data select: [ :each |  
		( ( each at: secondField ) = anotherArg ) 
	] ).
	
	^ self.
]

{ #category : 'select' }
CTDataFrame >> selectGreaterThan: aField with: anArg [
	
	| myField |
	self resultset: CTCollection new.
	myField := aField asSymbol.
	
	self resultset: ( self dataset select: [ :each |  
		( ( each at: myField ) > anArg )
	] ).
]

{ #category : 'select' }
CTDataFrame >> selectGreaterThanOrEqual: aField with: anArg [
	
	| myField |
	self resultset: CTCollection new.
	myField := aField asSymbol.
	
	self resultset: ( self dataset select: [ :each |  
		( ( each at: myField ) >= anArg )
	] ).
]

{ #category : 'select' }
CTDataFrame >> selectLessThan: aField with: anArg [
	
	| myField |
	self resultset: CTCollection new.
	myField := aField asSymbol.
	
	self resultset: ( self dataset select: [ :each |   
		( ( each at: myField ) < anArg )
	] ).
]

{ #category : 'select' }
CTDataFrame >> selectLessThanOrEqual: aField with: anArg [
	
	| myField |
	self resultset: CTCollection new.
	myField := aField asSymbol.
	
	self resultset: ( self dataset select: [ :each |  
		( ( each at: myField ) <= anArg )
	] ).
]

{ #category : 'select' }
CTDataFrame >> selectUniqueValuesFor: aField [
	
	| myData myField mySet |

	myField := aField asSymbol.
	myData := ( self dataset collect: [ :each | each at: myField ] ).
	mySet := Set withAll: myData.

	^ self resultset: mySet asOrderedCollection.
]

{ #category : 'accessing' }
CTDataFrame >> series [
	^ series
]

{ #category : 'accessing' }
CTDataFrame >> series: anObject [
	series := anObject
]

{ #category : 'select' }
CTDataFrame >> seriesDataWith: aField [

	"set series based on the current _resultset_ of the specified _field_"
	| seriesData |
	seriesData := CTCollection new.
	seriesData := ( self resultset collect: [ :each | each at: aField ] ).
	
	self series: seriesData.
	
	^ self.
]

{ #category : 'select' }
CTDataFrame >> seriesGroupDataWith: aField [

	"set series based on the current _groupset_ - of the specified _field_"
	| data seriesData |
	data := Dictionary new.
	self groupset keysDo: [ :k | 
		seriesData := CTCollection new.
		seriesData := ( self groupset at: k ) collect: [ :each | each at: aField ].
		data at: k put: seriesData. 
	].
	self series: data.

	^ self.
]

{ #category : 'calculate' }
CTDataFrame >> standardDev: aField [

	"compute the standard deviation for the specified field 
	 - the stdev message in <Collection> is a <sample> standard dev - we want to
	 cover the whole <population>."
	| myCount myDeviations myField myValue myValues myVariance |
	
	myField := aField asSymbol.
	myValues := Array new: resultset size.
	myDeviations := Array new: resultset size.
	
	myCount := 1.
	self resultset do: [ :each | 
		myValue := each at: myField. 
		myValues at: myCount put: myValue.
		myCount := myCount + 1.
	].

	myCount := 1.
	myValues do: [  :each |
		myDeviations at: myCount put: ( ( each - myValues average ) ** 2 ).
		myCount := myCount + 1.
	].
	myVariance := myDeviations sum / myDeviations size.
	
	^ myVariance sqrt round: 2.

	
]

{ #category : 'calculate' }
CTDataFrame >> sum: aField [

	| myField myFieldsDict |
	myField := aField asSymbol.
	
	myFieldsDict := self rotate: self resultset.
	^ ( myFieldsDict at: myField ) sum round: 2.
]

{ #category : 'calculate' }
CTDataFrame >> summarize [

	"Min / Median / Mean / Max - of <number> fields in resultset - populate summary"
	| myData myResults mySummary myValuesDict |
	mySummary := Dictionary new.
		
	"rotate my resultset"
	myValuesDict := self rotate: self resultset.

	myValuesDict keysDo: [ :groupKey |
		myData := myValuesDict at: groupKey.

		myResults := Dictionary new.
		( ( self metaData at: (groupKey asSymbol ) ) = 'Number' ) ifTrue: [
			myResults at: 'max' put: ( ( myData max ) round: 2 ); 
				at: 'min' put: ( ( myData min ) round: 2 ); 
				at: 'mean' put: ( ( myData average ) round: 2 ) asFloat; 
				at: 'median' put: ( ( myData median ) round: 2 ) asFloat; 
				at: 'variance' put: ( myData variance ) asInteger; 
				at: 'sd' put: ( myData standardDeviation ) asInteger;
				at: 'type' put: ( self metaData at: ( groupKey asSymbol ) );
				at: 'q1' put: ( ( myData quantile ) at: 1 );
				at: 'q2' put: ( ( myData quantile ) at: 2 );
				at: 'q3' put: ( ( myData quantile ) at: 3 ).
				"at: 'obs' put: myData asSet size."
		]
		ifFalse: [  
			myResults at: 'max' put: 'NA'; 
				at: 'min' put: 'NA'; 
				at: 'mean' put: 'NA'; 
				at: 'median' put: 'NA'; 
				at: 'variance' put: 'NA'; 
				at: 'sd' put: 'NA';
				at: 'type' put: 'String';
				at: 'q1' put: 'NA';
				at: 'q2' put: 'NA';
				at: 'q3' put: 'NA'.
				"at: 'obs' put: myData asSet size."
		].
		mySummary at: groupKey put: myResults.
	].

	^ mySummary.
]

{ #category : 'printing' }
CTDataFrame >> toJsonString [

	"returns the series as a JSON string"
	^ NeoJSONWriter toString: self series.
]

{ #category : 'printing' }
CTDataFrame >> toJsonString: aCollection [

	"returns the collection as a JSON string"
	^ NeoJSONWriter toString: aCollection.
]

{ #category : 'transform' }
CTDataFrame >> transformColumnData: aColumn with: aRegex replacingMatchesWith: aString [

	"amend the column data based on the supplied regex and match string"
	| amendedData |
	self dataset do: [ :each |
		amendedData := aRegex copy: ( each at: ( aColumn asSymbol ) ) replacingMatchesWith: aString.
		each at: ( aColumn asSymbol ) put: amendedData.		 
	].

	^ self.			
]

{ #category : 'calculate' }
CTDataFrame >> variance: aField [

	"for the provided field calculate the population variance"
	
	| myField myFieldsDict |
	myField := aField asSymbol.
	
	myFieldsDict := self rotate: self resultset.
	^ ( myFieldsDict at: myField ) variance asInteger.
]
