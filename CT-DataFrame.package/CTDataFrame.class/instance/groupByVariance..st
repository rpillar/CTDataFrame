grouping
groupByVariance: aField

	| myFieldsDict myResult |
	myResult := Dictionary new.
	
	self groupset keysDo: [ :groupKey |
		myFieldsDict := self rotate: ( self groupset at: groupKey ).
		myResult at: groupKey put: ( ( myFieldsDict at: aField ) variance asInteger ).
	].

	^ myResult.