calculate
sum: aField

	| myField myResult myValue |
	myField := aField asSymbol.
	myResult := 0.
	self resultset do: [ :each | 
		myValue := each instVarNamed: myField. 
		myResult := myResult + myValue.
	].
	
	^ myResult round: 2.