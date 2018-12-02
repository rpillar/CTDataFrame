accessing
renderSetTransactionsScheduleButtonsOn: html

	| validSetTransactionScheduleStatus |
	
	html div 
		with: [ 
			html div
				class: 'col s6';
				style: 'margin-top:25px;margin-bottom: 20px;';
				with: [ 
					html button 
						bePush;
						class: 'btn-large waves-effect waves-light hoverable'; 
						id: 'get-transactions-schedule-button';
						script: ( html jQuery this
							on: 'click'
							do: ( 	( ( html jQuery ajax )
								serializeForm;
								script: [ :s | 
									validSetTransactionScheduleStatus := self validateSetTransactionSchedule.
									( validSetTransactionScheduleStatus = '')
										ifTrue: [  
											( scheduleStatus )
												ifTrue: [
													self updateTransactionScheduleData.
												]
												ifFalse: [  
													self insertTransactionScheduleData.
												].
											self messageComponent errorMessage: 'Success - The transaction schedule has been updated for this shop'.
										]
										ifFalse: [ 
											self messageComponent errorMessage: validSetTransactionScheduleStatus.
										].
										s << ( ( s jQuery class: 'messageComponent' ) load html: [ :r | r render: self messageComponent ] ).
								]
						) asFunction: #(event) ) 
					);
					with: 'Set Schedule'.				
				]	
			].