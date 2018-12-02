rendering
renderContentOn: html

	html listItem 
		id: 'shop-list-item', ( self shop at: 'shopId' asSymbol ) asString;
		style: 'padding-top:5px;padding-left:5px;padding-right:5px;';
		with: [ 
			self renderShopHeaderOn: html.
			self renderShopBodyOn: html.		
		].
	 	
	html document addLoadScript: ( ( JSStream on: '$(''.collapsible'').collapsible()' ) ).