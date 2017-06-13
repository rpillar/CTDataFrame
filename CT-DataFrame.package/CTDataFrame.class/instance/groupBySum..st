calculate
groupBySum: aField

	| myFieldsDict myResult |
	myResult := Dictionary new.
	
	self groupset keysDo: [ :groupKey |
		myFieldsDict := self rotate: ( self groupset at: groupKey ).
		myResult at: groupKey put: ( ( myFieldsDict at: aField ) sum round: 2 ).
	].

	^ myResult.