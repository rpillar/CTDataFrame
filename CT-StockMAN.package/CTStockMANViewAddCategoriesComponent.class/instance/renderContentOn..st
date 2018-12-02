rendering
renderContentOn: html

	"Add / Edit Categories page ..."	
	self messageComponent messageString: 'Please enter category details - then Save (or Cancel). Select a channel category to view it''s category name.'; messageType: 'info'.
	self renderAddCategoriesContentOn: html.
	
	html document addLoadScript: ( ( JSStream on: '$(''.tooltipped'').tooltip()' ) ).
	html document addLoadScript: ( ( JSStream on: '$(''select'').material_select({ minimumResultsForSearch: Infinity })' ) ) .