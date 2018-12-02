rendering
renderShopBodyShopDescriptionOn: html

	html div 	
		class: 'row';
		style: 'margin-bottom:10px;';
		with: [  
			html div 
				class: 'col s3 right-align';
				style: 'font-weight:400;font-size:20px;margin-top:10px;';
				with: 'Shop Description : '.
			html div 
				class: 'col s9 left-align';
				style: 'font-weight:400;font-size:20px;color:#000;vertical-align:top;margin-top:0px;';
				with: [
					html textInput
					class: 'shop-edit-field shop-description', ( self shop at: 'shopId' asSymbol ) asString;
					attributeAt: 'disabled' put: 'disabled';
					on: #shopDescription of: self;
					value: ( self shop at: 'shopDescription' asSymbol )
				].
		].