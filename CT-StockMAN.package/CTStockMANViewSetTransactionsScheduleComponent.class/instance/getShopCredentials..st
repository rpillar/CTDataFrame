accessing
getShopCredentials: aShopName

	| myArgs |
	
	"check that the shop credentials are set / active"
	myArgs := Array new: 1.
	myArgs at: 1 put: aShopName.
	
	^ ( self session dbResource query: 'select * from credentials where shopName = ?' with: myArgs  on: 'CTStockMANModelCredentials' ).