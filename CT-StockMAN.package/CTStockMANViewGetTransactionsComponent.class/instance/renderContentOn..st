rendering
renderContentOn: html

	( scheduleFlag = 1 )
		ifTrue: [  
			self messageComponent messageString: 'Please select a Shop, Start and End dates and then GET DATA in order to retrieve the data for a shop.'; messageType: 'info'.
		]
		ifFalse: [  
			self messageComponent messageString: 'Please select a Shop, Data and Schedule dates and then SET SCHEDULE in order to schedule the retrieval of data.'; messageType: 'info'.
		].
	
	"Get Transactions page ..."		
	self renderGetTransactionsContentOn: html.
	
	html document addLoadScript: ( ( JSStream on: '$(''.tooltipped'').tooltip()' ) ).
	html document addLoadScript: ( ( JSStream on: '$(''select'').material_select({ minimumResultsForSearch: Infinity })' ) ) .
	html document addLoadScript: ( ( JSStream on: '$(''.datepicker'').pickadate({ selectMonths: true, selectYears: 15, today: ''Today'', clear: ''Clear'', close: ''OK'', closeOnSelect: false, formatSubmit: ''yyyy-mm-dd'', hiddenName: true })' ) ) .
	html document addLoadScript: ( ( JSStream on: '$(''.timepicker'').pickatime({ default: ''now'', fromnow: 0, twelvehour: false, donetext: ''OK'', cleartext: ''Clear'', canceltext: ''Cancel'', autoclose: false, ampmclickable: true, aftershow: function(){} })' ) ) .