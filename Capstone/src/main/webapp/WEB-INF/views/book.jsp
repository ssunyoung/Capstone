<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<%@include file="include/header_json.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>searchList Page</title>

<style type="text/css">
/*jumbotron*/
.jumbotron {
	position: relative;
	overflow: hidden;
}

.jumbotron .container {
	position: relative;
	z-index: 2;
	/*투명색 조절*/
	background: rgba(0, 0, 0, 0.2);
	padding: 2rem;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 3px;
	margin-top: 40px;
}

.jumbotron-background {
	object-fit: cover;
	font-family: 'object-fit: cover;';
	position: absolute;
	top: 0;
	z-index: 1;
	width: 100%;
	height: 100%;
	opacity: 0.5;
}

img.blur {
	-webkit-filter: blur(1px);
	filter: blur(0px);
	filter: progid:DXImageTransform.Microsoft.Blur(PixelRadius='4');
	width: 100%;
	height: 100%;
}

.title {
	font-size: 4.5rem;
	font-weight: 400;
	line-height: 1.2;
}

/*jumbotron end*/

/*navbar start*/
@media ( min-width : 768px) {
	.navbar-custom {
		-webkit-border-radius: 5px;
		-moz-border-radius: 3px;
		border-radius: 3px;
		background-color: #f8bd3a;
		width: auto;
		color: black;
	}
	.nav-item a, .navbar-brand {
		color: black;
	}
}

.navbar-custom {
	-webkit-border-radius: 5px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background-color: #f8bd3a;
	color: black;
}

.navbar-toggler-icon {
	color: white;
	border-color: black;
}

.navbar-toggler {
	color: white;
	border-color: black;
}

.navbar-custom .custom-toggler .navbar-toggler-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255,102,203, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 8h24M4 16h24M4 24h24'/%3E%3C/svg%3E");
}

.navbar-custom .custom-toggler .navbar-toggler {
	border-color: black;
}

@media ( min-width : 768px) {
	.navbar-wrapper {
		/* position: relative; */
		right: 0;
		left: 0;
		z-index: 20;
		color: #f8bd3a;
	}
}

.navbar-wrapper {
	position: absolute;
	top: -2px;
	right: 0;
	left: 0;
	/* margin-top: 20px; */
	z-index: 20;
	width: auto;
	color: #f8bd3a;
}

.text-yellow {
	color: #f8bd3a;
}

/*navbar end*/
.happy {
	color: saddlebrown;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

.happy2 {
	background: #f4f2e9;
}

</style>
<body class="happy2">
	<!-- nav -->
	<div class="navbar-wrapper row">
		<div class="container-fluid col">
			<nav class="navbar navbar-expand-lg navbar-custom shadow p-3 mb-5 rounded"> <a
				class="navbar-brand" href="#">LOGO</a> <!-- hamburger menu -->
			<button class="navbar-toggler custom-toggler" type="button"
				data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				</ul>
			</div>
			</nav>
		</div>
	</div>
	<!-- /nav -->

	<!-- <!--jumbotron 
	<div class="jumbotron jumbotron-fluid bg-dark">

		<div class="jumbotron-background">
			<img src="/resources/images/book4.jpg" class="blur ">
		</div>
		<div class="container text-white">
			<h1 class="title text-yellow font-italic">EveryBook,</h1>
			<br>
			<p class="lead">This is a simple hero unit, a simple
				jumbotron-style component for calling extra attention to featured
				content or information.</p>
			<hr class="my-4">
			<p>It uses utility classes for typography and spacing to space
				content out within the larger container.</p>
			<a class="btn btn-secondary btn-lg" href="#" role="button">Learn
				more</a>

		</div>
	</div>
	/jumbotron -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- Search box -->
	<div class="container">
		<br />
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8">
				<form class="card card-sm">
					<div class="card-body row no-gutters align-items-center">
						<div class="col-auto">
							<i class="fas fa-search h4 text-body"></i>
						</div>
						<!--end of col-->
						<div class="col">
							<form action="/everybook/book" method="POST">
								<input
									class="form-control form-control-lg form-control-borderless"
									type="search" placeholder="Search topics or keywords">
								<!-- 								<a href="javascript:fn_searchList()" name="queryWord"
									id="queryWord">Search</a> -->
						</div>
						<!--end of col-->
						<div class="col-auto">
							<button href="javascript:fn_searchList()"
								class="btn btn-lg btn-warning" type="submit" name="queryWord"
								id="queryWord">Search</button>
						</div>
				</form>

				<!--end of col-->
			</div>
			</form>
		</div>
		<!--end of col-->
	</div>
	</div>
	<!-- end of SearchBox -->
	<!-- test -->
	<div class="container-fluid"
		style="background-color: #f4f2e9; border-radius: 15px; width: auto; height: auto; margin-top: 20px; margin-left: 20px; margin-right: 20px;">
		<div class="container">
			<center>
<!-- 				<h1>11221</h1> -->
				<h3>"c언어 익스프레스" 로 검색한 결과입니다.</h3>
				<br> <br>
				<%
					String url = (String) request.getAttribute("addResult");
					//out.print("***************************");
					//out.print(url);
					Object obj = JSONValue.parse(url);
					JSONObject object = (JSONObject) obj;
					JSONArray items = (JSONArray) object.get("item");
					String result = items.toString();

					for (int i = 0; i < items.size(); i++) {
						out.print((i + 1) + "번째=>");
						JSONObject results = (JSONObject) items.get(i);
						out.print("title : <b>" + results.get("title") + "</b><br>");
						out.print("link : <b>" + results.get("link") + "</b><br>");
						out.print("priceSales : <b>" + results.get("priceSales") + "</b><br>");
						out.print("cover : <b>" + results.get("cover") + "</b><br>");
						//out.print(results.get("stockStatus") instanceof String);
						int range = 0;
						Object objj = "";

						out.print("aaaa" + objj);
						if (results.get("stockStatus").equals(null) && results.get("stockStatus").equals(objj)) {
							out.print("stockStatus : <b>이상무</b><br>");
						} else {
							out.print("stockStatus  : <b>" + results.get("stockStatus") + "123</b><br>");
						}
						out.print("publisher : <b>" + results.get("publisher") + "</b><br><hr>");

					}
				%>
			
		</div>

	</div>
	<!-- end of test -->


	<!-- Footer -->
	<footer class="pt-4 my-md-5 pt-md-5 border-top">
	<div class="row">
		<div class="col-12 col-md">
			<small class="d-block mb-3 text-muted">© 2017-2018</small>
		</div>
		<div class="col-6 col-md">
			<h5>Features</h5>
			<ul class="list-unstyled text-small">
				<li><a class="text-muted" href="#">Cool stuff</a></li>
				<li><a class="text-muted" href="#">Random feature</a></li>
				<li><a class="text-muted" href="#">Team feature</a></li>
				<li><a class="text-muted" href="#">Stuff for developers</a></li>
				<li><a class="text-muted" href="#">Another one</a></li>
				<li><a class="text-muted" href="#">Last time</a></li>
			</ul>
		</div>
		<div class="col-6 col-md">
			<h5>Resources</h5>
			<ul class="list-unstyled text-small">
				<li><a class="text-muted" href="#">Resource</a></li>
				<li><a class="text-muted" href="#">Resource name</a></li>
				<li><a class="text-muted" href="#">Another resource</a></li>
				<li><a class="text-muted" href="#">Final resource</a></li>
			</ul>
		</div>
		<div class="col-6 col-md">
			<h5>About</h5>
			<ul class="list-unstyled text-small">
				<li><a class="text-muted" href="#">Team</a></li>
				<li><a class="text-muted" href="#">Locations</a></li>
				<li><a class="text-muted" href="#">Privacy</a></li>
				<li><a class="text-muted" href="#">Terms</a></li>
			</ul>
		</div>
	</div>
	</footer>
	<!-- Footer end-->
	<!-- script -->
	<script type="text/javascript">
		$('#collapsibleNavbar').collapse({
			toggle : false
		})
	</script>
	<script type="text/javascript">
		function fn_searchList() {
			var queryWord = $("#queryWord").val();
		}
	</script>

	<!--
For IE support of object-fit add this to your document
&lt;script src="https://cdnjs.cloudflare.com/ajax/libs/object-fit-images/3.2.4/ofi.min.js"&gt;&lt;/script&gt;
-->
</body>

</html>