rendering
renderShopBodyActionEditOn: html

	html div 
		style: 'position:absolute;top:95px;left:30px;';
		with: [ 
			html anchor 	
				class: 'shop-edit tooltipped';
				style: 'text-decoration: none;cursor:pointer;';
				attributeAt: 'data-position' put: 'right';
				attributeAt: 'data-delay' put: '50';
				attributeAt: 'data-tooltip' put: 'Edit';
				script: (
 					( html jQuery this )
 					on: 'click'
 					do: ( (
						( ( html jQuery class: 'shop-edit' ) cssAt: 'display' put: 'none' ),
						( ( html jQuery class: 'shop-delete' ) cssAt: 'display' put: 'none' ),
						( ( html jQuery class: 'shop-edit-field' ) removeAttribute: 'disabled' ),
						( ( html jQuery class: 'shop-edit-save' ) cssAt: 'display' put: 'inline' ),
						( ( html jQuery class: 'shop-edit-cancel' ) cssAt: 'display' put: 'inline' )				
 					) asFunction: #(event) )
 				);	
				with: [ 
					html italic 
						class: 'fa fa-pencil-square-o';
						style: 'color:#26a69a;font-size:2.5rem;'.
				]. 
		].