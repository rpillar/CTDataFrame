as yet unclassified
getTransactionDataFor: aShopName

	| myArgs |
	
	myArgs := Array new: 5.
	myArgs at: 1 put: aShopName.
	myArgs at: 2 put: self startDate, 'T', '00:00:00.000Z'.
	myArgs at: 3 put: self endDate, 'T', '00:00:00.000Z'.
	myArgs at: 4 put: self startDate, 'T', '23:59:59.999Z'.
	myArgs at: 5 put: self endDate, 'T', '23:59:59.999Z'.
		
	^ ( self session dbResource query: 'select * from transaction_data where shopName = ? AND ( ( start_date BETWEEN ? AND ?) OR ( end_date BETWEEN ? AND ? ) )' with: myArgs  on: 'CTStockMANModelTransactionData' ).