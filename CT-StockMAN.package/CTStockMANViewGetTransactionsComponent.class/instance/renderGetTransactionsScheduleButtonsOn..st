rendering
renderGetTransactionsScheduleButtonsOn: html

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
						onClick: ( ( html jQuery ajax )
							script: [ :s | 

							]
						);
						with: 'Set Schedule'.				
				]	
			].	