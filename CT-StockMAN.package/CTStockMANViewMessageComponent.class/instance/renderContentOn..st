rendering
renderContentOn: html

	html div
		class: 'message';
		class: self messageType, 'Message';
		style: 'margin-bottom: 15px;text-align:left;';
		with: [
			html span
				class: 'messageSpan';  
				style: 'font-size:18px;font-weight:400;';
				with: self messageString.
		].	