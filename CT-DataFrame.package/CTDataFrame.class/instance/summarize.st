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
		myResults at: 'max' put: myData max; at: 'min' put: myData min; at: 'mean' put: ( ( myData average ) round: 2 ); at: 'median' put: myData median.
		mySummary at: groupKey put: myResults.
	].

	^ mySummary.