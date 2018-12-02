relation
relationShopsActive

| myArgsArray myShops |
	
	myArgsArray := Array new: 2.
	myArgsArray at: 1 put: self channelName.
	myArgsArray at: 2 put: 'Active'.
		
	myShops := self session dbResource query: 'select * from shops where channel = ? and status = ?' with: myArgsArray  on: 'CTStockMANModelShop'.
	( myShops isNotEmpty )
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ].