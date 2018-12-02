relation
relationChannels

| myArgsArray myChannels |
	
	myArgsArray := Array new: 1.
	myArgsArray at: 1 put: self userName.
	
	myChannels := self session dbResource query: 'select * from channel where userName = ?' with: myArgsArray  on: 'CTStockMANModelChannel'.
	^ myChannels.