accessing
getTransactionData

	| myTransactions |
	
	myTransactions := self session dbResource query: 'select * from transaction_data order by start_date desc limit 5' on: 'CTStockMANModelTransactionData'. 

	^ myTransactions.