rendering
renderCredentialsEbayUrlOn: html

	html div 
		class: 'row';
		with: [ 
			html div 
				class: 'input-field col s6';
				with: [
					html italic
						class: 'material-icons prefix';
						style: 'color:#000;';
						with: 'mode_edit'.
					html textInput 
						class: 'validate edit-credentials-url';
						id: 'credentials-shop-url';
						autofocus;
						attributeAt: 'autocomplete' put: 'off';
						attributeAt: 'length' put: 55;
						value: ( self formCredentials at: 'url' );
						callback: [ :value | self formCredentials at: 'url' put: value ].		
					html label 
						class: 'active';
						attributeAt: 'for' put: 'credentials-shop-url';
						with: 'URL'.	
				].
			"NOTE - current release of materialize - checkboxes cannot be inside a class of 'input-field' - will be fixed in the next release !!"
			html div
				class: 'col s2';
				with: [ 
				html paragraph
					style: 'padding-left:20px;padding-top:25px;';
					with: [	
						html checkbox
							id: 'active-credentials';
							class: 'filled-in';
							attributeAt: 'checked' put: ( ( shopCredentials active = 'Y' ) ifTrue: [ 'checked' ] ifFalse: [ false ] );
							onClick: ( html jQuery ajax 
									script: [ :s | 
										( shopCredentials active = 'N' ) 
											ifTrue: [  
												shopCredentials active: 'Y'.
												s << ( ( s jQuery id: 'active-credentials' ) attributeAt: 'checked' put: 'checked' ).
											] 
											ifFalse: [  
												shopCredentials active: 'N'.
												s << ( ( s jQuery id: 'active-credentials' ) removeAttribute: 'checked' ).
											]. 
									]
								).
						html label
							class: 'active';
							attributeAt: 'for' put: 'active-credentials';
							with: 'Active'.
					].
				].
		].