grouping
groupBy: aField

	"groupset is a dictionary - keys are the distinct values for <aField> / values are the related OrderedCollection of dictionaries."
	self groupset: ( self resultset  groupedBy: [ :i | i at: aField. ] ).	