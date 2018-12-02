rendering
renderPageSettingsOn: html

	| settingsPage |
	settingsPage  := CTStockMANViewSettingsComponent new.
	html render: settingsPage.