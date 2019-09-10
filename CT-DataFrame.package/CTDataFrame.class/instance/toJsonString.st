accessing
toJsonString

	"returns the resulset as a JSON string"
	^ NeoJSONWriter toString: self resultset.