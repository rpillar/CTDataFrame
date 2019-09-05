select
seriesDataWith: aField

	"return a series based on the current _resultset_ of the specified _field_"
	| series |
	series := OrderedCollection new.
	series := ( self resultset collect: [ :each | each at: aField ] ).

	^ series.