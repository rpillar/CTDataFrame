accessing
getCategories

	| myCategories |
	
	myCategories := self session dbResource query: 'select categoryName from categories' on: 'CTStockMANModelCategory'. 

	^ myCategories.