<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/header_json.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>board Each Read Form + searching</title>

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

.main-custom {
	backgournd-color: lightyellow !important;
}
</style>
<!-- end of style -->
<body class="happy2">
	<!-- nav -->
	<div class="navbar-wrapper row">
		<div class="container-fluid col">
			<nav
				class="navbar navbar-expand-lg navbar-custom shadow p-3 mb-5 rounded">
			<a class="navbar-brand" href="#">LOGO</a> <!-- hamburger menu -->
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

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- Search box -->
	<div class="container">
		<br>
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
		</div>
		<!--end of col-->
	</div>
	<!-- end of SearchBox -->

	<!-- board Register Form with Paging-->
	<div class="container main-custom">
		<form role="form" action="modifyPage" method="post">

			<input type='hidden' name='bno' value="${boardVO.bno}">
			<input type='hidden' name='page' value="${cri.page}">
			<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
			<input type='hidden' name='searchType' value="${cri.searchType}">
			<input type='hidden' name='keyword' value="${cri.keyword}">
			
		</form>

			<div class="box-body">
				<div class="form-group">
					<label for="Title">Title</label> <input type="text" name="title"
						class="form-control" value="${boardVO.title}" readonly="readonly"
						placeholder="Enter BOOK Title">
				</div>
				<div class="form-group">
					<label for="Writer">Writer</label> <input type="text" name="writer"
						class="form-control" value="${boardVO.writer}" readonly="readonly"
						placeholder="Enter Writer">
				</div>
				<div class="form-group">
					<label for="publisher">publisher</label> <input type="text"
						name="publisher" class="form-control" value="${boardVO.publisher}"
						readonly="readonly" placeholder="Enter publisher">
				</div>
				<div class="form-group">
					<label for="pubdate">pubdate</label> <input type="text"
						name="pubdate" class="form-control" value="${boardVO.pubdate}"
						readonly="readonly" placeholder="Enter publishing date">
				</div>
				<div class="form-group">
					<label for="isbn">isbn</label> <input type="text" name="isbn"
						class="form-control" value="${boardVO.isbn}" readonly="readonly"
						placeholder="Enter isbn number">
				</div>
				<div class="form-group">
					<label for="org_price">org_price</label> <input type="text"
						name="org_price" class="form-control" value="${boardVO.org_price}"
						readonly="readonly" placeholder="Enter Original price">
				</div>
				<div class="form-group">
					<label for="sale_price">sale_price</label> <input type="text"
						name="sale_price" class="form-control"
						value="${boardVO.sale_price}" readonly="readonly"
						placeholder="Enter Sale price">
				</div>
				<div class="form-group">
					<label for="Grade">Grade</label> <input type="text" name="grade"
						class="form-control" value="${boardVO.grade}" readonly="readonly"
						placeholder="Enter book Status ex)상 중 하">
				</div>
				<div class="form-group">
					<label for="Content">Content</label>
					<textarea class="form-control rounded-0" name="content" rows="10"
						value="${boardVO.content}" readonly="readonly"
						placeholder="Enter description...."></textarea>
				</div>
				<div class="form-group">
					<label for="phone">phone</label> <input type="text" name="phone"
						class="form-control" value="${boardVO.phone}" readonly="readonly"
						placeholder="Enter your phone number">
				</div>
				<div class="form-group">
					<label for="contraction">contraction</label> <input type="text"
						name="contraction" class="form-control"
						value="${boardVO.contraction}" readonly="readonly"
						placeholder="Enter contraction ways">
				</div>
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-warning">Modify</button>
				<button type="submit" class="btn btn-danger">REMOVE</button>
				<button type="submit" class="btn btn-primary">List ALL</button>
			</div>
	</div>
	<!-- end of board Register Form -->
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
	<!-- paging script -->
	<script type="text/javascript">
	
	</script>
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
	<script>
		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-warning").on("click", function() {
				formObj.attr("action", "/sboard/modifyPage");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".btn-danger").on("click", function() {
				formObj.attr("action", "/sboard/removePage");
				formObj.submit();
			});

			$(".btn-primary").on("click", function() {
/* 				self.location = "/board/listAll";
 */
 				formObj.attr("method", "get");
 				formObj.attr("action", "/sboard/list");
 				formObj.submit()
			});
		});
	</script>
</body>

</html>