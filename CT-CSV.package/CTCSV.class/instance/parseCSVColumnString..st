accessing
parseCSVColumnString: aString

	"attempt to parse the colum string and return the appropriate type."
	| col |
	
	[ aString asDate. col := aString ] on: Exception do: [  
		[ col := NeoNumberParser parse: aString. ] on: Error do: [ col := aString ].
	].

	^ col.