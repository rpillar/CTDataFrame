rendering
renderSampleDashboardSalesOn: html

	html div
		class: 'row';
		style: 'margin-top:40px;';
		with: [  
			html heading level: 3; 
			style: 'font-weight:300;font-size:2rem;margin-left:50px;';
			with: [
				html span 
				class: 'border-under';
				with: 'SALES - last 12 months'
			]	
		].
	
	html div 
		class: 'row';
		style: 'margin-top:10px;';
		with: [
			html div
				class: 'col s12';
				with: [ self renderSampleDashboardSalesChartOn: html ].   
		].