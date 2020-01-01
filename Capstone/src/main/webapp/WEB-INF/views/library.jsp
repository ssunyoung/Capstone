<%@page
	import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@page import="com.mysql.cj.Session"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<%@include file="include/header_json.jsp"%>
<%@ page import="java.util.ArrayList.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>도서관 검색</title>

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
</style>
<body class="happy2">
	<!-- nav -->
	<%@include file="/WEB-INF/views/include/navbar.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- Search box -->
	<div class="container">
		<%
			request.setCharacterEncoding("UTF-8");
			String isbn = request.getParameter("isbn");
		%>
		<br>
		<form>
			<div class="row shadow p-4 mb-4 bg-white ">
				<!--end of col-->
				<form action="/bookbook/library" method="GET">
					<div class="col-lg-6">
						지역 : <input class="form-control search-slt" type="text"
							placeholder="ex)서울" name='region' required />
					</div>
					<div class="col-lg-6">

						상세지역 : <input class="form-control search-slt" type="text"
							placeholder="ex)성북" name='region2' required /> <br>
					</div>
					<div class="col-lg-12">
						ISBN :<%
						if (isbn != null) {
					%>
						<input class="form-control" type="text" name="isbn"
							value="<%=isbn%>" readonly="readonly" required/>
						<%
							} else {
						%>
						<input class="form-control" placeholder="ISBN입력하세요." type="text"
							name="isbn" required/>
						<%
							}
						%>
						<br>
					</div>
					<br> <br>
				</form>
				<button id="searchBtn" class="btn btn-danger wrn-btn">Search</button>
			</div>
		</form>
		<!--end of col-->


		<!-- end of SearchBox -->
		<c:if test="${empty regions}">
			도서관 정보가 없습니다.<br>
			검색어를 다시 입력해주세요.
		</c:if>
		<c:if test="${!empty regions}">

			<table class="table table-striped table-bordered table-hover">

				<c:forEach items="${regions}" var="libVO">
					<tr>
						<td>${libVO.libName}</td>
						<td>${libVO.libAddr}</td>
						<td>${libVO.libCode}</td>
						<td>
							<form role="form">
								<input type="hidden" name="region"
									value=<%=request.getParameter("region")%> /> <input
									type="hidden" name="region2"
									value=<%=request.getParameter("region2")%> /> <input
									type="hidden" name="isbn"
									value=<%=request.getParameter("isbn")%> />

								<button type="submit" id="code" class='btn btn-warning'
									name="code" value='${libVO.libCode}'>소장여부확인</button>

								<c:if test="${reCode eq libVO.libCode}">
									<p>${libVO.libName}에
										<b id="scroll"> ${checking} </b>
									</p>
								</c:if>
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>


		<!-- Footer -->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>
		<!-- Footer end-->
	</div>


	<!-- script -->
	<script type=text/javascript>
		var formObj = $("form[role='form']");
		var tempScroll;
		$("#check").on("click", function() {
			tempScroll = $(window).scrollTop();
			formObj.attr("action", "/bookbook/library");
			formObj.attr("method", "get");
			formObj.submit();

		})
		$(document).ready(function() {
			$('html, body').animate({
				scrollTop : $('#scroll').offset().top-70
			}, 'slow');
		});
	</script>
</body>

</html>