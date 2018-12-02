rendering
renderShopBodyOn: html

	html div
		class: 'collapsible-body';
		style: 'display:block;position:relative;padding-top:10px;padding-bottom:10px;';
		with: [ 
			self renderShopBodyActionDeleteOn: html.
			self renderShopBodyActionEditOn: html.
			self renderShopBodyActionSaveOn: html.
			self renderShopBodyActionCancelOn: html.
			self renderShopBodyDeleteComponentOn: html.
			html div 
				class: 'full-shop-data';
				with: [
					html div 
						class: 'shop-message', ( self shop at: 'shopId' asSymbol ) asString.
					html form 
						class: 'form';
						with: [
							self renderShopBodyShopNameOn: html.
							self renderShopBodyShopDescriptionOn: html.
							self renderShopBodyStatusOn: html.
						]
				].
			html div 
				class: 'row';
				with: [ 
					html div 
					style: 'width:55%;margin:30px auto 10px auto;'; 
					with: [
						html horizontalRule  
					]. 
				].	
			html div 
				class: 'row';
				with: [  
					self renderShopCredentialsEditOn: html.
					html div 
						class: 'full-credentials-data';
						with: [
							html div 
								class: 'credentials-message';
								with: [  
									self messageComponent errorMessage: 'Edit the credentials required for this shop.'.
									self renderShopCredentialsBodyMessageOn: html.
								]
						].
				]
		].