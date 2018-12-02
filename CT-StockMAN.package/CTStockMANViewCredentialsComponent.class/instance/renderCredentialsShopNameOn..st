rendering
renderCredentialsShopNameOn: html

	html div 
		class: 'input-field col s5';
		style: 'margin-left:20px;';
		with: [
			html italic
				class: 'material-icons prefix';
				style: 'color:#000;';
				with: 'store'.
			html textInput 
				class: 'validate add-shop-name';
				id: 'credentials-shop-name';
				attributeAt: 'disabled' put: 'disabled';
				on: #shopName of: self shop;
				value: self shop shopName.	
			html label 
				class: 'active';
				attributeAt: 'for' put: 'credentials-shop-name';
				with: 'Shop Name'.	
		].	