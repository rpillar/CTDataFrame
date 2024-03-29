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
		( ( self metaData at: (groupKey asSymbol ) ) = 'Number' ) ifTrue: [
			myResults at: 'max' put: ( ( myData max ) round: 2 ); 
				at: 'min' put: ( ( myData min ) round: 2 ); 
				at: 'mean' put: ( ( myData average ) round: 2 ) asFloat; 
				at: 'median' put: ( ( myData median ) round: 2 ) asFloat; 
				at: 'variance' put: ( myData variance ) asInteger; 
				at: 'sd' put: ( myData standardDeviation ) asInteger;
				at: 'type' put: ( self metaData at: ( groupKey asSymbol ) );
				at: 'q1' put: ( ( myData quantile ) at: 1 );
				at: 'q2' put: ( ( myData quantile ) at: 2 );
				at: 'q3' put: ( ( myData quantile ) at: 3 ).
				"at: 'obs' put: myData asSet size."
		]
		ifFalse: [  
			myResults at: 'max' put: 'NA'; 
				at: 'min' put: 'NA'; 
				at: 'mean' put: 'NA'; 
				at: 'median' put: 'NA'; 
				at: 'variance' put: 'NA'; 
				at: 'sd' put: 'NA';
				at: 'type' put: 'String';
				at: 'q1' put: 'NA';
				at: 'q2' put: 'NA';
				at: 'q3' put: 'NA'.
				"at: 'obs' put: myData asSet size."
		].
		mySummary at: groupKey put: myResults.
	].

	^ mySummary.