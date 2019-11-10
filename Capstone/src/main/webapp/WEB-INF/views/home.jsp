<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>북-북</title>
<link href="resources/css/book.css" rel="stylesheet" type="text/css">

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
		background-color: #f8bd3a;
		width: auto;
		color: black;
	}
	.nav-item a, .navbar-brand {
		color: black;
	}
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
		position: relative;
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
	z-index: 20;
	width: auto;
	color: #f8bd3a;
}

.text-yellow {
	color: #f8bd3a;
}

.navbar-default {
	background-color: black;
	transition: 500ms ease;
	background: transparent;
}

.navbar-default.scrolled {
	background: #000;
	background-color: rgba(0, 0, 0, 0.7);
}

.navbar-default.scrolled a {
	color: #f8bd3a;
}

.navbar-brand, .nav-link {
	color: black;
}

/*navbar end*/
body {
	background-color: #f4f2e9;
	background-image:
		url("https://www.transparenttextures.com/patterns/wood-pattern.png");
}
</style>
<body>
	<!-- nav -->
	<div class="navbar-wrapper">
		<nav class="navbar navbar-expand-lg navbar-default fixed-top"> <a
			class="navbar-brand" href="/"><b>북-북</b></a> <!-- hamburger menu -->
		<button class="navbar-toggler custom-toggler" type="button"
			data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/sboard/list">중고장터</a></li>
				<li class="nav-item"><a class="nav-link" href="/bookbook/book">북북
						비교검색</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/bookbook/library">도서관 검색</a></li>
			</ul>
		</div>
		</nav>
	</div>
	<!-- /nav -->

	<!--jumbotron -->
	<div class="jumbotron jumbotron-fluid bg-dark">
		<div class="jumbotron-background">
			<img src="resources/images/book4.jpg" class="blur ">
		</div>
		<div class="container text-white text-center">
			<h1 class="title text-yellow font-italic">
				<u>BOOK</u> ,book
			</h1>
			<br>
			<p class="h3 text-yellow">중고책을 검색하고, 결과를 확인하세요!</p>
			<!--<hr class="my-4">-->
			<em class="lead">You can search for any used book. And get the
				results!</em>
			<!-- Search box Starttttttttttttttttt-->
			<div class="row justify-content-center">
				<div class="col-12 col-md-10 col-lg-8">

					<div class="card-body row no-gutters align-items-center">

						<div class="col">
							<input
								class="form-control form-control-lg form-control-borderless"
								type="text" placeholder="검색어를 입력해보세요." name='keyword'
								id="keywordInput" value='${cri.keyword}' />
						</div>
						<div class="col-auto">
							&nbsp
							<button class="btn btn-lg btn-warning" id="searchBtn">Search</button>
						</div>
					</div>
				</div>
			</div>
			<!-- search Box endddddd -->

		</div>
	</div>
	<!-- /jumbotron -->

	<h4 class="text-center">
		<em>Welcome to the <u>Book</u>book
		</em>
	</h4>
	<hr>



	<div class="container">
		<div class="row">
			<!--FIND start -->
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book-default">
					<p class="text-center book-font">
		
					</p>
					
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book fold">
					<p class="text-center book-font">F</p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book">
					<p class="text-center book-font">I</p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book">
					<p class="text-center book-font">N</p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book">
					<p class="text-center book-font">D</p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book-default">
								<h6 class="text-center">
						<br><br><br>
						<em>이용이 <br>처음이신가요?</em>
						<br><br>
						<a href="/bookbook/help">도움말 보러가기</a>
					</h6>
				</div>
			</div>

			<div class="col-12 shelf d-none d-lg-block d-xl-block"></div>
			<!-- FIND end -->
			<!--THE start -->
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book-default">
					<p class="text-center book-font"></p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book-default">
					<p class="text-center book-font"></p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book fold">
					<p class="text-center book-font">T</p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book">
					<p class="text-center book-font">H</p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book">
					<p class="text-center book-font">E</p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book-default">
					<p class="text-center book-font"></p>
				</div>
			</div>
			<div class="col-12 shelf d-none d-lg-block d-xl-block"></div>
			<!-- THE end -->
			<!--BOOK start -->
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book-default">
					<p class="text-center book-font"></p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book fold">
					<p class="text-center book-font">B</p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book">
					<p class="text-center book-font">O</p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book">
					<p class="text-center book-font">O</p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book">
					<p class="text-center book-font">K</p>
				</div>
			</div>
			<div class="col-md-3 col-lg-2 d-none d-xs-none d-sm-none d-lg-block">
				<div class="book-default">
					<p class="text-center book-font"></p>
				</div>
			</div>
			<div class="col-12 shelf d-none d-lg-block d-xl-block"></div>
			<!-- BOOK end -->
		</div>

		<!-- Footer Start -->
		<%@include file="include/footer.jsp"%>
		<!-- Footer End -->
	</div>
	<!--  Container end -->
	<!-- script -->
	<script>
		$(document).ready(
				function() {
					$('#searchBtn').on(
							"click",
							function(event) {
								self.location = "/sboard/list"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType=n" + "&keyword="
										+ encodeURI($('#keywordInput').val());
							});
					$('#newBtn').on("click", function(evt) {
						self.location = "register";
					});
				});
	</script>
	<script type="text/javascript">
		$('#collapsibleNavbar').collapse({
			toggle : false
		})
		$(window).scroll(function() {
			$('nav').toggleClass('scrolled', $(this).scrollTop() > 50);
		});
	</script>
</body>

</html>