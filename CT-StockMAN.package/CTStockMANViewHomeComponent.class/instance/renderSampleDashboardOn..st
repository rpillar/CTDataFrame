rendering
renderSampleDashboardOn: html

	html div 	
		class: 'sample-watermark';
		with: 'SAMPLE DATA.'.
		
	self renderSampleDashboardHeaderOn: html.	
	self renderSampleDashboardSalesOn: html.
	self renderSampleDashboardCategorySalesOn: html.