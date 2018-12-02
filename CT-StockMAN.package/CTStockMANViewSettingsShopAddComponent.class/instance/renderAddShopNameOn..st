accessing
renderAddShopNameOn: html

	html div 
		class: 'row';
		with: [ 
			html div 
				class: 'input-field col s8';
				with: [
					html italic
						class: 'material-icons prefix';
						style: 'color:#000;';
						with: 'store'.
					html textInput 
						class: 'validate add-shop-name';
						id: 'icon-prefix';
						autofocus;
						attributeAt: 'autocomplete' put: 'off';
						attributeAt: 'length' put: 65;
						on: #shopName of: self.				
					html label 
						attributeAt: 'for' put: 'icon-prefix';
						with: 'Shop Name'.	
				].	
		].
	
	"html document addLoadScript: ( ( JSStream on: '$(''.collapsible'').collapsible()' ) ).	" 