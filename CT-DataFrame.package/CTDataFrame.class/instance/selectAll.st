select
selectAll

	self resultset: CTCollection new.
	self resultset: ( self dataset collect: [ :each | each ] ).