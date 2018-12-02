rendering
renderEditCredentialsButtonsOn: html 

	| validCredentialsInput |
		
	html div 
		with: [ 
			html div
				class: 'col s6';
				style: 'margin-bottom: 20px;';
				with: [ 
					html button 
						bePush;
						class: 'btn-large waves-effect waves-light hoverable'; 
						onClick: ( ( html jQuery ajax )
							serializeForm;
							script: [ :s | 
								validCredentialsInput := self validateCredentials: formCredentials.
								( validCredentialsInput = '' )
									ifTrue: [ self updateCredentials.
										s << ( JSStream on: '$(''#edit-credential-modal'').modal(''close'')'  ).
										s << ( ( s jQuery class: 'credentials-modal-content' ) remove ).
									]
									ifFalse: [  
										self messageComponent errorMessage: validCredentialsInput. 
										s << ( JSStream on: '$(''ul.tabs'').tabs(''select_tab'',''tab1'')'  ).
										s << ( ( s jQuery class: 'messageComponent' ) load html: [ :r | r render: self messageComponent ] ). 
									]
							]
						);
						with: 'Save'.			
				]	
			].