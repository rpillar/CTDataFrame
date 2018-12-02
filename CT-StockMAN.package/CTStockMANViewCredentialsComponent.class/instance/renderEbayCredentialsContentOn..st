rendering
renderEbayCredentialsContentOn: html

	html div
		class: 'modal-content credentials-modal-content';
		with: [ 
			html div 
				with: [
					self renderCredentialsActionCloseOn: html.
					html heading 
						level: 3; 
						style: 'margin-left:40px;';
						with: 'Edit Shop Credentials'.
				].
			html div 
				class: 'full-credentials-data';
				with: [
					html div 
						class: 'col s12';
						style: 'border-bottom:1px solid lightgray;'.
					html div 
						class: 'row';
						with: [ 
							html div 
								class: 'col s12';
								with: [ 
									self renderEbayCredentialsFormOn: html
								]
						]
				]
		].
	
	html document addLoadScript: ( ( JSStream on: '$(''ul.tabs'').tabs()' ) ) .