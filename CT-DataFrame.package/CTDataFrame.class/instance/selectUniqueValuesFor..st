select
selectUniqueValuesFor: aField
	
	| myData myField mySet |

	myField := aField asSymbol.
	myData := ( self dataset collect: [ :each | each at: myField ] ).
	mySet := Set withAll: myData.

	^ self resultset: mySet asOrderedCollection.