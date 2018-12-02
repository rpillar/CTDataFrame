accessing
renderTransactionDataLineOn: html with: dataObject

	| myShopName |
	myShopName := self parseShopName: ( dataObject shopName ).
	
	html tableRow 
		with: [  
			html tableData 
				with: dataObject channel.
			html tableData 
				with: myShopName.
			html tableData 
				with: ( dataObject start_date ) asDate.
			html tableData 
				with: ( dataObject end_date ) asDate.	
			html tableData 
				with: dataObject transaction_count.
		].