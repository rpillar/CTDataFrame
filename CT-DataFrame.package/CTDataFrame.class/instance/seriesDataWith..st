select
seriesDataWith: aField

	"set series based on the current _resultset_ of the specified _field_"
	| seriesData |
	seriesData := CTCollection new.
	seriesData := ( self resultset collect: [ :each | each at: aField ] ).
	
	self series: seriesData.
	
	^ self.