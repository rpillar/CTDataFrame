accessing
renderTransactionButtonsScheduleGetTransactionsOn: html

	| myGetTransactionsComponent |
	myGetTransactionsComponent := CTStockMANViewGetTransactionsComponent new.
	
	html div
		class: 'col s3';
		with: [
			html anchor 
				class: 'btn-large waves-effect waves-light hoverable modal-trigger'; 
				style: 'margin-left:20px;';
				url: '#get-transactions-modal';	
				script: (
 					( html jQuery this )
 						on: 'click'
 						do: ( (
							( ( html jQuery class: 'collapsible-header' ) removeClass: 'active' ),		
							( ( html jQuery class: 'collapsible-body' ) cssAt: 'display' put: 'none' ),
   							( ( html jQuery id: 'get-transactions-modal' ) load html: [ :r | myGetTransactionsComponent scheduleFlag: 2. r render: myGetTransactionsComponent ] )			
 						) asFunction: #(event) )
 				);			
				with: 'Schedule GET'.		
		].