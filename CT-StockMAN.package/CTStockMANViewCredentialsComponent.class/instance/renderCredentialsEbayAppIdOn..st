rendering
renderCredentialsEbayAppIdOn: html

	html div 
		class: 'row';
		with: [ 
			html div 
				class: 'input-field col s8';
				with: [
					html italic
						class: 'material-icons prefix';
						style: 'color:#000;';
						with: 'mode_edit'.
					html textInput 
						class: 'validate edit-credentials-appid';
						id: 'credentials-shop-appid';
						autofocus;
						attributeAt: 'autocomplete' put: 'off';
						attributeAt: 'length' put: 65;
						callback: [ :value | self formCredentials at: 'appId' put: value ];
						value: ( self formCredentials at: 'appId' ).				
					html label 
						class: 'active';
						attributeAt: 'for' put: 'credentials-shop-appid';
						with: 'AppId'.	
				]	
		].