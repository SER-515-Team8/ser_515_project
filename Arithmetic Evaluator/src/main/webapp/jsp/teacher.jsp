<html>
   <head>
	<title>Arithmetic Evaluator</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/arithmetic-evaluator/css/teachers.css">
<link rel="stylesheet" href="/arithmetic-evaluator/css/style_common.css">
<script src="/arithmetic-evaluator/js/common.js"></script>

</head>
   <body>
		<nav class="navbar navbar-inverse" style="margin-bottom:0px !important">
       		<div class="container-fluid">
          	<div class="navbar-header">
              <a class="navbar-brand titleText" href="#">Arithmetic Evaluator</a>
          	</div>
          	<ul class="nav navbar-nav navbar-right">
    				
    				<li><a href="/arithmetic-evaluator/admin/dashboard_page.action">Dashboard</a></li>
    				<li class="active fontSansSerif"><a href="#">Teachers</a></li>
    				<li><a href="/arithmetic-evaluator/admin/addTeacher_page.action">Create Teacher Account</a></li>
    				<li>
    					<div class="dropdown">
 							<a href="#" class="dropbtn">
        						<span class="glyphicon glyphicon-user" style="padding-top:16%; margin-right:30px;"></span>
        					</a>
  							<div class="dropdown-content">
    							<a href= "/arithmetic-evaluator/" id="myBtn"><span class="glyphicon glyphicon-log-in"></span> Logout</a>
  							</div>
						</div>
      				</li>
    			</ul>
        	</div>
  		</nav>
	
		<section style="display:inline-block; text-align:center; margin-left:23%">
			<div id="message" class="alert alert-info display-none"></div>
			<div class="table-users" id="teacher1"></div>
		</section>

	<script type="text/javascript">
	$( document ).ready(function() {
		var message = "${message}";
		if(message) {
			$("#message").text(message);
			$("#message").show();
			setTimeout(function() {$("#message").hide();}, 5000);
		}
	});

	window.onload = function() {
		fetchTeachers();
 	};
 	
	function fetchTeachers() {
		var url="listTeachers.action";
		sendAjaxRequest(url, function(resp){
	 		var tableContent = '<div class="header">Institution Teachers</div>' +
	 							'<table cellspacing="0">' + 
	 								'<tr>' +
	 	      							'<th>First Name</th>' +
	 	      							'<th>Last Name</th>' +
	 	      							'<th>Email-ID</th>' +
	 	      							'<th></th>' +
	 	    						'</tr>';
	 		
			$.each(resp.teachers, function() {
	 	    tableContent += '<tr>';
	 	   	tableContent += '<td>' + this.firstName + '</td>';
	 	  	tableContent += '<td>' + this.lastName + '</td>';
	 	   	tableContent += '<td>' + this.email + '</td>';
	 	    tableContent += '<td> <button onClick="confirmRemoveTeacher(\'' + this.email + '\')">Remove Teacher</button></td>';
	 	   	tableContent += "</tr>";
	 	    });
			tableContent += "</table>";
			$("#teacher1").html(tableContent);
	 	});
	}
		
     	
     	function confirmRemoveTeacher(emailID) {
     		var deleteTeacher = confirm("Are you sure you want to remove user " + emailID + " ? ");
     		if(deleteTeacher) {
     			var url="/arithmetic-evaluator/admin/teacher/remove.action?emailID=" + emailID;
     			sendAjaxRequest(url, function(resp){
     				$("#message").text(resp.message);
     				$("#message").show();
     				setTimeout(function() {$("#message").hide();}, 4000);
     				fetchTeachers();
     			});
     		}
     	}

 		function buttonclick(){
         	window.location="addTeacher_page.action";
     	}
 	</script>
	</body>
</html>
