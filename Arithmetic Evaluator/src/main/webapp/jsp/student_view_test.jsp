<html>
   <head>
	<title>Arithmetic Evaluator</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/arithmetic-evaluator/css/test_details.css">
<link rel="stylesheet" href="/arithmetic-evaluator/css/style_common.css">
<script src="/arithmetic-evaluator/js/common.js"></script>

</head>
   <body style="min-width:100%">
		<nav class="navbar navbar-inverse" style="margin-bottom:0px !important">
       		<div class="container-fluid">
          	<div class="navbar-header">
              <a class="navbar-brand titleText" href="#">Arithmetic Evaluator</a>
          	</div>
          	<ul class="nav navbar-nav navbar-right">
    				
    				<li><a href="/arithmetic-evaluator/teacher/dashboard.action">Dashboard</a></li>
    				<li class="active fontSansSerif"><a href="#">Take Test</a></li>
    				<li class=""><a href="/arithmetic-evaluator/teacher/createtest_page.action">View Scores</a></li>

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
		fetchGradeTestDetails();
 	};

	function fetchGradeTestDetails() {
		var url="gradetestdetails.action";
		sendAjaxRequest(url, function(resp){
		    console.log(resp);
		    var count = 0;
	 		var tableContent = '<div class="header">Test Details</div>' +
	 							'<table cellspacing="0">' +
	 								'<tr>' +
	 	      							'<th>SNo</th>' +
	 	      							'<th>Test Name</th>' +
<<<<<<< HEAD
=======
	 	      							'<th></th>'+
>>>>>>> a9523805986728c4445fc3efe9a8373992f1a70c
	 	    						'</tr>';

			$.each(resp.testDetails, function() {
	 	    tableContent += '<tr> <a href="/arithmetic-evaluator/student/take_test.action?testID=' + this.testId + '">';
	 	   	tableContent += '<td>' + count++ + '</td>';
	 	  	tableContent += '<td>' + this.testName + '</td>';
<<<<<<< HEAD
	 	    tableContent += "</tr>";
=======
	 	  	tableContent += '<td> <button onClick="takeTest(\'' + this.testId + '\')">Take Test</button></td>';
	 	    tableContent += "</a></tr>";
>>>>>>> a9523805986728c4445fc3efe9a8373992f1a70c
	 	    });
			tableContent += "</table>";
			$("#teacher1").html(tableContent);
	 	});
	}

	function takeTest(testID) {
		var url="/arithmetic-evaluator/student/take_test.action?testID=" + testID;
		window.location=url;
	}
	function buttonclick(){
	      	window.location="addTeacher_page.action";
	}
 	</script>
	</body>
</html>
