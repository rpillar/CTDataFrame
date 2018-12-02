rendering
renderGetTransactionsEndDateOn: html

	html div
		class: 'input-field col s3';
		style: 'margin-left:45px;';
		with: [
			html italic
				class: 'material-icons prefix';
				style: 'color:#000;';
				with: 'date_range'.
			html textInput
				id: 'enddate';
				class: 'datepicker';
				attributeAt: 'readonly' put: 'readonly';
				callback: [ :value | self endDate: value asString ].		
			html label 
				attributeAt: 'for' put: 'enddate';
				with: 'End Date'.			
		].	