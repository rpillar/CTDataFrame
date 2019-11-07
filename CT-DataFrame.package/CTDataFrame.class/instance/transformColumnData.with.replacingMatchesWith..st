transform
transformColumnData: aColumn with: aRegex replacingMatchesWith: aString

	"amend the column data based on the supplied regex and match string"
	| amendedData |
	self dataset do: [ :each |
		amendedData := aRegex copy: ( each at: ( aColumn asSymbol ) ) replacingMatchesWith: aString.
		each at: ( aColumn asSymbol ) put: amendedData.		 
	].

	^ self.			