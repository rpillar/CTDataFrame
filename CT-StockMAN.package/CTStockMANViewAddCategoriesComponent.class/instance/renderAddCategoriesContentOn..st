rendering
renderAddCategoriesContentOn: html

	html div
		class: 'modal-content add-category-modal-content';
		with: [ 
			html div 
				with: [
					self renderAddCategoriesActionCloseOn: html.
					html heading 
						level: 3; 
						style: 'margin-left:40px;';
						with: 'Add / Edit Shop Categories'.
				].
			html div 
				class: 'add-category-block';
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
									self renderAddCategoriesFormOn: html
								].
						].
				]
		].