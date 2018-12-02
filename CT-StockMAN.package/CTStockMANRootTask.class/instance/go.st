running
go

	| dbt myUser |
	
	"just use 'testuser' for now"
	dbt := CTStockMANDBxTableUser new.
	myUser := dbt conn: self session dbConn;
		dbSearch: { { #userName->'Richard' } }.		
	self session user: myUser.

	self call: CTStockMANViewRootComponent new.