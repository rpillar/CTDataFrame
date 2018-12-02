rendering
renderShopCredentialsEditOn: html

	| myCredentialsComponent |
	myCredentialsComponent := CTStockMANViewCredentialsComponent new.
	myCredentialsComponent shop: self shop.
	myCredentialsComponent shopCredentials: ( ( self shop rCredentials ) at: 1 ).
	
	html div 
		style: 'position:absolute;top:252px;left:30px;';
		with: [ 
			html anchor 
				class: 'tooltipped modal-trigger';
				url: '#edit-credential-modal';	
				style: 'text-decoration: none;cursor:pointer;';
				attributeAt: 'data-position' put: 'right';
				attributeAt: 'data-delay' put: '50';
				attributeAt: 'data-tooltip' put: 'Edit Credentials';
				script: (
    				( html jQuery this )
    					on: 'click'
      					do: ( (
        					( ( html jQuery id: 'edit-credential-modal' ) load html: [ :r | r render: myCredentialsComponent ] )			
      					) asFunction: #(event) )
  					);
				with: [ 
					html italic 
						class: 'fa fa-plus-circle';
						style: 'color:#26a69a;font-size:2.5rem;'.
				]. 
		].