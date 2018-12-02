rendering
renderMenuLogoutOn: html

	html anchor 
		class: 'logout tooltipped';
		style: 'text-decoration: none;cursor:pointer;margin-left:20px;';
		attributeAt: 'data-position' put: 'right';
		attributeAt: 'data-delay' put: '50';
		attributeAt: 'data-tooltip' put: 'Logout';
		callback: [ self session doLogout. ];
		with: [
			html italic 
				class: 'material-icons';
				style: 'font-size:4rem;color:#004d40;margin-top:70px;';
				with: 'settings_power'  
		].  