accessing
renderAddShopActionCloseOn: html

	html div 
		style: 'position:absolute;top:15px;right:60px;';
		with: [ 
			html anchor 	
				class: 'add-shop-close hoverable';
				style: 'text-decoration:none;cursor:pointer;';
				onClick: ( ( html jQuery ajax )
					script: [ :s | 
						self shopName: ''. self shopDescription: ''. self channel: nil.
						s << ( JSStream on: '$(''#add-shop-modal'').modal(''close'')'  ).					
					]
				);	
				with: [ 
					html italic 
						class: 'fa fa-window-close-o';
						style: 'color:#ef9a9a;font-size:4.5rem;'.
				]. 
		].