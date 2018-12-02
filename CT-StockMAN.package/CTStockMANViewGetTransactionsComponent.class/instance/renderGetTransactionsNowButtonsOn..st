rendering
renderGetTransactionsNowButtonsOn: html

	| response validGetTransactionsStatus |
	
	html div 
		with: [ 
			html div
				class: 'col s6';
				style: 'margin-top:25px;margin-bottom: 20px;';
				with: [ 
					html button 
						bePush;
						class: 'btn-large waves-effect waves-light hoverable'; 
						id: 'get-transactions-now-button';
						script: ( html jQuery this 
							on: 'click'
							do: (
								( ( html jQuery id: 'get-transactions-now-button' ) addClass: 'disabled' ),
								( ( html jQuery id: 'get-transactions-now-button' ) text: 'Processing' )
							)
						);
						script: ( html jQuery this
							on: 'click'
							do: ( 	( ( html jQuery ajax )
								serializeForm;
								"get the number of rows in the transactions table."
								callback: [ :val | self tableRowCounter: val. 
										( self tableRowCounter = 'undefined' ) 
											ifTrue: [ self tableRowCounter: 0 ]. ] 
									value: ( ( html jQuery id: 'transaction-management-table-body' ) dataAt: 'rowCounter' );
								script: [ :s | 
									( self tableRowCounter = 0 ) 
										ifTrue: [  
											s << ( JSStream on: 'console.log(''table is empty / not there ...'');' ).
										].
									validGetTransactionsStatus := self validateGetTransactions.
									( validGetTransactionsStatus = '' )
										ifTrue: [ 
											"response - a dictionary with #message / #dataCount."
											response := self getTransactions.
											( ( ( response at: #message ) ) = 'Success' ) & ( ( ( response at: #dataCount ) asInteger ) > 0 )
												ifTrue: [ 
													self messageComponent errorMessage: 'Data has been retrieved - number of items - ', ( response at: #dataCount ).
												]
												ifFalse: [ 
													( Delay forSeconds: 1) wait.
													( ( response at: #message ) ) = 'Success'
														ifTrue: [ 															
															self messageComponent errorMessage: 'No data has been retrieved.'.
														]
														ifFalse: [  
															self messageComponent errorMessage:  ( response at: #message ).
														].
												].
											self scriptResetForm: s.
											self scriptAddTransactionDataLine: s with: response.
										]
										ifFalse: [  
											( Delay forSeconds: 0.3 ) wait.
											self messageComponent errorMessage: validGetTransactionsStatus.
											s << ( ( s jQuery class: 'messageComponent' ) load html: [ :r | r render: self messageComponent ] ).
											self scriptResetForm: s.
										].
								]
							) asFunction: #(event) )
						);
						with: 'Get Data'.				
					]	
				].	