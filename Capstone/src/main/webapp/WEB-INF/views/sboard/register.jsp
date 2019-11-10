<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/header_json.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>중고장터</title>

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

/*search box css start here*/
.search-sec {
	padding: 2rem;
}

.search-slt {
	display: block;
	width: 100%;
	font-size: 0.875rem;
	line-height: 1.5;
	color: #55595c;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	height: calc(3rem + 2px) !important;
	border-radius: 0;
}

.wrn-btn {
	width: 100%;
	font-size: 16px;
	font-weight: 400;
	text-transform: capitalize;
	height: calc(3rem + 2px) !important;
	border-radius: 0;
	background-color: #f8bd3a;
	border-color: #f8bd3a;
}

@media ( min-width : 992px) {
	.search-sec {
		position: relative;
		top: -114px;
		background: white;
	}
}

@media ( max-width : 992px) {
	.search-sec {
		background: white;
	}
}
</style>
<body class="happy2">
	<!-- nav -->
	<%@include file="/WEB-INF/views/include/navbar.jsp"%>

	<!-- /nav -->

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container main-custom">

		<div class="btn btn-secondary wrn-btn">
			<a onclick="openChild()">온라인검색결과가져오기</a>
		</div>
		<br>
		<br>


		<!-- board Register Form -->
		<form role="form" method="post">
			<div class="box-body">
				<div class="form-group">
					<label for="Title">Title</label> <input type="text" name="title"
						class="form-control" id="title" placeholder="Enter BOOK Title">
				</div>
				<div class="form-group">
					<label for="Writer">Writer</label> <input type="text" name="writer"
						id="writer" class="form-control" placeholder="Enter Writer">
				</div>
				<div class="form-group">
					<label for="publisher">publisher</label> <input type="text"
						name="publisher" id="publisher" class="form-control"
						placeholder="Enter publisher">
				</div>
				<div class="form-group">
					<label for="pubdate">pubdate</label> <input type="text"
						name="pubdate" id="pubdate" class="form-control"
						placeholder="Enter publishing date">
				</div>
				<div class="form-group">
					<label for="isbn">isbn</label> <input type="text" name="isbn"
						class="form-control" id="isbn" placeholder="Enter isbn number">
				</div>
				<div class="form-group">
					<label for="org_price">org_price</label> <input type="text"
						id="price" name="org_price" class="form-control"
						placeholder="Enter Original price">
				</div>
				<div class="form-group">
					<label for="sale_price">sale_price</label> <input type="text"
						name="sale_price" class="form-control"
						placeholder="Enter Sale price">
				</div>
				<div class="form-group">
					<label for="Grade">Grade</label> <input type="text" name="grade"
						class="form-control" placeholder="Enter book Status ex)상 중 하">
				</div>
				<div class="form-group">
					<label for="Content">Content</label>
					<textarea class="form-control rounded-0" name="content" rows="10"
						placeholder="Enter description...."></textarea>
				</div>
				<div class="form-group">
					<label for="phone">phone</label> <input type="text" name="phone"
						class="form-control" placeholder="Enter your phone number">
				</div>
				<div class="form-group">
					<label for="contraction">contraction</label> <input type="text"
						name="contraction" class="form-control"
						placeholder="Enter contraction ways">
				</div>
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
		<!-- end of board Register Form -->
		<!-- Footer -->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>

		<!-- Footer end-->
	</div>

	<!-- script -->
	<script type="text/javascript">
		var openWin;

		function openChild() {
			window.name = "parentForm";
			openWin = window.open("http://localhost:8080/sboard/naverSearch",
					"childForm",
					"width=800, height=600, resizable=no, location=no")
		}
	</script>

</body>

</html>