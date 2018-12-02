rendering
renderCredentialsEbayCertIdOn: html

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
						class: 'validate edit-credentials-certid';
						id: 'credentials-shop-certid';
						autofocus;
						attributeAt: 'autocomplete' put: 'off';
						attributeAt: 'length' put: 65;
						callback: [ :value | self formCredentials at: 'certId' put: value ];
						value: ( self formCredentials at: 'certId' ).				
					html label 
						class: 'active';
						attributeAt: 'for' put: 'credentials-shop-certid';
						with: 'CertId'.	
				]	
		].