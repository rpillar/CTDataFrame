as yet unclassified
renderContentOn: html

	"Analytics page ..."	
	html div 
		with: [  
			html div 
				class: 'page-title';
				with: 'Analytics'.
		].
	
	html div 
		style: 'margin-top:50px;';
		with: [  
			html button
				bePush;
				class: 'btn-large waves-effect waves-light hoverable';
				id: 'testanalytics';
				with: 'Check'.
		].
	
	html document addLoadScript: ( ( JSStream on: 
		'$(''#testanalytics'').on( ''click'', function() { 
			console.log( ''You pressed me ...'');
	      $.ajax({
         		url: ''http://localhost:8082/transactions'',
         		contentType: ''application/json'',
        		type: ''GET'',
        		data: JSON.stringify({ "where": { "date": "2017-08-19" }, "fields": [ "date", "amount" ] }),
        		dataType: ''json'',
         		success: function(data,status) {
         			console.log(''It worked ...'');
	     		},
        		error: function(jqXHR,status,error) {
        			console.log( ''A problem has occurred - please try again.'' );
        		}
      		});
		})' 
	) ).