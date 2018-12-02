accessing
scriptShopHeader: script

	script << ( ( script jQuery class: 'shop-name', self shop shopId asString ) value: self shop shopName ).
	script << ( ( script jQuery class: 'shop-description', self shop shopId asString ) value: self shop shopDescription ).
	( self shop status = 'Active' ) 
		ifTrue: [ 
			script << ( ( script jQuery id: 'shop-status-active', self shop shopId asString ) propertyAt: 'checked' put:'checked' ).
		]
		ifFalse: [  
			script << ( ( script jQuery id: 'shop-status-inactive', self shop shopId asString ) propertyAt: 'checked' put:'checked' ).
		].
		script << ( ( script jQuery class: 'shop-edit' ) cssAt: 'display' put: 'inline' ).
		script << ( ( script jQuery class: 'shop-delete' ) cssAt: 'display' put: 'inline' ).
		script << ( ( script jQuery class: 'shop-edit-save' ) cssAt: 'display' put: 'none' ).
		script << ( ( script jQuery class: 'shop-edit-cancel' ) cssAt: 'display' put: 'none' ).
		script << ( ( script jQuery class: 'shop-edit-field' ) attributeAt: 'disabled' put: 'disabled' ).
		script << ( ( script jQuery class: 'editmessage', self shop shopId asString ) remove ).
		script << ( ( script jQuery id: 'shop-delete-component', self shop shopId asString ) cssAt: 'display' put: 'none' ).