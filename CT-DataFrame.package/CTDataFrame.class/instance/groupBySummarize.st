calculate
groupBySummarize

	"Min / Median / Mean / Max - of <number> fields in resultset - populate summary"
	| myData myFieldsDict myResult mySummary myValues |
	mySummary := Dictionary new.

	self groupset keysDo: [ :groupKey |
		myFieldsDict := self rotate: ( self groupset at: groupKey ).
		myResult := Dictionary new.
		myFieldsDict keysDo: [ :key |
			myValues := Dictionary new.
			myData := myFieldsDict at: key.
			myValues at: 'max' put: myData max; at: 'min' put: myData min; at: 'mean' put: ( ( myData average ) round: 2 ) asFloat; at: 'median' put: myData median.
			myResult at: key put: myValues.
		].
		mySummary at: groupKey put: myResult.
	].

	^ mySummary.			