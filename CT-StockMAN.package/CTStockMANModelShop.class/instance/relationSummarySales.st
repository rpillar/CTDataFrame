relation
relationSummarySales

| myArgsArray mySalesSummary |
	
	myArgsArray := Array new: 1.
	myArgsArray at: 1 put: self shopName.
	
	mySalesSummary := self session dbResource query: 'select * from salessummary where shop = ?' with: myArgsArray  on: 'CTStockMANModelSummarySales'.
	^ mySalesSummary.