accessing
renderSetTransactionsScheduleStartTimeOn: html

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
				"callback: [ :value | self startTime: value asString ]."
				on: #startTime of: self;
				value: self startTime.		
			html label 
				class: 'active';
				attributeAt: 'for' put: 'starttime';
				with: 'Start Time'.			
		].	