accessing
getCustomCategory

	| myArgs myData |
	
	myArgs := Array new: 2.
	myArgs at: 1 put: self channel asString.
	myArgs at: 2 put: self channelCategory.
	
	myData := self session dbResource query: 'select * from channel_categories_data where channel = ? and categoryName = ?' with: myArgs  on: 'CTStockMANModelCategoryData'.
	
	(myData isEmpty )
		ifTrue: [ ^ '' ].
		
	^ ( myData at: 1 ) customCategoryName. 