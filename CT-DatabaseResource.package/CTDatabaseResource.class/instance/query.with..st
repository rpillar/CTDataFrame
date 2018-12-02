as yet unclassified
query: aQuery with: anArgsArray

	"a query with a specific set of responses based on the <arguments> passed in. 'myData' is a <resultset> which is why <next> is required to retrieve 
	the <data> - this is passed back in a <dictionary>."
	
	| myDb myData |
	myDb := self database.
	myData := myDb execute: aQuery with: anArgsArray.
	
	^ myData next.