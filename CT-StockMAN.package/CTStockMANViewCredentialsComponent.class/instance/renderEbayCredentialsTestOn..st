rendering
renderEbayCredentialsTestOn: html

	| channel response |
	
	html div
		class: 'col s2';
		with: [ 
			html div 
				style: 'padding-top:30px;padding-left:30px;border-right:1px solid lightgray;height:250px;';
				with: [ 
					html button
						bePush;
						class: 'btn-large waves-effect waves-light hoverable';
						id: 'test-credentials';
						script: ( html jQuery this 
							on: 'click'
							do: (
								( ( html jQuery id: 'credentials-shop-test' ) html: ' ' ),
								( ( html jQuery id: 'test-credentials' ) attributeAt: 'disabled' put: 'disabled' ),
								( ( html jQuery class: 'progress' ) show )
							)
						);
						script: ( html jQuery this 
							on: 'click'
							do: ( 	( ( html jQuery ajax )
								script: [ :s |
									channel := CTStockMANEBayManage new. 
									channel myEbay credentials: formCredentials.
									response := channel getEBayOfficialTime. 
									s << ( ( s jQuery id: 'test-credentials' ) removeAttribute: 'disabled' ).
									s << ( ( s jQuery class: 'progress' ) hide ).
									s << ( ( s jQuery id: 'credentials-shop-test' ) append: response content asString )
								]
							) asFunction: #(event) )
						);
						with: 'Test'.
				]
		].
	html div 
		class: 'col s9';
		with: [  
			html div 	
				class: 'progress';
				style: 'display:none';
				with: [  
					html div 
						class: 'indeterminate'
				].
			html div 
				id: 'credentials-shop-test';
				style: 'height:250px;'
		].