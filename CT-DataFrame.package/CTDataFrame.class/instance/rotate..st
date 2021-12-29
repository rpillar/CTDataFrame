action
rotate: aCollection

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