rendering
renderGetTransactionsStartTimeOn: html

	html div
		class: 'input-field col s3';
		style: 'margin-left:45px;';
		with: [
			html italic
				class: 'material-icons prefix';
				style: 'color:#000;';
				with: 'timer'.
			html textInput
				id: 'starttime';
				class: 'timepicker';
				callback: [ :value | self startTime: value asString ].		
			html label 
				attributeAt: 'for' put: 'starttime';
				with: 'Start Time'.			
		].	