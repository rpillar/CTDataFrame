accessing
getChannelCategories

	| dbt |

	dbt := CTStockMANDBxTableChannelCategories new.
	^ dbt conn: self session dbConn; dbSearchAll.		