accessing
addOrUpdateCategory

	| customCategory myCategory myData |
	
	"check - does the custom category already exist."
	customCategory := self getCustomCategory.
	
	myData := Array new: 3.
	myData at: 1 put: self channel.
	myData at: 2 put: self channelCategory.
	myData at: 3 put: self categoryName.
			
	( customCategory = '' )
		ifTrue: [
			self session dbResource insert: 'channel_categories_data' fields: #(channel categoryName customCategoryName) with: myData. 
		]
		ifFalse: [ 
			myCategory := CTStockMANModelCategoryData new.
			myCategory channel: self channel; categoryName: self channelCategory; customCategoryName: categoryName.
			self session dbResource update: 'channel_categories_data' on: CTStockMANModelCategoryData with: myCategory. 
		].