rendering
renderContentOn: html

	"| myGetTransactionsComponent |
	myGetTransactionsComponent := CTStockMANViewGetTransactionsComponent new."
	
	self renderTransactionDetailsOn: html.
	self renderTransactionButtonsOn: html.