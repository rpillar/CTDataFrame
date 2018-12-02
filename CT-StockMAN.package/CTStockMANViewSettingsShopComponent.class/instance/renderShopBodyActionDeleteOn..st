rendering
renderShopBodyActionDeleteOn: html

	html div 
		style: 'position:absolute;top:40px;left:30px;';
		with: [ 
			html anchor 	
				class: 'shop-delete tooltipped';
				style: 'text-decoration: none;cursor:pointer;';
				attributeAt: 'data-position' put: 'right';
				attributeAt: 'data-delay' put: '50';
				attributeAt: 'data-tooltip' put: 'Delete';
				script: (
 					( html jQuery this )
 					on: 'click'
 					do: ( (
						( ( html jQuery id: 'shop-delete-component', ( self shop at: 'shopId' asSymbol ) asString ) cssAt: 'display' put: 'inline' ),
						( ( html jQuery class: 'shop-edit' ) cssAt: 'display' put: 'none' )				
 					) asFunction: #(event) )
 				);
				with: [ 
					html italic 
						class: 'fa fa-trash-o';
						style: 'color:#ef9a9a;font-size:2.5rem;'
				]. 
		].