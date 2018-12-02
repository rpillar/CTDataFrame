accessing
getChannelCredentialsInactive: aChannel

	| credentials myArgsArray |
	
	myArgsArray := Array new: 1.
	myArgsArray at: 1 put: aChannel.
	
	credentials := self session dbResource query: 'select * from credentials where channel = ? and active = 0' with: myArgsArray  on: 'CTStockMANModelCredentials'. 

	^ credentials size.