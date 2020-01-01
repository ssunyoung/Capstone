<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.happy2 {
	background: #f4f2e9;
}

body {
	background-color: #f4f2e9;
	background-image:
		url("https://www.transparenttextures.com/patterns/wood-pattern.png");
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
	<!-- Search box -->
	<div class="container">
		<br>
		<div class="col-lg-12">
			<div class="row shadow p-4 mb-4 bg-white">
				<div class="col-lg-3 col-md-3 col-sm-12 p-0 ">
					<select class="form-control search-slt" name="searchType">
						<option value="n"
							<c:out value ="${cri.searchType == null?'selected':''}" />>통합검색</option>
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

				<div class="col-lg-6 col-md-6 col-sm-12 p-0 ">
					<input class="form-control search-slt" type="text"
						placeholder="검색어를 입력해주세요." name='keyword' id="keywordInput"
						value='${cri.keyword}' required />
				</div>
				<!--end of col-->
				<div class="col-lg-3 col-md-3 col-sm-12 p-0 ">
					<button id="searchBtn" class="btn btn-lg btn-danger wrn-btn">Search</button>
				</div>

			</div>
			<!-- end of SearchBox -->
			
			
			<div class="col-lg-12 p-0"
				style="margin-top: 20px; margin-bottom: 20px; text-align: right;">
				<button id="newBtn" class="btn btn-lg btn-danger wrn-btn">중고책
					등록</button>
			</div>


			<!-- board list All start -->
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th style="width: 10px">BNO</th>
						<th>image</th>
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
						<!-- 						<th>viewcnt</th>
 -->
					</tr>
				</thead>
				<c:forEach items="${list}" var="boardVO">
					<tr>
						<td>${boardVO.bno}</td>
						<td><img src="${boardVO.img}"></td>
						
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
						<%-- <td><span class="badge bg-red">${boardVO.viewcnt}</span></td> --%>
					</tr>
				</c:forEach>
			</table>
			<!-- end of board list All -->
			<!-- paging start 제발 좀 성공해라 좀좆ㅁ좆ㅁ좀ㅈ몸ㅈ -->
			<div class="row d-flex justify-content-center">
				<ul class="pagination text-center">
					<c:if test="${pageMaker.prev}">
						<li class="page-item"><a class="page-link"
							href="list${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li class="page-item"
							<c:out value="${pageMaker.cri.page == idx ?'active':''}" />><a
							class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
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
			<%@include file="/WEB-INF/views/include/footer.jsp"%>
			<!-- Footer end-->

		</div>
	</div>


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
	</script>
	<script>
		var msg = '${result}';
		if (msg == "success") {
			alert("처리가 완료되었습니다.");
		}
	</script>
</body>

</html>