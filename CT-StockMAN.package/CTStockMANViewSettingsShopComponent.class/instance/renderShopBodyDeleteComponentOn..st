rendering
renderShopBodyDeleteComponentOn: html
	
	| myShopCount |
	
	html div 	
		id: 'shop-delete-component', ( self shop at: 'shopId' asSymbol ) asString;
		class: 'row';
		style: 'position:absolute;top:35px;left:180px;z-index:1001;display:none;';
		with: [  
			html div 
				class: 'col s12 left-align';
				style: 'font-weight:400;font-size:20px;color:#ef9a9a;background-color:#fff;padding:20px;border:2px solid #000;border-radius:5px;';
				with: [
					html span 
						with: 'This will remove this shop and all associated data. Are you sure you want to do this ? '.
					html break.
					html span 
						style: 'margin-top:20px;';
						with: [
							html button
								class: 'btn waves-effect waves-light';
								style: 'margin-left:12px;margin-right: 12px;background-color:#ef9a9a';
								onClick: ( ( html jQuery ajax )
									script: [ :s | 
										self deleteCredentials.
										self deleteShop.
										s << ( ( s jQuery id: 'shop-list-item', ( self shop at: 'shopId' asSymbol ) asString ) remove ).
										s << ( ( s jQuery id: 'credentials', ( self shop at: 'shopId' asSymbol ) asString ) remove ).
										myShopCount := self checkShopCount.
										( myShopCount = 0 ) ifTrue: [  
											s << ( ( s jQuery class: 'shop-data' ) cssAt: 'display' put: 'none' ).
											s << ( ( s jQuery class: 'shop-data-block' ) append: [ :r | r render: CTStockMANViewSettingsShopEmptyComponent new ] ).
										].
									]
								);
								with: 'Delete'.
							html break.
							html span
								style: 'font-weight:400;font-size:14px;color:#000;';	
								with: '( Click on the header to cancel )'.
						]
				]
		].