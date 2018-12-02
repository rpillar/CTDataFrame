rendering
renderMenuSettingsOn: html

	html anchor 
		class: 'settings tooltipped';
		style: 'text-decoration: none;cursor:pointer;margin-left:20px;height:20px;';
		attributeAt: 'data-position' put: 'right';
		attributeAt: 'data-delay' put: '50';
		attributeAt: 'data-tooltip' put: 'Admin';
		onClick: ( ( html jQuery ajax )
			script: [ :s | 
				s << ( ( s jQuery id: 'main' ) load html: [ :r | self renderPageSettingsOn: r ] ).
			]
		);  
		with: [
			html italic 
				class: 'material-icons';
				style: 'font-size:4rem;color:#004d40;margin-top:10px;';
				with: 'settings'  
		].  