rendering
renderMenuDashboardOn: html

	html anchor 
		class: 'dashboard tooltipped';
		style: 'text-decoration: none;cursor:pointer;margin-left:16px;';
		attributeAt: 'data-position' put: 'right';
		attributeAt: 'data-delay' put: '50';
		attributeAt: 'data-tooltip' put: 'Dashboard';
		script: (
			html jQuery this 
			on: 'click'
			do: (
				( ( html jQuery id: 'main' ) load html: [ :r | self renderPageDashboardOn: r ] )
			)
		);  
		with: [
			html italic 
				class: 'material-icons';
				style: 'font-size:4rem;color:#004d40;margin-top:10px;';
				with: 'dashboard'  
		].  