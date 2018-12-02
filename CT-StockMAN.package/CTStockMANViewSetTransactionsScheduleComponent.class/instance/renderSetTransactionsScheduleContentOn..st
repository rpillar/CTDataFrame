accessing
renderSetTransactionsScheduleContentOn: html

	html div
		class: 'modal-content get-transactions-modal-content';
		with: [ 
			html div 
				with: [
					self renderSetTransactionsScheduleActionCloseOn: html.
					html heading 
						level: 3; 
						style: 'margin-left:40px;';
						with: 'Schedule Retrieval of Transaction Data'.
				].
			html div 
				class: 'get-transactions-block';
				with: [
					html div 
						class: 'col s12';
						style: 'border-bottom:1px solid lightgray;'.	
					html div 
						class: 'row';
						with: [ 
							html div 
								class: 'col s12';
								with: [ 
									self renderSetTransactionsScheduleFormOn: html
								].
						].
				].
		].