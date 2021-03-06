initialization
initialize 

	super initialize.
	self fields: #( Date Takings Donations Total Day Week Month Year CustNumbers ).
	self tableName: 'summary'.
	self primaryKey: ''.
	self rsPointer: 1.