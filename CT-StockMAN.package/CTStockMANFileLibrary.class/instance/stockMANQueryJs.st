uploaded
stockMANQueryJs
	^ '//jQuery(document).ready(function($) {
    $(''button#testanalytics'').on(''click'', function(e) {
      e.preventDefault();
      console.log(''You pressed me.'');
//      $.ajax({
//			     url: ''http://localhost:8082/transactions'',
//           contentType: ''application/json'',
//			     type: ''GET'',
//			     data: JSON.stringify({ "where": { "date": "2017-08-19" }, "fields": [ "date", "amount" ] }),
//			     dataType: ''json'',
//			     success: function(data,status) {
//			       console.log(''It worked ...'');
//			     },
//			     error: function(jqXHR,status,error) {
//              console.log( ''A problem has occurred - please try again.'' );
//			     }
//      });
    });
//});
'