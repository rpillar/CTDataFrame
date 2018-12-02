accessing
initialize
	super initialize.
	
	self apiKey: '7492dca341a7d5f85fd002da20d0cad6'.
	self password: '7d233b57fc0f2852e4c1366bd7e59d24'.
	self appUrl: self apiKey, ':', self password, '@', 'testapps-9.myshopify.com/admin/'.