rendering
renderContentOn: html
	
	"Add Shop page ..."
	self messageComponent messageString: 'Please enter shop details - then Save (or Cancel).'; messageType: 'info'.
	self renderAddShopContentOn: html.
	
	html document addLoadScript: ( ( JSStream on: '$(''select'').material_select({ minimumResultsForSearch: Infinity })' ) ) .
	