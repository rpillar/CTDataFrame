accessing
resultsetToJsonString

	"returns the resulset as a JSON string"
	^ NeoJSONWriter toString: self resultset.