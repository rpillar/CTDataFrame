accessing
checkShopCountForChannel: aChannel

	| myData myArgsArray |
	
	myArgsArray := Array new: 1.
	myArgsArray at: 1 put: aChannel.
	myData := self session dbResource query: 'select count(*) from shops where channel = ?' with: myArgsArray.
	
	^ myData at: 'count(*)' asSymbol.