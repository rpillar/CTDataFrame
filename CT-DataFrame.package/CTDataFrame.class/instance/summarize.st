calculate
summarize

	"Min / Median / Mean / Max - of <number> fields in resultset - populate summary"
	| myData myResults mySummary  myValuesDict |
	
	"rotate my resultset"
	myValuesDict := self rotate.
	
	mySummary := Dictionary new.
	(resultset at: 1) class instVarNames do: [ :field |
		myData := myValuesDict at: field.
		myResults := Dictionary new.
		myResults at: 'max' put: myData max; at: 'min' put: myData min; at: 'mean' put: ( ( ( myData sum ) / myData size ) round: 2 ); at: 'median' put: myData median.
		mySummary at: field put: myResults.
	].

	self summary: mySummary.