validating
validateAddShop

	| myArgs myShop |
	
	"check if shop data is populated - only continue if okay"
	self shopName = ''
		ifTrue: [ ^ 'Missing data : please enter a Name field.' ].	
	
	"check if name has already been used ..."
	myArgs := Array new: 1.
	myArgs at: 1 put: self shopName.
	myShop := self session dbResource query: 'select * from shops where shopName = ?' with: myArgs  on: 'CTStockMANModelShop'.
	( myShop size = 1 ) ifTrue: [ ^ 'Error : shop names must be unique. Please re-enter.' ].
	
	self shopDescription = ''
		ifTrue: [ ^ 'Missing data : please enter a Description field.'  ].
				
	^ ''.