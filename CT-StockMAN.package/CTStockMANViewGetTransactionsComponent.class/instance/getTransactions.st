as yet unclassified
getTransactions

	| channelAPI data myData response responseDict |
	
	"note that for Ebay the dates must be in Zulu format - so update with defaults."
	( self channel = 'EBay' ) ifTrue: [ 
		channelAPI := CTStockMANEBayManage new. 
		channelAPI myEbay credentials: self shopCredentials.
		response := channelAPI getEBayTransactionsForDaysStarting: ( self startDate, 'T', '00:00:00.000Z' ) ending: ( self endDate, 'T', '23:59:59.999Z' ).

		responseDict := Dictionary new.
		( response code = 500 ) 
			ifFalse: [
				"parse the getCategories response - XML"
				data := self parseGetEBayTransactionsResponse: response.
			]
			ifTrue: [ 
				responseDict at: #message put: 'There has been a problem. Please check the format of your request and the system logs for details.'.
				responseDict at: #dataCount put: 0.
				^ responseDict.
			].
	].
	
	"store details of the request."
	data do: [ :e |
		myData := Array new: 6.
		myData at: 1 put: self channel.
		myData at: 2 put: self shopName.
		myData at: 3 put: Timespan current asDateAndTime.
		myData at: 4 put: self startDate, 'T', '00:00:00.000Z'.
		myData at: 5 put: self endDate, 'T', '23:59:59.999Z'.
		myData at: 6 put: ( e at: #TotalNumberOfEntries ).		
		self session dbResource insert: 'transaction_data' fields: #(channel shopName retrieval_date start_date end_date transaction_count ) with: myData. 
	].

	"return the number of transactions retrieved."
	responseDict at: #message put: 'Success'.
	responseDict at: #dataCount put: ( myData at: 6 ).
	^ responseDict.