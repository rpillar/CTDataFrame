rendering
renderGetTransactionsButtonsOn: html

	html div 
		with: [ 
			( self scheduleFlag = 2 ) 
				ifTrue: [   
					self renderGetTransactionsScheduleButtonsOn: html.
				]
				ifFalse: [  
					self renderGetTransactionsNowButtonsOn: html.
				]
		].		