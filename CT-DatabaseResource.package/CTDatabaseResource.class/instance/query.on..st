as yet unclassified
query: aQuery on: aModel

	| myClass myData myDb myInstVars myObj |
	myClass := Smalltalk at: aModel asSymbol.
	myInstVars := myClass instVarNames.
	myData := OrderedCollection new.
	myDb := self database.

	( myDb execute: aQuery ) rows do: [ :r | 		
			myObj := myClass new.				
			myInstVars do: [ :i |
				myObj instVarNamed: i put: ( r at: i )  
			].				
			myData add: myObj.
		].

	^ myData.