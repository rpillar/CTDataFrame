rendering
renderContentOn: html
	
	self messageComponent messageString: 'Please select a Shop, Start Time and then SET SCHEDULE in order to retrieve the data details for a shop at a regular  time (every 24 hours).'; messageType: 'info'.
	
	"do I have a time set for getShopNames at: 1"
	self scheduleStatus: false.
	self startTime: self getInitialShopTime.
	( self startTime ~= '' ) 
		ifTrue: [  
			self scheduleStatus: true.
		].
	
	self renderSetTransactionsScheduleContentOn: html.
	
	html document addLoadScript: ( ( JSStream on: '$(''.tooltipped'').tooltip()' ) ).
	html document addLoadScript: ( ( JSStream on: '$(''select'').material_select({ minimumResultsForSearch: Infinity })' ) ) .
	html document addLoadScript: ( ( JSStream on: '$(''.timepicker'').pickatime({ default: ''now'', fromnow: 0, twelvehour: false, donetext: ''OK'', cleartext: ''Clear'', canceltext: ''Cancel'', autoclose: false, ampmclickable: true, aftershow: function(){} })' ) ) .