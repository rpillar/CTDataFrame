rendering
renderCredentialsEbayDevIdOn: html

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
						class: 'validate edit-credentials-devid';
						id: 'credentials-shop-devid';
						autofocus;
						attributeAt: 'autocomplete' put: 'off';
						attributeAt: 'length' put: 65;
						callback: [ :value | self formCredentials at: 'devId' put: value ];
						value: ( self formCredentials at: 'devId' ).				
					html label 
						class: 'active';
						attributeAt: 'for' put: 'credentials-shop-devid';
						with: 'DevId'.	
				]	
		].
"	html div 	
		class: 'row';
		style: 'margin-top:0px;margin-bottom:10px;';
		with: [  
			html div 
				class: 'col s3 right-align';
				style: 'font-weight:400;font-size:20px;margin-top:10px;';
				with: 'DevId : '.
			html div 
				class: 'col s5 left-align input-field inline';
				style: 'font-weight:400;font-size:20px;color:#000;vertical-align:top;margin-top:0px;';
				with: [
					html textInput
					class: 'devid', self shop shopId asString;"
					"on: #channel of: self shop;"
					"value: self shop channel
				].		
		]."