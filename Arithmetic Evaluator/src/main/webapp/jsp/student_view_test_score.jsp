<html>
   <head>
	<title>Arithmetic Evaluator</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/arithmetic-evaluator/css/view_test_score.css">
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

    				<li><a href="/arithmetic-evaluator/student/dashboard.action">Dashboard</a></li>
    				<li class=""><a href="/arithmetic-evaluator/student/taketests_page.action">Take Test</a></li>
    				<li class="active fontSansSerif"><a href="/arithmetic-evaluator/student/viewtestscores_page.action">View Scores</a></li>
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
        			<div class="table-users" id="student1"></div>
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
		fetchGradeTestScoreDetails();
 	};

	function fetchGradeTestScoreDetails() {
	    var url = "viewTestScores.action"
		sendAjaxRequest(url, function(resp){
		    console.log(resp);
	 		var tableContent = '<div class="header">Test Score Details</div>' +
	 							'<table cellspacing="0">' +
	 								'<tr>' +
	 	      							'<th>Test Name</th>' +
	 	      							'<th>Test Score</th>' +
	 	      							'<th>View Test Details</th' +
	 	    						'</tr>';

			$.each(resp.testScoreList, function() {
	 	    tableContent += '<tr>';
	 	  	tableContent += '<td>' + this.testName + '</td>';
	 	   	tableContent += '<td>' + this.score + ' %</td>';
	 	   	tableContent += '<td> <button onClick="confirmViewTestDetails(\'' + this.testId + '\')">View Details</button></td>';
	 	    tableContent += "</tr>";
	 	    });
			tableContent += "</table>";
			$("#student1").html(tableContent);
	 	});
	}
	function confirmViewTestDetails(testId) {
         		var confirmView = confirm("Do you want to view the correct answers"+" ? ");
         		if(confirmView) {
         			window.location = "viewCorrectAnswers_page.action?testId=" + testId;
         		}
         	}
	</script>
    </body>
</html>
