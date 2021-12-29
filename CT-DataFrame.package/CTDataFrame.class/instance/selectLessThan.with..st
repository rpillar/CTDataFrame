select
selectLessThan: aField with: anArg
	
	| myField |
	self resultset: CTCollection new.
	myField := aField asSymbol.
	
	self resultset: ( self dataset select: [ :each |   
		( ( each at: myField ) < anArg )
	] ).