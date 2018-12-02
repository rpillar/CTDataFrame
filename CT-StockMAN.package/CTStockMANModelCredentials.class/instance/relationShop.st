relation
relationShop

| myArgsArray myShop |
	
	myArgsArray := Array new: 1.
	myArgsArray at: 1 put: self shopId.
	
	myShop := self session dbResource query: 'select * from shops where shopId = ?' with: myArgsArray  on: 'CTStockMANModelShop'.
	^ myShop.