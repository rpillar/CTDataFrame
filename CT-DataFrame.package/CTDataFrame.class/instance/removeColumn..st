transform
removeColumn: aColumn

	"remove a column from our dataframe"
	self dataset do: [ :each |
		each removeKey: ( aColumn asSymbol )
	].

	^ self.			