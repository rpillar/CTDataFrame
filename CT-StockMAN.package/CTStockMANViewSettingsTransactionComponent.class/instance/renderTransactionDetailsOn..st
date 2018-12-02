accessing
renderTransactionDetailsOn: html

	| transactionData |
	transactionData := self getTransactionData.
	"transactionDataObject := 'test'."
	
	html div 
		with: [ 
			html table 
				id: 'transaction-management-table';
				class: 'bordered';
				with: [ 
					self renderTransactionDetailsHeaderOn: html.
					html tableBody 
						id: 'transaction-management-table-body';
						with: [ 
							transactionData do: [ :each |
								self renderTransactionDataLineOn: html with: each. 
							].
						]
				]. 
			html paragraph
				id: 'transaction-management-no-data';
				style: 'font-size:18px;font-weight:500;margin-bottom:10px;margin-top:5px;';
				with: 'No transaction data has currently been retrieved.'
		].
	
	"attach to the transactions table a count of the number of rows. Display / hide the transaction data table depending on the rowcount."
	html document addLoadScript: ( 
		( JSStream on: 'var rowCount = $(''#transaction-management-table >tbody >tr'').length; $(''#transaction-management-table-body'').data( "rowCounter", rowCount ); console.log(''This is the row counter : '' + rowCount); if ( rowCount == 0 ) { $(''#transaction-management-table'').hide(); } else { $(''#transaction-management-no-data'').hide(); }' ) 
	).