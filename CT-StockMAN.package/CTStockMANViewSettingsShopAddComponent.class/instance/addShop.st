accessing
addShop

	| myArgsArray myData myShop |
	
	"add shop details"
	myData := Array new: 4.
	myData at: 1 put: self shopName.
	myData at: 2 put: self shopDescription.
	myData at: 3 put: self channel.
	myData at: 4 put: 'Not Active'.	
	self session dbResource insert: 'shops' fields: #(shopName shopDescription channel status) with: myData. 

	"return a shop model"
	myArgsArray := Array new: 1.
	myArgsArray at: 1 put: self shopName.
	myShop := self session dbResource query: 'select * from shops where shopName = ?' with: myArgsArray  on: 'CTStockMANModelShop'. 
	
	^ myShop at: 1.
	
