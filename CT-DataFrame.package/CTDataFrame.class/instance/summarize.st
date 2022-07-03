calculate
summarize

	"Min / Median / Mean / Max - of <number> fields in resultset - populate summary"
	| myData myResults mySummary myValuesDict |
	mySummary := Dictionary new.
		
	"rotate my resultset"
	myValuesDict := self rotate: self resultset.

	myValuesDict keysDo: [ :groupKey |
		myData := myValuesDict at: groupKey.

		myResults := Dictionary new.
		myResults at: 'max' put: ( ( myData max ) round: 2 ); 
			at: 'min' put: ( ( myData min ) round: 2 ); 
			at: 'mean' put: ( ( myData average ) round: 2 ) asFloat; 
			at: 'median' put: ( ( myData median ) round: 2 ) asFloat; 
			at: 'variance' put: ( myData variance ) asInteger; 
			at: 'type' put: ( self metaData at: ( groupKey asSymbol ) ).
			"at: 'obs' put: myData asSet size."
		mySummary at: groupKey put: myResults.
	].

	^ mySummary.