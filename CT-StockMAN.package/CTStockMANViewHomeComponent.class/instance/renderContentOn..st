rendering
renderContentOn: html

	"home - initial dashboard page"	
	html div 
		with: [  
			html div 
				class: 'page-title';
				with: 'DashBoard'.	
		].

	self shopsActive: true.
	"render sample data when there are no active shops defined for the logged-in user."
	( self shopsActive )
		ifTrue: [
			self renderDashboardOn: html.
		]
		ifFalse: [
			self renderSampleDashboardOn: html.
		].
	html document addLoadScript: ( ( JSStream on: '$(window).scrollTop(0)' ) ).