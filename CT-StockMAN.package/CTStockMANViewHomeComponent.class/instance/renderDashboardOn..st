rendering
renderDashboardOn: html
		
	self renderDashboardSummaryOn: html.	
		
	html div
		class: 'row';
		style: 'margin-top:10px;';
		with: [  
			html heading level: 3; 
			style: 'font-weight:300;font-size:2rem;margin-left:50px;';
			with: [
				html span 
				class: 'border-under';
				with: 'CHANNEL SALES'
			]	
		].	
	self renderDashboardSummaryChartOn: html.	
	self renderDashboardTrafficDataOn: html.