accessing
groupsetToJsonString

	"returns the groupset as a JSON string"
	^ NeoJSONWriter toString: self groupset.