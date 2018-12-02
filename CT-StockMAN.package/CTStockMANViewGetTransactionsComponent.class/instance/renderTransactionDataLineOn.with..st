rendering
renderTransactionDataLineOn: html with: transactionCount
	
	html tableRow 
		with: [  
			html tableData 
				with: self channel.
			html tableData 
				with: self shopName.
			html tableData 
				with: self startDate asDate.
			html tableData 
				with: self endDate asDate.	
			html tableData 
				with: transactionCount.
		].