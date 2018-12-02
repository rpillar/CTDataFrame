accessing
validateEditShop
	
	| myArgs myShop myShopInst |			
	"check if shop data is populated - only continue if okay"
	self shopName = ''
		ifTrue: [ ^ 'Missing data : a Name field must be entered.' ].	

	"check if name has already been used ..."
	myArgs := Array new: 1.
	myArgs at: 1 put: self shopName.
	myShop := self session dbResource query: 'select * from shops where shopName = ?' with: myArgs  on: 'CTStockMANModelShop'.
	( myShop size = 1 ) ifTrue: [ 
		myShopInst := myShop at: 1.
		( myShopInst shopId asString  = self shop shopId asString ) ifFalse: [ ^ 'Error : shop names must be unique. Please re-enter.' ] ].
	
	self shopDescription = ''
		ifTrue: [ ^ 'Missing data : a Description field must be entered.'  ].
				
	^ ''.