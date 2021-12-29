select
seriesGroupDataWith: aField

	"set series based on the current _groupset_ - of the specified _field_"
	| data seriesData |
	data := Dictionary new.
	self groupset keysDo: [ :k | 
		seriesData := CTCollection new.
		seriesData := ( self groupset at: k ) collect: [ :each | each at: aField ].
		data at: k put: seriesData. 
	].
	self series: data.

	^ self.