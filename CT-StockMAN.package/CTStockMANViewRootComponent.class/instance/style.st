style
style 
	^ '
body {
	padding: 0;
 	margin: 0;
	overflow: auto !important;
	padding: 0 !important
}
.page-side-nav {
	z-index: 10;
	width: 90px;
	/*border-right: 1px solid lightgray;*/
	background-color:#e0f2f1;
	height: 100%;
	padding: 0;
	position: fixed;
	top:0;
	left:0;
}
.menu-title {  
	/*margin-top:20px;*/
	width:115px;
	height:80px;
	margin-top:0;
	margin-bottom:20px;
	font-size:52px;
	font-weight:300;color:gray;
	-moz-transform:rotate(-90deg);
	-webkit-transform:rotate(-90deg);
}
.page-title {  
	/*margin-top:20px;*/
	position: fixed;
	top: 90px;
	right:0px;
	width:85px;
	height:65px;
	font-size:72px;
	font-weight:300;
	opacity:0.8;
	-moz-transform:rotate(90deg);
	-webkit-transform:rotate(90deg);
}
.logout:hover .material-icons {  
	color: #004d40;
}

/* dashboard styles */
.dashboard-header {  
	padding-top: 20px;
}
.dashboard-income-title { 
	font-size:22px;
	font-weight:400;
	text-transform:uppercase
}
.dashboard-income-figure { 
	margin-left:0; 
	padding:10px 0 10px 0;
	font-size:24px;
	letter-spacing:-1px;
	line-height:1em;
	color:#34495e;
	font-weight:300;
}
.dashboard-income-percent { 
	margin-left:0; 
	padding-bottom:10px 0;
	font-size:24px;
	font-weight:300;
	letter-spacing:-1px;
	line-height:1em;
	color:#34495e;
}
.dashboard-income-arrow-up {  
	margin-left:40px;
	color:lightblue;
}
.dashboard-income-arrow-down {  
	margin-left:40px;
	color:red;
}
.dashboard-best-sellers {  
	margin-top: 20px;
	font-size: 16px;
	font-weight: 400;
}
.dashboard-other-title { 
	font-size:24px;
	font-weight:400;
	text-transform:uppercase
}
.dashboard-cust-title { 
	margin-left:0; 
	padding:40px 0 10px 0;
	font-size:26px;
	letter-spacing:-1px;
	line-height:1em;
	color:#34495e;
	font-weight:400;
	text-transform:uppercase
}
.dashboard-cust-subtitle { 
	margin-left:0; 
	padding:30px 0 10px 0;
	font-size:26px;
	letter-spacing:-1px;
	line-height:1em;
	color:#34495e;
	font-weight:400;
	text-transform:uppercase
}
.dashboard-cust-figure { 
	margin-left:0; 
	padding:30px 0 10px 0;
	font-size:26px;
	letter-spacing:-1px;
	line-height:1em;
	color:#34495e;
	font-weight:300;
}
.border-under {  
	border-bottom: 3px solid lightblue;
}

.sample-watermark {  
  position: fixed;
  bottom: 250px;
  left: 300px;
  z-index: 200;
  font-family: Kranky, cursive;
  font-size: 132px;
  opacity: 0.3;
}
'	