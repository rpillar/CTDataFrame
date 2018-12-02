rendering
renderEbayCredentialsFormOn: html

	html div 
		class: 'login-form';
		with: [									
			html div 
				with: [ 
					html div 
						class: 'col s12 messageComponent';
						style: 'margin-top:10px;';
						with: [ 
							self messageComponent infoMessage: 'Please enter the credential details - then Save (or Cancel).'.
							html render: self messageComponent.
						].	
					html div 
						class: 'col s12';
						with: [  
							self renderCredentialsChannelOn: html. 
							self renderCredentialsShopNameOn: html.
						].
					html div 
						class: 'col s12';
						style: 'border-bottom:2px solid #000;'.
	 				html form
						class: 'form';
						with: [
							html div 
								class: 'col s12';
								with: [ 
									html unorderedList
										class: 'tabs';
										style: 'background-color:#fafafa;margin-top:10px;margin-bottom:15px;';
										with: [  
											html listItem 
												class: 'tab col s3';
												with: [ 
													html anchor 
														class: 'active';
														url: '#tab1';
														style: 'color:#000;';
														with: 'appid / devid / certid' 
												].
											html listItem 
												class: 'tab col s3';
												with: [ 
													html anchor 
														style: 'color:#000;';
														url: '#tab2';
														with: 'Token / url / active  (save)' 
												].	
											html listItem 
												class: 'tab col s2';
												with: [ 
													html anchor 
														style: 'color:#000;';
														url: '#tab3';
														with: 'Test' 
												].																			
										] 
								].
							html div 
								class: 'col s12';
								style: 'border-bottom:2px solid #000;margin-bottom:15px;'.
							html div
								id: 'tab1';
								class: 'col s12';
								with: [ 
									self renderCredentialsEbayAppIdOn: html.
									self renderCredentialsEbayDevIdOn: html.
									self renderCredentialsEbayCertIdOn: html.
								].
							html div
								id: 'tab2';
								class: 'col s12';
								with: [ 
									self renderCredentialsEbayTokenOn: html.
									self renderCredentialsEbayUrlOn: html.
									self renderEditCredentialsButtonsOn: html.
								].
							html div
								id: 'tab3';
								class: 'col s12';
								with: [ 
									self renderEbayCredentialsTestOn: html.
								]
							]
					]
			].
	
	html document addLoadScript: ( ( JSStream on: '$(''ul.tabs'').tabs()' ) ) .