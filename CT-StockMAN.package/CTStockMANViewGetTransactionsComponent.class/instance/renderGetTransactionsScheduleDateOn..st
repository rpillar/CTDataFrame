rendering
renderGetTransactionsScheduleDateOn: html

	html div
		class: 'input-field col s3';
		style: 'margin-left:45px;';
		with: [
			html italic
				class: 'material-icons prefix';
				style: 'color:#000;';
				with: 'date_range'.
			html textInput
				id: 'scheduledate';
				class: 'datepicker';
				callback: [ :value | self startDate: value asString ].		
			html label 
				attributeAt: 'for' put: 'scheduledate';
				with: 'Schedule Date'.			
		].	