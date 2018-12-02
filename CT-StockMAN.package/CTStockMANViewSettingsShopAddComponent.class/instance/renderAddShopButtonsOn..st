rendering
renderAddShopButtonsOn: html
	
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
							script: [ :s | self scriptAddShopButtons: s ] 
						);
						with: 'Save'.			
				]	
			].	