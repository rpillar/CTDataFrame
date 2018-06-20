select
selectAll

	self resultset: OrderedCollection new.
	self resultset: ( self dataset collect: [ :each | each ] ).