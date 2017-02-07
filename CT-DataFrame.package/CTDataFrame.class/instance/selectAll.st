select
selectAll

	self resultset: OrderedCollection new.
	self dataset do: [ :each |  	
			self resultset add: each	
		].