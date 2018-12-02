rendering
renderContentOn: html

	"Get Categories page ..."		
	self messageComponent messageString: 'Please select a shop and then GET CATEGORIES in order to retrieve the category details for its channel. Please note that all existing details will be over-written.'; messageType: 'info'.
	self renderGetCategoriesContentOn: html.
	
	html document addLoadScript: ( ( JSStream on: '$(''.tooltipped'').tooltip()' ) ).
	html document addLoadScript: ( ( JSStream on: '$(''select'').material_select({ minimumResultsForSearch: Infinity })' ) ) .