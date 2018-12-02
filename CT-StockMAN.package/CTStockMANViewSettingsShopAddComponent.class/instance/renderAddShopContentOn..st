accessing
renderAddShopContentOn: html
	
	html div 
		class: 'modal-content add-shop-modal-content';
		with: [
			self renderAddShopActionCloseOn: html.
			html heading 
				level: 3; 
				style: 'margin-left:40px;';
				with: 'Add Shop'.
			html div 
				class: 'shop-entry-block';
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
									self renderAddShopFormOn: html
								]			
						]
				]
		].		 