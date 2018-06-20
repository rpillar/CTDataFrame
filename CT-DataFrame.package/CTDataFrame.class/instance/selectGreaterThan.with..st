select
selectGreaterThan: aField with: anArg
	
	| myField |
	self resultset: OrderedCollection new.
	myField := aField asSymbol.
	
	self resultset: ( self dataset select: [ :each |  
		( ( each instVarNamed: myField ) > anArg )
	] ).