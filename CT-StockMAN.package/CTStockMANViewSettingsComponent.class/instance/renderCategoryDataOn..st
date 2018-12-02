rendering
renderCategoryDataOn: html

	"not used currently - left because it may be added in / used somehow."
	html div 
		class: 'row categories-data-block';
		with: [
			html div
				class: 'col s3';
				with: [  
					html div
						class: 'card horizontal';
						style: 'height: 70px';
						with: [  
							html div 
								class: 'card-image teal accent-3';
								style: 'width:50px';
								with: [  
									html span 
										style: 'padding-left:10px;';
										with: [ 
											html anchor 
												class: 'tooltipped';
												url: '#add-category-modal';
												style: 'text-decoration:none;cursor:pointer;';
												attributeAt: 'data-position' put: 'right';
												attributeAt: 'data-delay' put: '50';
												attributeAt: 'data-tooltip' put: 'Edit Category';
												with: [ 
													html italic 
														class: 'fa fa-chevron-down fa-2x';
														style: 'margin-top:12px;color:white;'
												]
										]
								].
							html div 	
								class: 'card-stacked';
								with: [ 
									html div 
										style: 'padding-top:5px;padding-left:20px;font-size:18px;';
										with: [  
											html span
												with: 'Category 1.'
										]. 
									html div 
										style: 'padding-top:5px;padding-left:20px;font-size:18px;';
										with: [  
											html span
												with: 'Category 2.'
										]. 

								]
						]
				]
		].
		
