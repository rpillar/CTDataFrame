rendering
renderDashboardSummaryOn: html

	html div 
		class: 'row dashboard-header';
		style: 'margin-bottom:5px;';
			with: [  
				html div 
					class: 'col s12';
					with: [
						
						html div 
							class: 'col s4';
							style: 'border-right: 1px solid lightgray;height:200px;';
							with: [  
								html definitionList 
									with: [ 
										html div 
											class: 'col s12 dashboard-income-title center-align';
											with: [ 
												html span 
													class: 'border-under';
													with: 'Sales / Listings'. 
											].
										html div 
											class: 'col s12 left-align';
											style: 'margin-top:15px;';
											with: [
												html div 
													class: 'col s7';
													with: [
														html span 
															class: 'right';
															style: 'font-size: 20px; font-weight:400;';
															with: 'YTD : '.
													].
												html div 
													class: 'col s5';
													with: [	
														html span
															class: 'right';
															style: 'font-size: 20px; font-weight:300;';
															with: '£185,152'
													].
											].
										html div 
											class: 'col s12 left-align';
											style: 'margin-top:5px;';
											with: [
												html div 
													class: 'col s7';
													with: [
														html span 
															class: 'right';
															style: 'font-size: 20px; font-weight:400;';
															with: 'Last Month : '.
													].
												html div 
													class: 'col s5';
													with: [	
														html span
															class: 'right';
															style: 'font-size: 20px; font-weight:300;';
															with: '£16,278'
													].
											].
										html div 
											class: 'col s12 left-align';
											style: 'margin-top:5px;';
											with: [
												html div 
													class: 'col s7';
													with: [
														html span 
															class: 'right';
															style: 'font-size: 20px; font-weight:400;';
															with: 'Active Listings : '.
													].
												html div 
													class: 'col s5';
													with: [	
														html span
															class: 'right';
															style: 'font-size: 20px; font-weight:300;';
															with: '24'
													].
											].
										html div 
											class: 'col s12 left-align';
											style: 'margin-top:5px;';
											with: [
												html div 
													class: 'col s7';
													with: [
														html span 
															class: 'right';
															style: 'font-size: 20px; font-weight:400;';
															with: 'Messages : '.
													].
												html div 
													class: 'col s5';
													with: [	
														html span
															class: 'right';
															style: 'font-size: 20px; font-weight:300;';
															with: '2'
													].
											].
												
								]
							].
						html div 
							class: 'col s4';	
							style: 'border-right: 1px solid lightgray;height:200px;';	
							with: [  
								html definitionList 
									with: [ 
										html div
											class: 'dashboard-income-title center-align';
											with: [ 
												html span 
													class: 'border-under';
													with: 'Orders'.
											].	
										html div 
											class: 'col s12 left-align';
											style: 'margin-top:15px;';
											with: [
												html div 
													class: 'col s8';
													with: [
														html span 
															class: 'right';
															style: 'font-size: 20px; font-weight:400;';
															with: 'Outstanding : '.
													].
												html div 
													class: 'col s4';
													with: [	
														html span
															class: 'right';
															style: 'font-size: 20px; font-weight:300;';
															with: '14'
													].
											].	
										html div 
											class: 'col s12 left-align';
											style: 'margin-top:5px;';
											with: [
												html div 
													class: 'col s8';
													with: [
														html span 
															class: 'right';
															style: 'font-size: 20px; font-weight:400;';
															with: 'Processed : '.
													].
												html div 
													class: 'col s4';
													with: [	
														html span
															class: 'right';
															style: 'font-size: 20px; font-weight:300;';
															with: '75'
													].
											].	
										html div 
											class: 'col s12 left-align';
											style: 'margin-top:5px;';
											with: [
												html div 
													class: 'col s8';
													with: [
														html span 
															class: 'right';
															style: 'font-size: 20px; font-weight:400;';
															with: 'Returns : '.
													].
												html div 
													class: 'col s4';
													with: [	
														html span
															class: 'right';
															style: 'font-size: 20px; font-weight:300;';
															with: '7'
													].
											].	
										html div 
											class: 'col s12 left-align';
											style: 'margin-top:5px;';
											with: [
												html div 
													class: 'col s8';
													with: [
														html span 
															class: 'right';
															style: 'font-size: 20px; font-weight:400;';
															with: 'Cancellations : '.
													].
												html div 
													class: 'col s4';
													with: [	
														html span
															class: 'right';
															style: 'font-size: 20px; font-weight:300;';
															with: '1'
													].
											].	
									]			
							].	
						html div 
							class: 'col s4';
							with: [  
								html definitionList 
									class: 'col s12';
									style: 'margin-bottom:0px;';
									with: [ 
										html definitionTerm 
											class: 'dashboard-income-title center-align';
											with: [ 
												html span 
													class: 'border-under';
													with: 'Feedback Score'.
											].	
										html div 
											class: 'col s12 left-align';
											with: [
												html div 
													class: 'col s8 right-align';
													style: 'padding-top:40px;';
													with: [  
														html span 
															style: 'font-size:52px;font-weight:300;';
															with: '1,201'
													].
												html div 	
													class: 'col s4';
													style: 'padding-top:40px;';
													with: [  
														html italic 
															class: 'material-icons';
															style: 'font-size: 5rem; color:#000000';
															with: 'star'
													].
											]
									]
							].	  				  
					]
			].

