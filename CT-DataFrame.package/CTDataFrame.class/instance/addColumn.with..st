transform
addColumn: aField with: aBlock

	"add a column to our dataframe based on evaluating the contents of the block passed in"
	self dataset do: [ :each |
		each at: ( aField asSymbol ) put: aBlock value.
	].

	^ self.			