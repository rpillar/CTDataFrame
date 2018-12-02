accessing
channelCategoryNames: aChannel
	
	| counter myData categoryNames |
	myData := self session dbResource query: 'select categoryName from channel_categories where channel = ? ' with: ( Array with: aChannel ) on: 'CTStockMANModelCategory'.
	categoryNames := Array new: myData size.
	counter := 1.
	myData do: [ :each |
		categoryNames at: counter put: each categoryName.
		counter := counter + 1.
	].

	^ categoryNames.