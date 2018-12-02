accessing
getShops

	| dbt |

	dbt := CTStockMANDBxTableShop new.
	^ dbt conn: self session dbConn; dbSearchAll.	