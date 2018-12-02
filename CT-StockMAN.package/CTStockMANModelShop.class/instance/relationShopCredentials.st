relation
relationShopCredentials

| myArgsArray myShopCredentials |
	
	myArgsArray := Array new: 1.
	myArgsArray at: 1 put: self shopId.
	
	myShopCredentials := self session dbResource query: 'select * from credentials where shopId = ?' with: myArgsArray  on: 'CTStockMANModelCredentials'.
	^ myShopCredentials.