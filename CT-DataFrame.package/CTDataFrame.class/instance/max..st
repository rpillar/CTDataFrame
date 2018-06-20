calculate
max: aField

	| myField myFieldsDict |
	
	myField := aField asSymbol.
   myFieldsDict := self rotate: self resultset.

	^ ( myFieldsDict at: myField ) max.