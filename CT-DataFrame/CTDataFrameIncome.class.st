"
Test class for CTDataFrame - instance variable are 'capitalized' to match the db field names.
"
Class {
	#name : 'CTDataFrameIncome',
	#superclass : 'CTDBxResult',
	#instVars : [
		'Date',
		'Takings',
		'Donations',
		'Total',
		'Day',
		'Week',
		'Month',
		'Year',
		'CustNumbers'
	],
	#category : 'CT-DataFrame',
	#package : 'CT-DataFrame'
}

{ #category : 'accessing' }
CTDataFrameIncome >> custNumbers [
	^ CustNumbers
]

{ #category : 'accessing' }
CTDataFrameIncome >> custNumbers: anObject [
	CustNumbers := anObject
]

{ #category : 'accessing' }
CTDataFrameIncome >> date [
	^ Date
]

{ #category : 'accessing' }
CTDataFrameIncome >> date: anObject [
	Date := anObject
]

{ #category : 'accessing' }
CTDataFrameIncome >> day [
	^ Day
]

{ #category : 'accessing' }
CTDataFrameIncome >> day: anObject [
	Day := anObject
]

{ #category : 'accessing' }
CTDataFrameIncome >> donations [
	^ Donations
]

{ #category : 'accessing' }
CTDataFrameIncome >> donations: anObject [
	Donations := anObject
]

{ #category : 'initialization' }
CTDataFrameIncome >> initialize [ 

	super initialize.
	self fields: #( Date Takings Donations Total Day Week Month Year CustNumbers ).
	self tableName: 'summary'.
	self primaryKey: ''.
	self rsPointer: 1.
]

{ #category : 'accessing' }
CTDataFrameIncome >> month [
	^ Month
]

{ #category : 'accessing' }
CTDataFrameIncome >> month: anObject [
	Month := anObject
]

{ #category : 'accessing' }
CTDataFrameIncome >> takings [
	^ Takings
]

{ #category : 'accessing' }
CTDataFrameIncome >> takings: anObject [
	Takings := anObject
]

{ #category : 'accessing' }
CTDataFrameIncome >> total [
	^ Total
]

{ #category : 'accessing' }
CTDataFrameIncome >> total: anObject [
	Total := anObject
]

{ #category : 'accessing' }
CTDataFrameIncome >> week [
	^ Week
]

{ #category : 'accessing' }
CTDataFrameIncome >> week: anObject [
	Week := anObject
]

{ #category : 'accessing' }
CTDataFrameIncome >> year [
	^ Year
]

{ #category : 'accessing' }
CTDataFrameIncome >> year: anObject [
	Year := anObject
]
