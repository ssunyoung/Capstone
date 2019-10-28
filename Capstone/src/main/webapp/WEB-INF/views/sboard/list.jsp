<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/header_json.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>board List Page + searching</title>

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
				<div class="card-body row no-gutters align-items-center">
					<div class="col-auto">
						<i class="fas fa-search h4 text-body"></i>
					</div>
					<!--end of col-->
					<div class="col-auto">
						<select class="form-control" name="searchType">
							<option value="n"
								<c:out value ="${cri.searchType == null?'selected':''}" />>전체검색</option>
							<option value="t"
								<c:out value ="${cri.searchType eq 't'?'selected':''}" />>Title</option>
							<option value="c"
								<c:out value ="${cri.searchType eq 'c'?'selected':''}" />>Content</option>
							<option value="w"
								<c:out value ="${cri.searchType eq 'w'?'selected':''}" />>Writer</option>
							<option value="tc"
								<c:out value ="${cri.searchType eq 'tc'?'selected':''}" />>Title
								OR Content</option>
							<option value="cw"
								<c:out value ="${cri.searchType eq 'cw'?'selected':''}" />>Content
								OR Writer</option>
							<option value="tcw"
								<c:out value ="${cri.searchType eq 'tcw'?'selected':''}" />>Title
								OR Content OR Writer</option>
						</select>
					</div>

					<div class="col-auto">
						<input
							class="form-control form-control-lg form-control-borderless"
							type="text" placeholder="Search topics or keywords"
							name='keyword' id="keywordInput" value='${cri.keyword}' />
					</div>
					<!--end of col-->
					<div class="col-auto">
						<button id="searchBtn" class="btn btn-lg btn-warning">Search</button>
						<button id="newBtn">New Board</button>
					</div>
					<!--end of col-->
				</div>
			</div>
			<!--end of col-->
		</div>
		<!-- end of SearchBox -->

		<!-- board list All start -->
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th style="width: 10px">BNO</th>
					<th>Title</th>
					<th>Writer</th>
					<!-- <th>publisher</th>
			<th>pubdate</th>
			<th>isbn</th>
			<th>org_price</th>
			<th>sale_price</th>
			<th>Grade</th>
			<th>Content</th>
			<th>phone</th>
			<th>contraction</th> -->
					<th>regDate</th>
					<th>viewcnt</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="boardVO">
				<tr>
					<td>${boardVO.bno}</td>
					<td>
						<%-- <a
						href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}</a> --%>
						<a
						href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}</a>
					</td>
					<td>${boardVO.writer}</td>
					<%-- <td>${boardVO.publisher}</td>
				<td>${boardVO.pubdate}</td>
				<td>${boardVO.isbn}</td>
				<td>${boardVO.org_price}</td>
				<td>${boardVO.sale_price}</td>
				<td>${boardVO.grade}</td>
				<td>${boardVO.content}</td>
				<td>${boardVO.phone}</td>
				<td>${boardVO.contraction}</td> --%>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${boardVO.regDate}" /></td>
					<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
				</tr>
			</c:forEach>
		</table>
		<!-- end of board list All -->
		<!-- paging start 제발 좀 성공해라 좀좆ㅁ좆ㅁ좀ㅈ몸ㅈ -->
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<%-- 				<li class="page-item">
				<a class="page-link" href="listPage${pageMaker.makeQuery(pageMaker.startPage -1) }"> &laquo; </a>
				</li> --%>
					<%-- 					<li class="page-item"><a class="page-link"
						href="${pageMaker.startPage -1}">이전</a></li> --%>
					<li class="page-item"><a class="page-link"
						href="list${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li class="page-item"
						<c:out value="${pageMaker.cri.page == idx ?'active':''}" />>
						<%-- <a class="page-link" href="listPage${pageMaker.makeQuery(idx)}">${idx}</a> --%>
						<%-- <a class="page-link" href="${idx}">${idx}</a> --%> <a
						class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<%-- <li class="page-item"><a class="page-link" href="listPage${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a></li> --%>
					<%-- 	<li class="page-item"><a class="page-link"
						href="${pageMaker.endPage + 1}">다음</a></li> --%>
					<li class="page-item"><a class="page-link"
						href="list${pageMaker.makeSearch(pageMaker.endPage+1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
		<!-- linking with JavaScript -->
		<form id="jobForm">
			<input type="hidden" name="page" value="${pageMaker.cri.perPageNum}">
			<input type="hidden" name="perPageNum"
				value="${pageMaker.cri.perPageNum}">
		</form>
		<!-- end of linking with JavaScript-->

		<!-- end of paging -->
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
		<script>
			$(document).ready(
					function() {
						$('#searchBtn').on(
								"click",
								function(event) {
									self.location = "/sboard/list"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ $('#keywordInput').val();
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
		</script>
		<script>
			var msg = '${result}';
			if (msg == "success") {
				alert("처리가 완료되었습니다.");
			}
		</script>
</body>

</html>