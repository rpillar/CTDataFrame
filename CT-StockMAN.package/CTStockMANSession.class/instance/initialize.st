initialization
initialize

	| repo |
	super initialize.
	self dbConn: CTDBxConnection new.
	self dbConn dbConnection: ( UDBCSQLite3Connection on: '/Users/rpillar/temp/test.db' ).
	self dbConn dbConnection open.
	
	self logDatabase: 	( Mongo default open databaseNamed: 'StockMAN_Log' ).
	repo := VOMongoRepository 
            host: VOMongoRepository defaultHost 
            database: 'StockMAN_Log'.
	VORepository setRepository: repo.