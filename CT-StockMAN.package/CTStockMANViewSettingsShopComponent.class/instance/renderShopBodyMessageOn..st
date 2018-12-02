rendering
renderShopBodyMessageOn: html

	html div 	
		class: 'row editmessage', self shop shopId asString;
		style: 'margin-bottom:0px;color:#ef9a9a;';
		with: [ 
			html div 
				class: 'col s12';
				style: 'margin-top:10px;margin-bottom:0px;margin-left:80px;';
				with: [ 
					html render: self messageComponent.
				]
		].