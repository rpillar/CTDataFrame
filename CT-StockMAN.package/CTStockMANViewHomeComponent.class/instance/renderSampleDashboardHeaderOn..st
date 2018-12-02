rendering
renderSampleDashboardHeaderOn: html

	html div 
		class: 'row dashboard-header';
			with: [  
				html div 
					class: 'col s12';
					with: [
						
						html div 
							class: 'col s4';
							with: [  
								html definitionList 
									with: [ 
										html definitionTerm 
											class: 'dashboard-income-title center-align';
											with: [ 
												html span 
													class: 'border-under';
													with: 'EBay'. 
											].
										html definitionData 
											class: 'dashboard-income-figure center-align';
											with: '185,152'.
										html definitionData 
											class: 'dashboard-income-percent center-align';
											with: [
												html span
													with: '12%'.
												html italic	
													class: 'material-icons';
													style: 'margin-left:20px;font-size:4rem;color:#009688;';
													with: 'trending_up'.  
											].			
								]
							].
						html div 
							class: 'col s4';	
							with: [  
								html definitionList 
									with: [ 
										html definitionTerm 
											class: 'dashboard-income-title center-align';
											with: [ 
												html span 
													class: 'border-under';
													with: 'Shopify'. 
											].
										html definitionData 
											class: 'dashboard-income-figure center-align';
											with: '102,453'.
										html definitionData 
											class: 'dashboard-income-percent center-align';
											with: [
												html span
													with: '16%'.
												html italic	
													class: 'material-icons';
													style: 'margin-left:20px;font-size:4rem;color:#009688;';
													with: 'trending_up'.   
											]
									]				
							].	
						html div 
							class: 'col s4';
							with: [  
								html definitionList 
									with: [ 
										html definitionTerm 
											class: 'dashboard-income-title center-align';
											with: [ 
												html span 
													class: 'border-under';
													with: 'Total Sales'. 
											].
										html definitionData 
											class: 'dashboard-income-figure center-align';
											with: '82,699'.
										html definitionData 
											class: 'dashboard-income-percent center-align';
											with: [
												html span
													with: '2%'.
												html italic	
													class: 'material-icons';
													style: 'margin-left:20px;font-size:4rem;color:#ef5350;';
													with: 'trending_down'.   
											]
									]
							].	  				  
					]
			].

