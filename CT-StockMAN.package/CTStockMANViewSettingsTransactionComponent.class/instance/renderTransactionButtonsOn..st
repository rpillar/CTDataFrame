accessing
renderTransactionButtonsOn: html

	html div 
		class: 'row get-transactions';
		style: 'margin-top:35px;';
		with: [
			self renderTransactionButtonsSetTransactionScheduleOn: html. 
			self renderTransactionButtonsGetTransactionsOn: html.
		].