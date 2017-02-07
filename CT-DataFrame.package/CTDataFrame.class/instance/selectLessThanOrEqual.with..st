select
selectLessThanOrEqual: aField with: anArg
	
	| myField |
	self resultset: OrderedCollection new.
	myField := aField asSymbol.
	self dataset do: [ :each |  
		( ( each instVarNamed: myField ) <= anArg ) ifTrue: [	
				self resultset add: each
			].
		].