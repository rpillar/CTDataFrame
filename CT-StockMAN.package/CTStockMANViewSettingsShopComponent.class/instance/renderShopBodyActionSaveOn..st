rendering
renderShopBodyActionSaveOn: html
	
	html div
		class: 'shop-edit-save';
		style: 'position:absolute;top:40px;left:30px;display:none;';
		with: [ 
			html anchor 	
				class: 'tooltipped';
				style: 'text-decoration: none;cursor:pointer;';
				attributeAt: 'data-position' put: 'right';
				attributeAt: 'data-delay' put: '50';
				attributeAt: 'data-tooltip' put: 'Save';
				script: (
 					( html jQuery this )
 					on: 'click'
 					do: ( (
						"make this an ajax call - update object / update db ..."
						html jQuery ajax
							"callbacks to get field values ..."
							callback: [ :myField | self shopName: myField. ]
							value: ( ( html jQuery class: 'shop-name', ( self shop at: 'shopId' asSymbol ) asString ) value );
							callback: [ :myField | self shopDescription: myField. ]
							value: ( ( html jQuery class: 'shop-description', ( self shop at: 'shopId' asSymbol ) asString ) value );
							script: [ :s |  self scriptShopBodyActionSave: s ]
					) asFunction: #(event) )
				);
				with: [ 
					html italic 
						class: 'fa fa-floppy-o';
						style: 'color:#26a69a;font-size:2.5rem;'.
				].
		].