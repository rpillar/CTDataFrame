accessing
rCredentials

	| myCredentials shopId |
	
	"get the credentials data related to the <current> shop"
	myCredentials := CTStockMANDBxTableCredentials new.
	myCredentials conn: self conn.
	
	shopId := self dbResult at: #shopId.
	myCredentials dbResultset: ( myCredentials dbSearch: { { #shopId->shopId } } on: myCredentials dbTableName with: myCredentials dbFields ).

	"store first (if not nil) in dbResult."
	( ( myCredentials dbResultset at: 1 ) notNil ) ifTrue: [ myCredentials dbResult: ( myCredentials dbResultset at: 1 ) ]. 
	^ myCredentials.