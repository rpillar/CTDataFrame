rendering
renderAddCategoryButtonsOn: html

	| validCategoryInput |
	html div 
		with: [ 
			html div
				class: 'col s6';
				style: 'margin-top:25px;margin-bottom: 20px;';
				with: [ 
					html button 
						bePush;
						class: 'btn-large waves-effect waves-light hoverable'; 
						onClick: ( ( html jQuery ajax )
							serializeForm;
							script: [ :s | 
								validCategoryInput := self validateCategory.
								( validCategoryInput = '' )
									ifTrue: [ 
										"add category data"
										self addOrUpdateCategory.
										self categoryName: ''.
										s << ( JSStream on: '$(''#add-category-modal'').modal(''close'')' ).
										s << ( ( s jQuery class: 'add-category-modal-content' ) remove ).
										s << ( JSStream on: '$(''.tooltipped'').tooltip()' ).
									]
									ifFalse: [  
										self messageComponent errorMessage: validCategoryInput. 
										s << ( ( s jQuery class: 'messageComponent' ) load html: [ :r | r render: self messageComponent ] ). 
								]	
							] );
						with: 'Save'.			
				]	
			].	