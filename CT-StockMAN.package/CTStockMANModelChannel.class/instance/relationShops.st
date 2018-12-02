relation
relationShops

| myArgsArray myShops |
	
	myArgsArray := Array new: 1.
	myArgsArray at: 1 put: self channelName.
	
	myShops := self session dbResource query: 'select * from shops where channel = ?' with: myArgsArray  on: 'CTStockMANModelShop'.
	^ myShops.