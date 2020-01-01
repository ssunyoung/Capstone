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
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<title>북-북 WithNaver</title>

<style type="text/css">
body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td,
	form, fieldset, legend, input, textarea, button, select {
	margin: 0;
	padding: 0
}

body, input, textarea, select, button, table {
	font-family: '돋움', Dotum, AppleGothic, sans-serif;
	font-size: 12px
}

img, fieldset {
	border: 0
}

ul, ol {
	list-style: none
}

em, address {
	font-style: normal
}

a {
	text-decoration: none
}

a:hover, a:active, a:focus {
	text-decoration: underline
}

.search_book {
	margin: 10px;
}

.result {
	margin: 20px;
}

.green_window {
	display: inline-block;
	width: 366px;
	height: 34px;
	border: 3px solid #2db400;
	background: white;
}

.input_text {
	width: 348px;
	height: 21px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}

.sch_smit {
	width: 54px;
	height: 40px;
	margin: 0;
	border: 0;
	vertical-align: top;
	background: #22B600;
	color: white;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}

.sch_smit:hover {
	background: #56C82C;
}

.title {
	font-size: 2.0rem;
	font-weight: 400;
	line-height: 1.2;
}
</style>
</head>
<body style="background-color: #f2f4f7;">
	<br>
	<br>
	<div class="container">
		<p class="title">NAVER에서 책을 검색하고,</p>
		<p class="title" style="color: #22B600;">'값 전달 '</p>
		<p class="title">버튼을 클릭하여 정보를 가져오세요.</p>
		<br>
		<!-- Search box -->
		<div class="row shadow p-4 mb-4 bg-white col-sm-12 text-center">
			<center>
				<form action="/sboard/naverSearch" method="GET">
					<span class='green_window'> <input class="input_text"
						type="text" placeholder="책 이름  검색하시오." name='naverQuery' id=""
						required />
					</span>
					<button id="searchBtn" class="sch_smit">검색</button>
				</form>
			</center>
		</div>
		<!-- end of SearchBox -->
		<br>
		<!-- Naver Searching Part -->
		<div class="bg-white col-sm-12 text-center">

			<table cellspacing="0" border="1" summary="책검색 API 결과"
				class="tbl_type tbl text-center">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">책표지</th>
						<th scope="col">책이름</th>
						<th scope="col">저자</th>
						<th scope="col">가격(원가)</th>
						<th scope="col">출판사</th>
						<th scope="col">출판년도</th>
						<th scope="col">ISBN</th>
					</tr>
				</thead>

				<c:forEach items="${naverRes}" var="b" varStatus="status">
					<%-- <tr class="__template"><td><c:out value="${status.index}" /></td></tr> --%>
					<tr class="__template">
						<td rowspan="2"><img src="${b.image}">						
						<input type='hidden' value="${b.image}" id="image${status.index}"/>
						</td>
						<td rowspan="4" width="800"><input value="${b.title}"
							id="title${status.index}"  readonly /></td>
						<td rowspan="2" width="200"><input value="${b.author}"
							id="writer${status.index}" readonly /></td>
					</tr>
					<tr class="__template">
						<td width="200"><input value="${b.price }" id="price${status.index}"
							readonly /></td>
						<td width="200"><input value="${b.publisher }" id="publisher${status.index}"
							readonly /></td>
						<td width="200"><input value="${b.pubdate }" id="pubdate${status.index}"
							readonly /></td>

						<td width="200"><input value="${b.isbn }" id="isbn${status.index}" readonly /></td>
					</tr>

					<tr class="__template">
						<td colspan="7"><br>${b.description}<input type="button"
							class="sch_smit" value="값 전달"
							onclick="setParentText(${status.index}); window.close(); alert('자동완성 처리완료'); alert('나머지 정보를 입력해주세요.');" />

						</td>
					</tr>
					<tr>
						<td colspan="7" width="100%"></td>
					</tr>

				</c:forEach>
			</table>
		</div>
		<!-- End of Naver Searching Part -->

		<!--  conatiner end -->
	</div>


	<!-- script -->
	<script type="text/javascript">
		function setParentText(idx) {
			console.log(idx+"인덱스번호ㅗㅗㅗㅗㅗ");
			opener.document.getElementById("image").value = document
			.getElementById("image"+idx).value;
			opener.document.getElementById("title").value = document
					.getElementById("title"+idx).value;
			opener.document.getElementById("writer").value = document
					.getElementById("writer"+idx).value;
			opener.document.getElementById("publisher").value = document
					.getElementById("publisher"+idx).value;
			opener.document.getElementById("pubdate").value = document
					.getElementById("pubdate"+idx).value;
			opener.document.getElementById("price").value = document
					.getElementById("price"+idx).value;
			//isbn 13자리만 뽑아낼거야아
			var isbnParse = document.getElementById("isbn"+idx).value.split(' ');
			console.log(isbnParse+"제발요!!!!!!!!!!!!!!");
			//console.log("happyyyyyyyyyyyyyyyyy"+document.getElementById("title").value);
			opener.document.getElementById("isbn").value = isbnParse[1];

		}
	</script>
</html>