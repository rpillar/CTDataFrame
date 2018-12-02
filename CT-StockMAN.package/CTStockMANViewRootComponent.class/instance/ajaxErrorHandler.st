ajax
ajaxErrorHandler 
	^ ' if (jqxhr.status == 403) { 
		window.location.assign("/StockMAN?expired=true"); 
        } else { 
            alert("This program just broke. You can either try again, sign out and sign in and try again, or contact us about error: " + exception);   
        }' 