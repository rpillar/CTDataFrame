grouping
groupBySummarize

	"Min / Median / Mean / Max - of <number> fields in the groupset - populate summary
	Note - needs the groupBy method to be run so that <groupset> is populated. "
	| myData myFieldsDict myResult mySummary myValues |
	mySummary := Dictionary new.

	self groupset keysDo: [ :groupKey |
		myFieldsDict := self rotate: ( self groupset at: groupKey ).
		myResult := Dictionary new.
		myFieldsDict keysDo: [ :key |
			myValues := Dictionary new.
			myData := myFieldsDict at: key.
			myValues at: 'max' put: ( ( myData max ) round: 2 ); at: 'min' put: ( (myData min ) round: 2 ); at: 'mean' put: ( ( myData average ) round: 2 ) asFloat; at: 'median' put: ( ( myData median ) round: 2 ).
			myResult at: key put: myValues.
		].
		mySummary at: groupKey put: myResult.
	].

	^ mySummary.			