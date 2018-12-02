accessing
renderTransactionButtonsSetTransactionScheduleOn: html

	| mySetTransactionsScheduleComponent |
	mySetTransactionsScheduleComponent := CTStockMANViewSetTransactionsScheduleComponent new.
	
	html div
		class: 'col s3';
		with: [
			html anchor 
				class: 'btn-large waves-effect waves-light hoverable modal-trigger'; 
				style: 'margin-left:20px;';
				url: '#set-transactions-schedule-modal';	
				script: (
 					( html jQuery this )
 						on: 'click'
 						do: ( (
							( ( html jQuery class: 'collapsible-header' ) removeClass: 'active' ),		
							( ( html jQuery class: 'collapsible-body' ) cssAt: 'display' put: 'none' ),
   							( ( html jQuery id: 'set-transactions-schedule-modal' ) load html: [ :r | r render: mySetTransactionsScheduleComponent ] )			
 						) asFunction: #(event) )
 				);			
				with: 'Set a Schedule'.		
		].