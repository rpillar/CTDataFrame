rendering
renderGetCategoriesContentOn: html

	html div
		class: 'modal-content get-categories-modal-content';
		with: [ 
			html div 
				with: [
					self renderGetCategoriesActionCloseOn: html.
					html heading 
						level: 3; 
						style: 'margin-left:40px;';
						with: 'Get Channel Categories'.
				].
			html div 
				class: 'get-categories-block';
				with: [
					html div 
						class: 'col s12';
						style: 'border-bottom:1px solid lightgray;'.	
					html div 
						class: 'row';
						with: [ 
							html div 
								class: 'col s12';
								with: [ 
									self renderGetCategoriesFormOn: html.
								]
						]
				]
		].