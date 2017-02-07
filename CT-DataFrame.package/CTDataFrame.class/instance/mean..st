calculate
mean: aField

	| myField myResult myTotal myValue |
	myField := aField asSymbol.
	myTotal := 0.
	self resultset do: [ :each | 
		myValue := each instVarNamed: myField. 
		myTotal := myTotal + myValue.
	].
	
	^ myResult := ( myTotal / ( self resultset size ) ) round: 2.