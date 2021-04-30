select
selectAllValuesForField: aField
	
	| myField |

	self resultset: OrderedCollection new.
	myField := aField asSymbol.

	self resultset: ( self dataset collect: [ :each | each at: myField ] ).
	
	^ self.