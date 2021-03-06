<html>
<head>
<title>teacher's dashboard</title>
<link rel="stylesheet" href="/arithmetic-evaluator/css/dashboard.css">
<link rel="stylesheet" href="/arithmetic-evaluator/css/style_common.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/arithmetic-evaluator/css/teachers_dashboard.css">
</head>
<body>
	<div class="grid-container">

		<header class="header">
			<nav class="navbar navbar-inverse"
				style="margin-bottom: 0px !important;">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand titleText" href="#">Arithmetic
							Evaluator</a>
					</div>
					<ul class="nav navbar-nav navbar-right">
						<li class="active fontSansSerif"><a href="#">Dashboard</a></li>
						<li>
							<div class="dropdown">
								<a href="#" class="dropbtn"> <span
									class="glyphicon glyphicon-user"
									style="padding-top: 16%; margin-right: 30px;"></span>
								</a>
								<div class="dropdown-content">
									<a href="/arithmetic-evaluator/" id="myBtn"><span
										class="glyphicon glyphicon-log-in"></span> Logout</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</nav>
		</header>

		<main class="main">
		<div class="main-cards">

			<div class="w3-card-4" onclick="goToCreateTestPage()"
				style="background-color: white; text-align: center">
				<br>
				<h1>CREATE TEST</h1>


				<img src="/arithmetic-evaluator/image/createtest.jpg"

					alt="Alps" style="width: 100%; max-height: 510px">
			</div>


			<div class="w3-card-4" onclick="goToViewTestsPage()" style="background-color: white; text-align: center">
				<br>
				<h1>VIEW TESTS</h1>


				<img src="/arithmetic-evaluator/image/viewtest.png"

					alt="Alps" style="width: 100%; max-height: 510px">
			</div>

		</div>
		</main>
	</div>
	
	<script>
		function goToCreateTestPage(){
	   		window.location="/arithmetic-evaluator/teacher/createtest_page.action";
		}
		
		function goToViewTestsPage(){
	   		window.location="/arithmetic-evaluator/teacher/viewtests_page.action";
		}
	</script>
</body>
</html>