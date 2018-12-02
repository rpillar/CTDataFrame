rendering
renderGetTransactionsDatesOn: html

	( self scheduleFlag = 1 ) 
		ifTrue: [
			html div 
				class: 'row';
				with: [ 
					self renderGetTransactionsStartDateOn: html.
					self renderGetTransactionsEndDateOn: html.
				]
		]
		ifFalse: [  
			html div 
				class: 'row';
				with: [ 
					self renderGetTransactionsStartDateOn: html.
					self renderGetTransactionsEndDateOn: html.
				].
			html div 
				class: 'row';
				with: [  
					self renderGetTransactionsScheduleDateOn: html.
					self renderGetTransactionsStartTimeOn: html.
				]
		].