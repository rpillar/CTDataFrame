rendering
renderGetCategoryButtonsOn: html

	html div 
		with: [ 
			html div
				class: 'col s6';
				style: 'margin-top:25px;margin-bottom: 20px;';
				with: [ 
					self renderGetCategoryButtonGetCategoryOn: html.			
				]	
			].	