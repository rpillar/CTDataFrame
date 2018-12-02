accessing
checkShopCount

	| myData |
	myData := self session dbResource query: 'select count(*) from shops'.
	
	^ myData at: 'count(*)' asSymbol.