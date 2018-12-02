rendering
renderContentOn: html

	"Add / Edit Credentials page ..."	
	self formCredentials: ( STON reader on: shopCredentials credentials readStream ) next.
	
	( self shop channel = 'EBay' ) 
		ifTrue: [
			self formCredentialsList: self credentialFieldsEbay.
			self renderEbayCredentialsContentOn: html.
		].
	
	html document addLoadScript: ( ( JSStream on: '$(''.tooltipped'').tooltip()' ) ).	