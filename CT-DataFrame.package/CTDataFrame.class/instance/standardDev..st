calculate
standardDev: aField

	"compute the standard deviation for the specified field 
	 - the stdev message in <Collection> is a <sample> standard dev - we want to
	 cover the whole <population>."
	| myCount myDeviations myField myValue myValues myVariance |
	
	myField := aField asSymbol.
	myValues := Array new: resultset size.
	myDeviations := Array new: resultset size.
	
	myCount := 1.
	self resultset do: [ :each | 
		myValue := each instVarNamed: myField. 
		myValues at: myCount put: myValue.
		myCount := myCount + 1.
	].

	myCount := 1.
	myValues do: [  :each |
		myDeviations at: myCount put: ( ( each - myValues average ) ** 2 ).
		myCount := myCount + 1.
	].
	myVariance := myDeviations sum / myDeviations size.
	
	^ myVariance sqrt round: 2.

	