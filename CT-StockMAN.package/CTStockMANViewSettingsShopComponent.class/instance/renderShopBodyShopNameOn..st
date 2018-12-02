rendering
renderShopBodyShopNameOn: html

	html div 	
		class: 'row';
		style: 'margin-top:0px;margin-bottom:10px;';
		with: [  
			html div 
				class: 'col s3 right-align';
				style: 'font-weight:400;font-size:20px;margin-top:10px;';
				with: 'Shop Name : '.
			html div 
				class: 'col s7 left-align input-field inline';
				style: 'font-weight:400;font-size:20px;color:#000;vertical-align:top;margin-top:0px;';
				with: [
					html textInput
					class: 'shop-edit-field shop-name', ( self shop at: 'shopId' asSymbol ) asString;
					attributeAt: 'disabled' put: 'disabled';
					on: #shopName of: self;
					value: ( self shop at: 'shopName' asSymbol )
				].		
		].