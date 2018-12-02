accessing
getInitialShopTime

	| myArgs myData myInitialShop  |
	
	myInitialShop := self getShopNames at: 1.
	
	myArgs := Array new: 2.
	myArgs at: 1 put: 'EBay'.
	myArgs at: 2 put: myInitialShop.
	
	myData := self session dbResource query: 'select * from transaction_schedule_data where channel = ? and shopName = ?' with: myArgs  on: 'CTStockMANModelTransactionScheduleData'.

	^ ( myData at: 1 ) schedule_time.