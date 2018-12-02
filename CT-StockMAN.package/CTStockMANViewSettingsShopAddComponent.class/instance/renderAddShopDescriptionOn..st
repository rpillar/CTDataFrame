accessing
renderAddShopDescriptionOn: html

	html div 
		class: 'row';
		with: [ 
			html div 
				class: 'input-field col s10';
				with: [
					html italic
						class: 'material-icons prefix';
						style: 'color:#000;';
						with: 'business'.
					html textArea 
						class: 'materialize-textarea shop-description-entry';
						style: 'padding-top:10px;';
						rows: 3;
						attributeAt: 'autocomplete' put: 'off';
						callback: [ :value | self processShopDescriptionInput: value ].		
					html label 
						attributeAt: 'for' put: 'icon-prefix';
						with: 'Shop Description'.	
				].	
		] 