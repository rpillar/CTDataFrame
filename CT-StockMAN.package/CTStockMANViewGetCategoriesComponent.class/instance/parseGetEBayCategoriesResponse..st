accessing
parseGetEBayCategoriesResponse: aResult

	| data dict oc |
	oc := OrderedCollection new.
	
	"return a orderedcollection of dictionaries - with elements CategoryId / CategoryName"
	data := ( aResult nodes elementAt: 'CategoryArray' ) nodes.
	data collection do: [ :e | 
		dict := Dictionary new. 
		dict at: #CategoryName put: ( ( e nodes elementAt: 'CategoryName' ) contentString ). 
		dict at: #CategoryId put: ( ( e nodes elementAt: 'CategoryID' ) contentString ). 
		oc add: dict. 
	].
	
	^ oc.