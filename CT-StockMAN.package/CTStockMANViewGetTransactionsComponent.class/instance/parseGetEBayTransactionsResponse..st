as yet unclassified
parseGetEBayTransactionsResponse: aResponse

	| data dict doc oc result |
	doc := XMLDOMParser parse: aResponse content.

	"return a orderedcollection of dictionaries - with elements TotalNumberOfPages / TotalNumberOfEntries"
	result := doc nodes elementAt: 'GetSellerTransactionsResponse'.
	data := ( result nodes elementAt: 'PaginationResult' ) nodes.

	oc := OrderedCollection new.
	dict := Dictionary new. 
	dict at: #TotalNumberOfPages put: ( ( data collection at: 1 ) contentString ). 
	dict at: #TotalNumberOfEntries put: ( ( data collection at: 2 ) contentString ). 
	oc add: dict. 
	
	^ oc.