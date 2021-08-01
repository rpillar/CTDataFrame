calculate
variance: aField

	"for the provided field calculate the population variance"
	
	| myField myFieldsDict |
	myField := aField asSymbol.
	
	myFieldsDict := self rotate: self resultset.
	^ ( myFieldsDict at: myField ) variance asInteger.