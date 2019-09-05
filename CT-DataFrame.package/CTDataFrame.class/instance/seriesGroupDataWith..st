select
seriesGroupDataWith: aField

	"return a series based on the current _groupset_ - of the specified _field_"
	| data series |
	data := Dictionary new.
	self groupset keysDo: [ :k | 
		series := OrderedCollection new.
		series := ( self groupset at: k ) collect: [ :each | each at: aField ].
		data at: k put: series. 
	].

	^ data.