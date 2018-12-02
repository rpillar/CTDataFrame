relationship
rShops

	| myShops userName |
	
	"get the shops data related to the <current> user"
	myShops := CTStockMANDBxTableShop new.
	myShops conn: self conn.
	userName := self dbResult at: #userName.
	myShops dbResultset: ( myShops dbSearch: { { #userName->userName } } on: myShops dbTableName with: myShops dbFields ).

	"store first (if not nil) in dbResult."
	( (myShops dbResultset at: 1 ) notNil ) ifTrue: [ myShops dbResult: ( myShops dbResultset at: 1 ) ]. 
	^ myShops.