calculate
quantile: anArray

	"for the provided array of numbers this method returns an array of Q1, Q2, Q3 values"
	| q1 q2 q3 sortedArray |
	
	sortedArray := anArray asSortedCollection.
	q2 := sortedArray median.
	
	( sortedArray size odd ) 
		ifTrue: [  
			q1 := ( sortedArray copyFrom: 1 to: ( ( sortedArray size / 2 ) roundDownTo: 1 ) ) median.		
			q3 := ( sortedArray copyFrom: ( ( sortedArray size / 2 ) roundUpTo: 2 ) to: ( sortedArray size ) ) median.	
		]
		ifFalse: [  
			q1 := ( sortedArray copyFrom: 1 to: ( sortedArray size / 2 ) ) median.
			q3 := ( sortedArray copyFrom: ( ( sortedArray size / 2 ) + 1 ) to: ( sortedArray size ) ) median.
		].
	
	"reformat quamtile values if necessary - for floats only pass back with 2 decimal places"	
	q1 isFloat ifTrue: [ q1 := ( q1 round: 2 ) ].
	q2 isFloat ifTrue: [ q2 := ( q2 round: 2 ) ].
	q3 isFloat ifTrue: [ q3 := ( q3 round: 2 ) ].
		
	^ { q1 . q2 . q3 }