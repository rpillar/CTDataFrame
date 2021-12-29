select
selectAllValuesForField: aField
	
	| myField |

	self resultset: CTCollection new.
	myField := aField asSymbol.

	self resultset: ( self dataset collect: [ :each | each at: myField ] ).
	
	^ self.