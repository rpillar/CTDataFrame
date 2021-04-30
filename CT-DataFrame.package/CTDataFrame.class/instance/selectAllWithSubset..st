select
selectAllWithSubset: aFieldsArray

	"create a subset of the _full_ dataset by only selecting a subset of possible fields. These will go to create your resultset"
	
	| myData myField |
	
	self dataset do: [ :data |
		myData := Dictionary new.
		aFieldsArray do: [ :aField | 
			myField := aField asSymbol.
			myData at: myField put: ( data at: myField ).
		].
		self resultset add: myData.
	].
	
	^ self.