action
rotate

	| myFieldValue myFieldValues myValuesDict |

	"rotate objects so that <field> values are in their own collections"
	myValuesDict := Dictionary new.
	
	(resultset at: 1) class instVarNames do: [ :field |  
		myFieldValues := OrderedCollection new.
		self resultset do: [ :each |  
			myFieldValue := each instVarNamed: field. 
			( myFieldValue isNumber )
				ifTrue: [ myFieldValues add: myFieldValue ]
				ifFalse: [ myFieldValues add: 0 ].
		].
		myValuesDict at: field put: myFieldValues.
	].

	^ myValuesDict.