accessing
addCategory

	| myData |
	
	"add category details"
	myData := Array new: 3.
	myData at: 1 put: self channel.
	myData at: 2 put: self channelCategory.
	myData at: 3 put: self categoryName.
	self session dbResource insert: 'channel_categories_data' fields: #(channel categoryName customCategoryName) with: myData. 