accessing
scriptShopBodyActionSave: script

	| validateResult |

	"remove any displayed messages"
	script << ( ( script jQuery class: 'editmessage', self shop shopId asString ) remove ).
	"validate input data"
	validateResult := self validateEditShop. 
	( validateResult = '' )
		ifFalse: [ 
			self messageComponent errorMessage: validateResult.
			script << ( ( script jQuery class: 'shop-message', self shop shopId asString ) append: [ :r | self renderShopBodyMessageOn: r ] )  
		]
		ifTrue: [  self updateShop.
			"reset stuff"
			script << ( ( script jQuery class: 'shop-edit' ) cssAt: 'display' put: 'inline' ).
			script << ( ( script jQuery class: 'shop-delete' ) cssAt: 'display' put: 'inline' ).					
			script << ( ( script jQuery class: 'shop-edit-save' ) cssAt: 'display' put: 'none' ).
			script << ( ( script jQuery class: 'shop-edit-cancel' ) cssAt: 'display' put: 'none' ).
			script << ( ( script jQuery class: 'shop-edit-field' ) attributeAt: 'disabled' put: 'disabled' ).
			"update header info"
			script << ( ( script jQuery id: 'header-shopname', self shop shopId asString ) text: self shopName ).
			script << ( ( script jQuery id: 'header-shopstatus', self shop shopId asString ) text: 
			( ( ( self shopStatus ) isNil ) ifTrue: [ self shop status ] ifFalse: [ self shopStatus ] ) ).
			"reset status"
			( self shop status = 'Active' )
				ifTrue: [  
					script << ( ( script jQuery id: 'shop-status-inactive', self shop shopId asString ) removeAttribute: 'checked' ).
					script << ( ( script jQuery id: 'shop-status-active', self shop shopId asString ) attributeAt: 'checked' put: 'checked' ).
				]
				ifFalse: [  
					script << ( ( script jQuery id: 'shop-status-active', self shop shopId asString ) removeAttribute: 'checked' ).
					script << ( ( script jQuery id: 'shop-status-inactive', self shop shopId asString ) attributeAt: 'checked' put: 'checked' ).
				]
		]