<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/header_json.jsp"%>
<%@ page import="java.util.ArrayList.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Naver Searching List</title>

<style type="text/css">

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

/* book img start */
.thumbnail_image {
	position: relative;
	box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.4);
}

.thumbnail_image::before {
	content: "";
	box-sizing: border-box;
	display: block;
	position: absolute;
	left: 0px;
	top: 0px;
	background: linear-gradient(to right, rgba(0, 0, 0, 0.2) 0px,
		transparent 5%, transparent 95%, rgba(0, 0, 0, 0.2) 100%);
}

.thumbnail {
	max-height: 313px;
}

.thumbnail-border {
	box-sizing: border-box;
	opacity: 0.2;
	display: block;
	position: absolute;
	left: 0px;
	top: 0px;
	z-index: 3;
	border: 1px solid #000;
}
</style>
</head>
<body class="happy2">

	<!-- nav -->
	<%@include file="/WEB-INF/views/include/navbar.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1>naver search page</h1>
	<div class="container">
		<!-- Search box -->
		<form>
			<div class="row shadow p-4 mb-4 bg-white ">
				<!--end of col-->
				<form action="/sboard/naverSearch" method="GET">
					<input class="form-control search-slt" type="text"
						placeholder="책 이름  검색하시오." name='naverQuery' id="" />
				</form>
				<button id="searchBtn" class="btn btn-danger wrn-btn">Search</button>
			</div>
		</form>
		<!-- end of SearchBox -->

		<!-- Naver Searching Part -->
		<table border="1" bgcolor="pink">
			<tr>
				<td colspan="7" bgcolor="pink"></td>
			</tr>

			<c:forEach items="${naverRes}" var="b">
				<tr>
					<td rowspan="2"><img src="${b.image}"
						></td>
					<td rowspan="4" width="800"><input value="${b.title }"
						id="title" /></td>
					<td width="200"><input value="${b.author}" id="writer" /></td>
				</tr>
				<tr>
					<td width="200"><input value="${b.price }" id="price" /></td>
					<td width="200">${b.discount }</td>
					<td width="200"><input value="${b.publisher }" id="publisher" /></td>
					<td width="200"><input value="${b.pubdate }" id="pubdate" /></td>
					<td width="200"><input value="${b.isbn }" id="isbn" /></td>
				</tr>

				<tr>

					<td colspan="7">${b.description}<input type="button"
						value="전달하기" onclick="setParentText(); window.close(); alert('자동완성 처리완료 나머지 정보를 입력해주세요.')" />
					</td>
				</tr>
				<tr>
					<td colspan="7" width="100%" bgcolor="pink"></td>

				</tr>

			</c:forEach>
		</table>
		<!-- End of Naver Searching Part -->

		<!--  conatiner end -->
	</div>


	<!-- script -->
	<script type="text/javascript">
		$('#collapsibleNavbar').collapse({
			toggle : false
		})

		function setParentText() {
			opener.document.getElementById("title").value = document
					.getElementById("title").value;
			opener.document.getElementById("writer").value = document
					.getElementById("writer").value;
			opener.document.getElementById("publisher").value = document
					.getElementById("publisher").value;
			opener.document.getElementById("pubdate").value = document
					.getElementById("pubdate").value;
			opener.document.getElementById("price").value = document
					.getElementById("price").value;
			opener.document.getElementById("isbn").value = document
					.getElementById("isbn").value;

		}
	</script>
</html>