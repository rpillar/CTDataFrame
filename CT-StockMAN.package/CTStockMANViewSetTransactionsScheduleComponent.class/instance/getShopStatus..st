accessing
getShopStatus: aShopName

	| myArgs |
	
	myArgs := Array new: 1.
	myArgs at: 1 put: aShopName.
	
	^ ( self session dbResource query: 'select * from shops where shopName = ?' with: myArgs  on: 'CTStockMANModelShop' ).