deleting
deleteCredentials

	"delete from the db - pass in the shops object - keys are the same"
	self session dbResource delete: 'credentials' with: self shop.
	
	"log update"
	( CTStockMANLog new )
		entryDate: ( Date today asString , Time current asString );
		logData: 'Deleted credentials for : ', self shop shopName;
		save.