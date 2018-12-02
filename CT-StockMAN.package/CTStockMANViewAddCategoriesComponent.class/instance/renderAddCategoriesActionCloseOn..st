rendering
renderAddCategoriesActionCloseOn: html

	html div 
		style: 'position:absolute;top:15px;right:60px;';
		with: [ 
			html anchor 	
				class: 'categories-close hoverable';
				style: 'text-decoration:none;cursor:pointer;';
				onClick: ( ( html jQuery ajax )
					script: [ :s | 
						s << ( JSStream on: '$(''#add-category-modal'').modal(''close'')'  ).
						s << ( ( s jQuery class: 'add-category-modal-content' ) remove ).						
					]
				);	
				with: [ 
					html italic 
						class: 'fa fa-window-close-o';
						style: 'color:#ef9a9a;font-size:4.5rem;'.
				]. 
		].