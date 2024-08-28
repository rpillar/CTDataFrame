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
		add: ( CTDictionary newFrom: { #name -> 'Jane' . #age -> 20 . #dob -> '1986-04-20' . #gender -> 'Female' } );
		yourself.
]

{ #category : 'tests' }
CTDataFrameTest >> testGroupBy [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	df groupBy: 'age'.
	self assert: ( df groupset size ) equals: 3.
	self assert: ( df groupset keys ) equals: #(21 19 20).
	self assert: ( df groupset at: 21 ) equals: ( OrderedCollection new; with: ( CTDictionary newFrom: { #name -> 'Richard' . #age -> 21 . #dob -> '1961-10-11' . #gender -> 'Male' } ) ).
]

{ #category : 'tests' }
CTDataFrameTest >> testGroupByMean [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	df groupBy: 'gender'.
	self assert: ( df groupset size ) equals: 2.
	self assert: ( df groupByMean: 'age' ) equals: ( CTDictionary newFrom: { #Female -> 20 . #Male -> 19.67 } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testGroupBySum [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	df selectAll.
	df groupBy: 'gender'.
	self assert: ( df groupset size ) equals: 2.
	self assert: ( df groupBySum: 'age' ) equals: ( CTDictionary newFrom: { #Female -> 20 . #Male -> 59 } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testGroupBySummarize [

	| df ctd ctd1 ctd2 |
	df := CTDataFrame new.

	ctd1 := CTDictionary new at: #age put: ( CTDictionary newFrom: { #max -> 20 . #mean -> 20 . #median -> 20 . #min -> 20 } ); yourself.
	ctd2 := CTDictionary new at: #age put: ( CTDictionary newFrom: { #max -> 21 . #mean -> 19.67 . #median -> 19 . #min -> 19 } ); yourself.
	ctd := CTDictionary new at: #Female put: ctd1 yourself; at: #Male put: ctd2; yourself.
	ctd.
	
	df loadData: baseCollection.
	df selectAll.
	df groupBy: 'gender'.
	self assert: ( df groupset size ) equals: 2.
	self assert: ( df groupBySummarize ) equals: ctd.
]

{ #category : 'tests' }
CTDataFrameTest >> testLoadData [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	self assert: ( df dataset ) equals: baseCollection.
	self assert: ( df metaData ) equals:  ( CTDictionary newFrom: { #name -> 'String' . #age -> 'Number' . #dob -> 'Date' . #gender -> 'String' } ).
]
