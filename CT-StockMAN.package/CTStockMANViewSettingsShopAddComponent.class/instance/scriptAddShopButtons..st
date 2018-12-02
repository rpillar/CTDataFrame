script
scriptAddShopButtons: script

	| myCredentials myShop shopComponent validShopInput |

	validShopInput := self validateAddShop.
	( validShopInput = '' )
		ifTrue: [ 
			"add shop / credentials data"
			myShop := self addShop.
			"credentials - not used here - but might be at some point ..."
			myCredentials := self addCredentials: myShop.
			"create shop component and insert into the DOM"
			shopComponent := CTStockMANViewSettingsShopComponent new.
			shopComponent shop: myShop.
			shopComponent shopName: myShop shopName; shopDescription: myShop shopDescription; shopStatus: myShop status.
			self shopName: ''. self shopDescription: ''. self channel: nil.
			script << ( ( script jQuery class: 'no-shop-data' ) remove ).
			script << ( ( script jQuery class: 'shop-data' ) append: [ :r | r render: shopComponent ] ).
			script << ( ( script jQuery class: 'shop-data' ) show ).
			script << ( ( script jQuery class: 'add-shop-name' ) value: '' ).
			script << ( ( script jQuery class: 'shop-description-entry' ) value: '' ).
			script << ( JSStream on: '$(''#add-shop-modal'').modal(''close'')'  ).
			script << ( JSStream on: '$(''.tooltipped'').tooltip()' ).
			script << ( ( script jQuery class: 'collapsible-body' ) hide ).
		]
		ifFalse: [  
			self messageComponent errorMessage: validShopInput. 
			script << ( ( script jQuery class: 'messageComponent' ) load html: [ :r | r render: self messageComponent ] ). 
		]