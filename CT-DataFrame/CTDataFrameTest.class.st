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

	baseCollection := OrderedCollection new; 
		with: ( CTDictionary newFrom: { #name -> 'Richard' . #age -> 21 . #dob -> '1961-10-11' } ); 
		with: ( CTDictionary newFrom: { #name -> 'Jo' . #age -> 19 . #dob -> '1987-04-10' } ).
]

{ #category : 'tests' }
CTDataFrameTest >> testLoadData [

	| df |
	df := CTDataFrame new.
	df loadData: baseCollection.
	self assert: ( df dataset ) equals: baseCollection.
	self assert: ( df metaData ) equals:  ( CTDictionary newFrom: { #name -> 'String' . #age -> 'Number' . #dob -> 'Date' } ).
]
