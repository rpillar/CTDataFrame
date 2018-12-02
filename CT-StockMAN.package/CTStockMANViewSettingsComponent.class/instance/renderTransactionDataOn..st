rendering
renderTransactionDataOn: html
		
	html div 
		class: 'row';
		with: [  
			html heading level: 2; 
			class: 'heading-main';	 
			style: 'font-weight:300;font-size:3rem';
			with: [ 
				html span 
				style: 'border-bottom: 3px solid lightblue;'; 
				with: 'Retrieve Channel Data'.
			]
		].
	
	html div 
		class: 'row';
		style: 'margin-bottom:5px;';
		with: [ 
			html paragraph 
				style: 'font-size: 18px;font-weight:300;margin-bottom:10px;';
				with: 'Control / Monitor retrieval of data from a channel (latest 5 only displayed).' 
		].

	html div 
		class: 'row';
		with: [ 
			html render: CTStockMANViewSettingsTransactionComponent new.
		].
	
	html div 
		class: 'row';
		with: [ 
			html div 
			style: 'width:30%;margin:0 auto;'; 
			with: [
				html horizontalRule  
			]. 
		].	