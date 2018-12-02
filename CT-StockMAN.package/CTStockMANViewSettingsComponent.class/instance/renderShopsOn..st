rendering
renderShopsOn: html

	| myAddShopComponent myShop |
	myAddShopComponent := CTStockMANViewSettingsShopAddComponent new.
	
	"display shop details ..."
	html div 
		class: 'row';
		style: 'margin-bottom:5px;';
		with: [  
			html heading level: 2; 
			class: 'heading-main';	 
			style: 'font-weight:300;font-size:3rem';
			with: [ 
				html span 
				style: 'border-bottom: 3px solid lightblue;'; 
				with: 'Shops'.
			]
		].

	html div 
		class: 'row shop-data-block';
		with: [
			( self shops dbResultset isEmpty )
				ifTrue: [
					html render: CTStockMANViewSettingsShopEmptyComponent new.
					html div 
						with: [
							html unorderedList
								class: 'collapsible shop-data';
								style: 'display: none;'
						].
				]
				ifFalse: [ 			
					html unorderedList
						class: 'collapsible shop-data'; 
						with: [			
							self shops dbResultset do: [ :each |
								self halt.
								myShop := CTStockMANViewSettingsShopComponent new.
								myShop shop: each.
								myShop shopName: ( each at: 'shopName' asSymbol ).
								myShop shopDescription: ( each at: 'shopDescription' asSymbol ).
								myShop shopStatus: ( each at: 'status' asSymbol ).
								html render: myShop.
							]
						]	
				] 				
		].
	
	html div 
		class: 'row add-shop';
		style: 'margin-top:25px;';
		with: [ 
			html div
				class: 'col s3';
				with: [ 
					html anchor 
						class: 'btn-large waves-effect waves-light hoverable modal-trigger'; 
						url: '#add-shop-modal';	
						script: (
    						( html jQuery this )
      						on: 'click'
      						do: ( (
        						( ( html jQuery class: 'collapsible-header' ) removeClass: 'active' ),		
								( ( html jQuery class: 'collapsible-body' ) cssAt: 'display' put: 'none' ),
								( ( html jQuery id: 'add-shop-modal' ) load html: [ :r | r render: myAddShopComponent ] )				
      						) asFunction: #(event) )
  						);					
						with: 'Add New Shop'.			
				]
		].	

	html div 
		class: 'row';
		with: [ 
			html div 
			style: 'width:30%;margin:0 auto;'; 
			with: [
				html horizontalRule  
			]. 
		].			