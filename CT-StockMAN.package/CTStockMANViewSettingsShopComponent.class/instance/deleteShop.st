deleting
deleteShop

	"delete from the db"
	self session dbResource delete: 'shops' with: self shop.
