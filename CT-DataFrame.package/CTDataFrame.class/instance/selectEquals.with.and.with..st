select
selectEquals: aField with: anArg and: anotherField with: anotherArg
	
	| data firstField secondField |

	self resultset: OrderedCollection new.
	firstField := aField asSymbol.
	secondField := anotherField asSymbol.
		
	data := ( self dataset select: [ :each |  
		( ( each at: firstField ) = anArg ) 
	] ).

	self resultset: ( data select: [ :each |  
		( ( each at: secondField ) = anotherArg ) 
	] ).
	
	^ self.