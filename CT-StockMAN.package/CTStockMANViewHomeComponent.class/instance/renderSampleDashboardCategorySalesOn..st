rendering
renderSampleDashboardCategorySalesOn: html
	
	html div 
		class: 'row';
		with: [ 
			html div 
				class: 'col s12';
				with: [ 
					html heading level: 3; 
						style: 'font-weight:300;font-size:2rem;margin-left:50px;'; 
						with: [
							html span
								class: 'border-under';
								with: 'CATEGORY SALES'.
						]		
				]
			].
	
	"hack to ensure that the charts are rendered at the correct size !!!"
	html document addLoadScript: ( ( JSStream on: '$(''.summaryChart'').hide()' ) ).