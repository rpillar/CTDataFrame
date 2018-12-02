select
selectLessThan: aField with: anArg
	
	| myField |
	self resultset: OrderedCollection new.
	myField := aField asSymbol.
	
	self resultset: ( self dataset select: [ :each |   
		( ( each at: myField ) < anArg )
	] ).