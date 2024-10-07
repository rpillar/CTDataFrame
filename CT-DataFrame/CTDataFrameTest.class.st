Class {
	#name : 'CTDataFrameTest',
	#superclass : 'TestCase',
	#instVars : [
		'baseCollection',
		'baseDataFrame'
	],
	#category : 'CT-DataFrame-Tests',
	#package : 'CT-DataFrame',
	#tag : 'Tests'
}

{ #category : 'running' }
CTDataFrameTest >> setUp [
	super setUp.

	baseCollection := OrderedCollection new
		add: ( CTDictionary newFrom: { #name -> 'Richard' . #age -> 21 . #dob -> '1961-10-11' . #gender -> 'Male' } ); 
		add: ( CTDictionary newFrom: { #name -> 'Jo' . #age -> 19 . #dob -> '1987-04-10' . #gender -> 'Male' } );
		add: ( CTDictionary newFrom: { #name -> 'Mark' . #age -> 19 . #dob -> '1987-04-20' . #gender -> 'Male' } );
		add: ( CTDictionary newFrom: { #name -> 'Dawn' . #age -> 20 . #dob -> '1986-04-20' . #gender -> 'Female' } );
		add: ( CTDictionary newFrom: { #name -> 'John' . #age -> 23 . #dob -> '1986-05-20' . #gender -> 'Male' } );
		add: ( CTDictionary newFrom: { #name -> 'Jack' . #age -> 22 . #dob -> '1987-01-19' . #gender -> 'Male' } );
		add: ( CTDictionary newFrom: { #name -> 'Marie' . #age -> 21 . #dob -> '1988-02-28' . #gender -> 'Female' } );
		add: ( CTDictionary newFrom: { #name -> 'Marian' . #age -> 24 . #dob -> '1987-04-21' . #gender -> 'Female' } );
		add: ( CTDictionary newFrom: { #name -> 'Shalay' . #age -> 25 . #dob -> '1986-04-20' . #gender -> 'Female' } );
		add: ( CTDictionary newFrom: { #name -> 'Steve' . #age -> 27 . #dob -> '1989-06-20' . #gender -> 'Male' } );
		add: ( CTDictionary newFrom: { #name -> 'Clare' . #age -> 21 . #dob -> '1982-09-20' . #gender -> 'Female' } );
		add: ( CTDictionary newFrom: { #name -> 'Liz' . #age -> 22 . #dob -> '1981-05-01' . #gender -> 'Female' } );
		add: ( CTDictionary newFrom: { #name -> 'Donald' . #age -> 22 . #dob -> '1987-03-04' . #gender -> 'Male' } );
		add: ( CTDictionary newFrom: { #name -> 'Matt' . #age -> 23 . #dob -> '1987-06-23' . #gender -> 'Male' } );
		add: ( CTDictionary newFrom: { #name -> 'Lucy' . #age -> 29 . #dob -> '1988-01-29' . #gender -> 'Female' } );
		add: ( CTDictionary newFrom: { #name -> 'Laura' . #age -> 28 . #dob -> '1984-01-30' . #gender -> 'Female' } );
		add: ( CTDictionary newFrom: { #name -> 'Eleanor' . #age -> 27 . #dob -> '1987-10-01' . #gender -> 'Female' } );
		add: ( CTDictionary newFrom: { #name -> 'Doris' . #age -> 21 . #dob -> '1988-05-29' . #gender -> 'Female' } );
		add: ( CTDictionary newFrom: { #name -> 'Dave' . #age -> 22 . #dob -> '1984-01-24' . #gender -> 'Male' } );
		add: ( CTDictionary newFrom: { #name -> 'Jamie' . #age -> 25 . #dob -> '1985-11-20' . #gender -> 'Male' } );
		yourself.
]

{ #category : 'tests' }
CTDataFrameTest >> testGroupBy [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	df groupBy: 'gender'.
	self assert: ( df groupset size ) equals: 2.
	self assert: ( df groupset keys ) equals: #('Male' 'Female').
	self assert: ( ( df groupset at: 'Male' ) first ) equals: ( CTDictionary newFrom: { #name -> 'Richard' . #age -> 21 . #dob -> '1961-10-11' . #gender -> 'Male' } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testGroupByMean [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	df groupBy: 'gender'.
	self assert: ( df groupset size ) equals: 2.
	self assert: ( df groupByMean: 'age' ) equals: ( CTDictionary newFrom: { #Female -> 23.8 . #Male -> 22.3 } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testGroupBySum [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	df groupBy: 'gender'.
	self assert: ( df groupset size ) equals: 2.
	self assert: ( df groupBySum: 'age' ) equals: ( CTDictionary newFrom: { #Female -> 238 . #Male -> 223 } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testGroupBySummarize [

	| df ctd ctd1 ctd2 |
	df := CTDataFrame new.

	ctd1 := CTDictionary new at: #age put: ( CTDictionary newFrom: { #max -> 29 . #mean -> 23.8 . #median -> 23 . #min -> 20 } ); yourself.
	ctd2 := CTDictionary new at: #age put: ( CTDictionary newFrom: { #max -> 27 . #mean -> 22.3 . #median -> 22 . #min -> 19 } ); yourself.
	ctd := CTDictionary new at: #Female put: ctd1 yourself; at: #Male put: ctd2; yourself.
	ctd.
	
	df loadData: baseCollection.
	df selectAll.
	df groupBy: 'gender'.
	self assert: ( df groupset size ) equals: 2.
	self assert: ( df groupBySummarize ) equals: ctd.
]

{ #category : 'tests' }
CTDataFrameTest >> testGroupByVariance [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	df groupBy: 'gender'.
	self assert: ( df groupset size ) equals: 2.
	self assert: ( df groupByVariance: 'age' ) equals: ( CTDictionary newFrom: { #Female -> 9 . #Male -> 5 } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testGroupsetToJsonString [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectEquals: 'name' with: 'Richard'.
	df groupBy: 'gender'.
	self assert: ( df groupset size ) equals: 1.
	self assert: ( df groupsetToJsonString ) equals: '{"Male":[{"age":21,"dob":"1961-10-11","gender":"Male","name":"Richard"}]}'.
]

{ #category : 'tests' }
CTDataFrameTest >> testLoadData [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	self assert: ( df dataset ) equals: baseCollection.
	self assert: ( df metaData ) equals:  ( CTDictionary newFrom: { #name -> 'String' . #age -> 'Number' . #dob -> 'Date' . #gender -> 'String' } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testMax [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	self assert: ( df max: 'age' ) equals: 29.
]

{ #category : 'tests' }
CTDataFrameTest >> testMean [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	self assert: ( df mean: 'age' ) equals: 23.05.
]

{ #category : 'tests' }
CTDataFrameTest >> testMin [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	self assert: ( df min: 'age' ) equals: 19.
]

{ #category : 'tests' }
CTDataFrameTest >> testQuantile [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	self assert: ( df quantile: ( df selectAllValuesForField: 'age') ) equals: #(21.0 22 25.0).
]

{ #category : 'tests' }
CTDataFrameTest >> testResultsetToJsonString [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectEquals: 'name' with: 'Richard'.
	self assert: ( df resultset size ) equals: 1.
	self assert:  ( ( df resultset ) first ) equals: ( CTDictionary newFrom: { #age -> 21 . #dob -> '1961-10-11' . #gender -> 'Male' . #name -> 'Richard' } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testSelectAll [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	self assert:  ( ( df resultset ) first ) equals: ( CTDictionary newFrom: { #age -> 21 . #dob -> '1961-10-11' . #gender -> 'Male' . #name -> 'Richard' } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testSelectAllValuesForField [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	self assert: ( df selectAllValuesForField: 'age' ) equals: #(21 19 19 20 23 22 21 24 25 27 21 22 22 23 29 28 27 21 22 25).
]

{ #category : 'tests' }
CTDataFrameTest >> testSelectAllWithSubset [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAllWithSubset: #( 'age' 'name' ).
	self assert:  ( ( df resultset ) first ) equals: ( CTDictionary newFrom: { #age -> 21 . #name -> 'Richard' } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testSelectEqualsWith [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectEquals: 'name' with: 'Richard'.
	self assert: ( df resultset size ) equals: 1.
	self assert:  ( ( df resultset ) first ) equals: ( CTDictionary newFrom: { #age -> 21 . #dob -> '1961-10-11' . #gender -> 'Male' . #name -> 'Richard' } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testSelectEqualsWithAndWith [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectEquals:  'gender' with: 'Female' and: 'age' with: 21.
	self assert:  ( df resultset ) equals: ( OrderedCollection 
		with: ( CTDictionary newFrom: { #age -> 21 . #dob -> '1988-02-28' . #gender -> 'Female' . #name -> 'Marie' } ) 
		with: ( CTDictionary newFrom: { #age -> 21 . #dob -> '1982-09-20' . #gender -> 'Female' . #name -> 'Clare' } ) 
		with: ( CTDictionary newFrom: { #age -> 21 . #dob -> '1988-05-29' . #gender -> 'Female' . #name -> 'Doris' } )  ).
]

{ #category : 'tests' }
CTDataFrameTest >> testSelectGreaterThanOrEqualWith [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectGreaterThanOrEqual: 'age' with: 29.
	self assert:  ( df resultset ) equals: ( OrderedCollection with: ( CTDictionary newFrom: { #age -> 29 . #dob -> '1988-01-29' . #gender -> 'Female' . #name -> 'Lucy' } ) ).
]

{ #category : 'tests' }
CTDataFrameTest >> testSelectGreaterThanWith [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectGreaterThan: 'age' with: 28.
	self assert:  ( df resultset ) equals: ( OrderedCollection with: ( CTDictionary newFrom: { #age -> 29 . #dob -> '1988-01-29' . #gender -> 'Female' . #name -> 'Lucy' } ) ).
]

{ #category : 'tests' }
CTDataFrameTest >> testSelectLessThanOrEqualWith [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectLessThanOrEqual: 'age' with: 19.
	self assert:  ( df resultset ) equals: ( OrderedCollection with: ( CTDictionary newFrom: { #age -> 19 . #dob -> '1987-04-10' . #gender -> 'Male' . #name -> 'Jo' } ) with: ( CTDictionary newFrom: { #age -> 19 . #dob -> '1987-04-20' . #gender -> 'Male' . #name -> 'Mark' } ) ).
]

{ #category : 'tests' }
CTDataFrameTest >> testSelectLessThanWith [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectLessThan: 'age' with: 20.
	self assert:  ( df resultset ) equals: ( OrderedCollection with: ( CTDictionary newFrom: { #age -> 19 . #dob -> '1987-04-10' . #gender -> 'Male' . #name -> 'Jo' } ) with: ( CTDictionary newFrom: { #age -> 19 . #dob -> '1987-04-20' . #gender -> 'Male' . #name -> 'Mark' } ) ).
]

{ #category : 'tests' }
CTDataFrameTest >> testSelectUniqueValuesFor [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectUniqueValuesFor:  'gender'.
	self assert:  ( df resultset ) equals: ( OrderedCollection with: 'Female' with: 'Male' ).
]
