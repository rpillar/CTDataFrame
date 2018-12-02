accessing
processShopDescriptionInput: aValue
	"how can this be made generic ?"

	aValue 
		ifNil: [ nil ]
		ifNotNil: [ self shopDescription: aValue ].