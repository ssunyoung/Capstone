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
<title>북북 비교검색</title>

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

<!--
book img start-->.thumbnail_image {
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

body {
	background-color: #f4f2e9;
	background-image:
		url("https://www.transparenttextures.com/patterns/wood-pattern.png");
}
</style>

<body>
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
		<br>
		<form action="/bookbook/book" method="GET">
			<div class="row shadow p-4 mb-4 bg-white">
				<!--end of col-->
				<input class="form-control search-slt" type="text"
					placeholder="책 이름  검색하시오." name='queryWord' id="keywordInput"
					required />
				<button id="searchBtn" class="btn btn-danger wrn-btn">Search</button>
			</div>
		</form>
		<!--end of col-->

		<!-- end of SearchBox -->
		<!-- test -->
		<div class="container"
			style="width: auto; height: auto; margin-top: 20px; margin-left: 20px; margin-right: 20px;">
			<div class="container">
				<center>
					<c:if test="${empty queryWord}">
						검색어를 입력해주세요.
					</c:if>
					<c:if test="${!empty queryWord}">
						<h3>
							<p class="font-red">
								"<em>${queryWord}</em> " 검색 결과입니다.
							</p>
						</h3>
						<hr>

						<br>
						<br>

						<!-- aladin 결과  -->
						<%
							String keyword = (String) request.getAttribute("queryWord");

								String url = (String) request.getAttribute("addResult");
								if (url.equals("error") || url == "error") {
									out.print(url
											+ "<br>aladin Api에서 알 수없는 오류가 발생했습니다. <br> <a href= 'https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=Used&SearchWord="
											+ URLEncoder.encode(keyword, "EUC-KR")
											+ "&CategorySearch=&chkKeyTitle=on' >알라딘 사이트에서 확인하세요.</a> <br> <br><br>");
								} else {
									ArrayList<String> test = (ArrayList<String>) request.getAttribute("aladinRest");

									//out.print("***************************");
									//out.print(url);
									Object obj = JSONValue.parse(url);
									JSONObject object = (JSONObject) obj;
									JSONArray items = (JSONArray) object.get("item");

									String result = items.toString();

									out.print("<h2 class='color-red'>\"" + keyword + "\" 에 대한 알라딘 검색 결과 입니다.</h2>");
									out.print("<span class='text-left'>중고 총 재고 개수: <b>" + object.get("totalResults") + "</b>권 </span>");
									out.print(
											"<a href='https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=Used&SearchWord="
													+ URLEncoder.encode(keyword, "EUC-KR")
													+ "&CategorySearch=&chkKeyTitle=on' /><p class='text-right text-black'>알라딘에서 더 많은 결과 보기</p></a>");
									out.print("<div class='row border border-light shadow m-5 p-5' style='padding-top:40px;'>");
									Object a = object.get("totalResults");
									// 실제 리스트 뽑기 

									for (int i = 0; i < items.size(); i++) {
										if (items.size() == 0) {
											out.print("<strong>검색결과가 존재하지 않습니다. <br> 다른 검색어를 입력해주세요.</strong>");
											break;
										}
										out.print("<div class='col-lg-3 thumbnail_image'>");
										JSONObject results = (JSONObject) items.get(i);

										out.print("<a href=\'" + results.get("link")
												+ "\' target='_blank'><img class='thumbnail' src=\"" + results.get("cover")
												+ "\"></img></a><span class='thumbnail-border'></span><br>");
										out.print("<p class='card-title'><b>" + results.get("title") + "</b></p><br>");
										out.print(
												"<button type='submit' class='btn btn-warning' id='testBtn' onclick=\"location.href='/bookbook/library?isbn="
														+ results.get("isbn13") + "'\">도서관 검색</button><br>");
										//out.print("<p> isbn코드 : " + results.get("isbn13") + "</p>");
										//out.print("link : <b>" + results.get("link") + "</b><br>");

										if (test.get(items.size() + i).equals("") || test.get(items.size() + i).equals("-")
												|| test.get(i).equals("") || test.get(i).equals("-")) {
											out.print("사이트에서 가격정보를 확인하세요.");
											continue;
										} else {
											//out.print("aaaaaaaaaaaaaaaaaaaaaaaaaaa"+a);
											//out.print("bbbbbbbbbbbbbbbbb"+test.get(items.size()).length()+"    bbbbb");

											out.print("<del>" + results.get("priceStandard") + "</del> <b>" + test.get(items.size() + i)
													+ "원</b><br>");
											out.print("총 재고 : <b>" + test.get(i) + "권</b><br>");

										}

										//out.print("salePrice : <b>" + test.get(items.size() + i) + "</b><br>");
										//out.print(results.get("stockStatus") instanceof String);
										int range = 0;
										Object objj = "";

										if (results.get("stockStatus").equals(null) && results.get("stockStatus").equals(objj)) {
											out.print("stockStatus : <b>이상무</b><br>");
										} else {
											out.print("stockStatus  : <b>" + results.get("stockStatus") + "123</b><br>");
										}
										out.print(results.get("publisher") + "<br>");
										out.print("</div>");
									} // for end
									out.print("</div>");
								} //else end
						%>
						<hr>
						<!-- YES24 결과 -->
						<%
							out.print("<h2 class='color-red'>\"" + keyword + "\" 에 대한 YES24 검색 결과 입니다.</h2>");
								String aa = (String) request.getAttribute("hash");
								Object obj2 = JSONValue.parse(aa);
								JSONObject object2 = (JSONObject) obj2;
								JSONArray res2 = (JSONArray) object2.get("res");
								String result2 = res2.toString();
								/*								out.print("<span class='text-left'>중고 총 재고 개수: <b>" + object.get("totalResults") + "</b>권 </span>");
								 */ out.print(
										"<a href='http://www.yes24.com/searchcorner/Search?keywordAd=&keyword=&domain=USED_GOODS&qdomain=UsedGoods&query="
												+ URLEncoder.encode(keyword, "EUC-KR")
												+ "/' /><p class='text-right text-black'>YES24에서 더 많은 결과 보기</p></a>");

								out.print("<div class='row border border-light shadow m-5 p-5'>");
								for (int i = 0; i < res2.size(); i++) {
									out.print("<div class='col-lg-3 thumbnail_image'>");

									JSONObject results2 = (JSONObject) res2.get(i);
									out.print("<a href=\'" + results2.get("link") + "\' target='_blank'><img class='thumbnail' src=\""
											+ results2.get("CoverImg") + "\"></img></a><span class='thumbnail-border'></span><br>");
									out.print("<b>" + results2.get("title") + "</b><br>");
									out.print("<del>" + results2.get("OrgPrice") + "</del> <b>" + results2.get("Sale") + "</b><br>");
									out.print("총 재고 : <b>" + results2.get("stockNum") + "권</b><br>");
									out.print("</div>");
								}
								out.print("</div>");
						%>
					</c:if>

				</center>
			</div>
		</div>

		<!-- end of test -->


		<!-- Footer -->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>
		<!-- Footer end-->
	</div>



	<!-- script -->
	<script type="text/javascript">
		
	</script>

</body>

</html>