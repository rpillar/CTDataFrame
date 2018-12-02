rendering
renderSystemLogDataOn: html
		
	html div 
		class: 'row';
		with: [  
			html heading level: 2; 
			class: 'heading-main';	 
			style: 'font-weight:300;font-size:3rem';
			with: [ 
				html span 
				style: 'border-bottom: 3px solid lightblue;'; 
				with: 'StockMAN System Log Data'.
			]
		].
	
	html div 
		class: 'row';
		style: 'margin-bottom:5px;';
		with: [ 
			html paragraph 
				style: 'font-size: 18px;font-weight:300;margin-bottom:10px;';
				with: 'Check STOCKMAN System Log data - HTTP request / response etc ...' 
		].

	html div 
		class: 'row stockman-system-logs';
		style: 'margin-top:25px;';
		with: [ 
			html div
				class: 'col s3';
				style: 'width:240px;';
				with: [ 
					html anchor 
						class: 'btn-large waves-effect waves-light hoverable'; 
						with: 'StockMAN Logs'.			
				].
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