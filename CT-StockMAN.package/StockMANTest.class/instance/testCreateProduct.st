tests
testCreateProduct
	| product |
	product := CTStockMANModelProduct new.
	
	product category: 'Accessories'.
	product productName: 'buttons'.
	
	self assert: product category equals: 'Accessories'.
	self assert: product productName equals: 'buttons'.