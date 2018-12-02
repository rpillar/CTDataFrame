accessing
getCategoryData: aCategory

	| myCategory myCategoryData |
	
	myCategory := Array new: 1.
	myCategory at: 1 put: aCategory.
	
	myCategoryData := self session dbResource query: 'select category, margin, sales, volume from shops where category = ?' with: myCategory on: 'CTStockMANModelCategoryData'. 

	^ myCategoryData.