accessing
updateCredentials

	| myCredentials mySTONString |

	mySTONString := STON toString: self formCredentials.
	shopCredentials credentials: mySTONString.

	"update the db"
	myCredentials := self session dbResource update: 'credentials' on: 'CTStockMANModelCredentials' with: shopCredentials.
	
	^ myCredentials.