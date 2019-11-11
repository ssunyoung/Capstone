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

body {
	background-color: #f4f2e9;
	background-image:
		url("https://www.transparenttextures.com/patterns/wood-pattern.png");
}

/** ====================
 * Lista de Comentarios
 =======================*/
.comments-container {
	margin: 60px auto 15px;
	width: 768px;
}

.comments-container h1 {
	font-size: 36px;
	color: #283035;
	font-weight: 400;
}

.comments-container h1 a {
	font-size: 18px;
	font-weight: 700;
}

.comments-list {
	margin-top: 30px;
	position: relative;
}

/**
 * Lineas / Detalles
 -----------------------*/
.comments-list:before {
	content: '';
	width: 2px;
	height: 100%;
	background: #c7cacb;
	position: absolute;
	left: 32px;
	top: 0;
}

.comments-list:after {
	content: '';
	position: absolute;
	background: #c7cacb;
	bottom: 0;
	left: 27px;
	width: 7px;
	height: 7px;
	border: 3px solid #dee1e3;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
}

.reply-list:before, .reply-list:after {
	display: none;
}

.reply-list li:before {
	content: '';
	width: 60px;
	height: 2px;
	background: #c7cacb;
	position: absolute;
	top: 25px;
	left: -55px;
}

.comments-list li {
	margin-bottom: 15px;
	display: block;
	position: relative;
}

.comments-list li:after {
	content: '';
	display: block;
	clear: both;
	height: 0;
	width: 0;
}

.reply-list {
	padding-left: 88px;
	clear: both;
	margin-top: 15px;
}
/**
 * Avatar
 ---------------------------*/
.comments-list .comment-avatar {
	width: 65px;
	height: 65px;
	position: relative;
	z-index: 99;
	float: left;
	border: 3px solid #FFF;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	overflow: hidden;
}

.comments-list .comment-avatar img {
	width: 100%;
	height: 100%;
}

.reply-list .comment-avatar {
	width: 50px;
	height: 50px;
}

.comment-main-level:after {
	content: '';
	width: 0;
	height: 0;
	display: block;
	clear: both;
}
/**
 * Caja del Comentario
 ---------------------------*/
.comments-list .comment-box {
	width: 680px;
	float: right;
	position: relative;
	-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.15);
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.15);
}

.comments-list .comment-box:before, .comments-list .comment-box:after {
	content: '';
	height: 0;
	width: 0;
	position: absolute;
	display: block;
	border-width: 10px 12px 10px 0;
	border-style: solid;
	border-color: transparent #FCFCFC;
	top: 8px;
	left: -11px;
}

.comments-list .comment-box:before {
	border-width: 11px 13px 11px 0;
	border-color: transparent rgba(0, 0, 0, 0.05);
	left: -12px;
}

.reply-list .comment-box {
	width: 610px;
}

.comment-box .comment-head {
	background: #FCFCFC;
	padding: 10px 12px;
	border-bottom: 1px solid #E5E5E5;
	overflow: hidden;
	-webkit-border-radius: 4px 4px 0 0;
	-moz-border-radius: 4px 4px 0 0;
	border-radius: 4px 4px 0 0;
}

.comment-box .comment-head i {
	float: right;
	margin-left: 14px;
	position: relative;
	top: 2px;
	color: #A6A6A6;
	cursor: pointer;
	-webkit-transition: color 0.3s ease;
	-o-transition: color 0.3s ease;
	transition: color 0.3s ease;
}

.comment-box .comment-head i:hover {
	color: #03658c;
}

.comment-box .comment-name {
	color: #283035;
	font-size: 14px;
	font-weight: 700;
	float: left;
	margin-right: 10px;
}

.comment-box .comment-name a {
	color: #283035;
}

.comment-box .comment-head span {
	float: left;
	color: #999;
	font-size: 13px;
	position: relative;
	top: 1px;
}

.comment-box .comment-content {
	background: #FFF;
	padding: 12px;
	font-size: 15px;
	color: #595959;
	-webkit-border-radius: 0 0 4px 4px;
	-moz-border-radius: 0 0 4px 4px;
	border-radius: 0 0 4px 4px;
}

.comment-box .comment-name.by-author, .comment-box .comment-name.by-author a
	{
	color: #03658c;
}

.comment-box .comment-name.by-author:after {
	content: 'writer';
	background: #03658c;
	color: #FFF;
	font-size: 12px;
	padding: 3px 5px;
	font-weight: 700;
	margin-left: 10px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

/** =====================
 * Responsive
 ========================*/
@media only screen and (max-width: 766px) {
	.comments-container {
		width: 480px;
	}
	.comments-list .comment-box {
		width: 390px;
	}
	.reply-list .comment-box {
		width: 320px;
	}
}

/** ====================
 * Lista de Comentarios
 =======================*/
</style>
<!-- end of style -->
<body>
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

		<p class="text-right">
			<b>${boardVO.bno}</b>번 게시물
		</p>
		<form role="form" action="modifyPage" method="post">

			<input type='hidden' name='bno' value="${boardVO.bno}"> <input
				type='hidden' name='page' value="${cri.page}"> <input
				type='hidden' name='perPageNum' value="${cri.perPageNum}"> <input
				type='hidden' name='searchType' value="${cri.searchType}"> <input
				type='hidden' name='keyword' value="${cri.keyword}">

		</form>
		<div class="card shadow-sm p-3 mb rounded">
			<div class="card-header">중고책 조회 폼</div>
			<div class="form-group">
				<label for="bno"></label> <input type='hidden' name='bno'
					value="${boardVO.bno}" readonly="readonly" />
			</div>
			<div class="card-body">
				<div class="row">
					<div class="form-group col">
						<label for="Title">Title</label> <input type="text" name="title"
							class="form-control" id="title" value="${boardVO.title}"
							placeholder="Enter BOOK Title" readonly="readonly" required />
					</div>
					<div class="form-group col">
						<label for="Writer">Writer</label> <input type="text"
							name="writer" id="writer" class="form-control"
							placeholder="Enter Writer" value="${boardVO.writer}"
							readonly="readonly" required />
					</div>
				</div>
				<div class="row">
					<div class="form-group col">
						<label for="publisher">publisher</label> <input type="text"
							name="publisher" id="publisher" class="form-control"
							value="${boardVO.publisher}" readonly="readonly"
							placeholder="Enter publisher" required />
					</div>
					<div class="form-group col">
						<label for="pubdate">pubdate</label> <input type="text"
							name="pubdate" id="pubdate" class="form-control"
							value="${boardVO.pubdate}" readonly="readonly"
							placeholder="Enter publishing date" required />
					</div>
				</div>
				<div class="row">
					<div class="form-group col">
						<label for="org_price">org_price</label> <input type="text"
							id="price" name="org_price" class="form-control"
							value="${boardVO.org_price}" readonly="readonly"
							placeholder="Enter Original price" required />
					</div>
					<div class="form-group col">
						<label for="isbn">isbn</label> <input type="text" name="isbn"
							class="form-control" id="isbn" value="${boardVO.isbn}"
							placeholder="Enter isbn number" readonly="readonly" required />
					</div>
				</div>
			</div>
			<!--  card body 1 done -->
			<div class="accordion" id="accordion">
				<div class="card">
					<div class="card-header" id="headingOne">
						<button class="btn" type="button" data-toggle="collapse"
							data-target="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne">중고책 조회 폼 - CLICK!</button>
					</div>
				</div>
				<div id="collapseOne" class="collapse show"
					aria-labelledby="headingOne" data-parent="#accordion">
					<div class="card-body">
						<div class="row">
							<div class="form-group col">
								<label for="sale_price">sale_price</label> <input type="text"
									name="sale_price" class="form-control"
									value="${boardVO.sale_price}" placeholder="Enter Sale price"
									readonly="readonly" required />
							</div>
							<div class="form-group col">
								<label for="Grade">Grade</label> <input type="text" name="grade"
									class="form-control" value="${boardVO.grade}"
									readonly="readonly" placeholder="Enter book Status ex)상 중 하"
									required />
							</div>
						</div>
						<div class="row">
							<div class="form-group col">
								<label for="Content">Content</label>
								<textarea class="form-control rounded-0" type="text" name="content"
									value="${boardVO.content}" rows="10" readonly="readonly"
									placeholder="Enter description...." required>${boardVO.content}</textarea>
							</div>
						</div>
						<div class="row">
							<div class="form-group col">
								<label for="phone">phone</label> <input type="text" name="phone"
									class="form-control" value="${boardVO.phone}"
									readonly="readonly" placeholder="Enter your phone number"
									required />
							</div>
							<div class="form-group col">
								<label for="contraction">contraction</label> <input type="text"
									name="contraction" class="form-control"
									value="${boardVO.contraction}" readonly="readonly"
									placeholder="Enter contraction ways" required />
							</div>
						</div>
					</div>
				</div>
				<!-- collpase done -->
			</div>
			<div class="card-footer text-center">
				<button type="submit" class="btn btn-warning boardModBtn">Modify</button>
				<button type="submit" class="btn btn-danger boardDelBtn">REMOVE</button>
				<button type="submit" class="btn btn-primary boardLiBtn">List
					ALL</button>
			</div>
			<!-- card footer done -->
		</div>
		<!-- card done -->
		<!--End of Board REad Form -->


		<!-- Reply start -->
		<br>
		<div class="comments-container">
			<!-- for 댓글 등록 -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<p class="card-title">댓글 작성 폼</p>
						</div>
						<div class="card-body">
							<label for="newReplyWriter">댓글 작성자</label> <input
								class="form-control" type="text" placeholder="USER ID"
								id="newReplyWriter" /> <label for="newReplyText">댓글
								내용</label>
							<textarea class="form-control" placeholder="댓글 내용을 입력해주세요."
								id="newReplyText" cols="5"></textarea>
						</div>
						<div class="card-footer">
							<button type="submit" class="btn btn-info btn-xs"
								id="replyAddBtn">ADD REPLY</button>
						</div>
					</div>
				</div>
			</div>
			<!-- for 댓글 리스트 및 페이징-->

			<ul class="timeline comments-list">
				<li class="" id="repliesDiv"><button class="btn btn-secondary"><span>댓글 목록 Click!</span></button></li>
			</ul>

			<div class='text-center'>
				<ul id="pagination"
					class="pagination pagination-sm text-center">
				</ul>
			</div>

			<!-- Reply MODAL -->
			<div id="modifyModal" class="modal modal-primary fade" role="dialog">
				<div class="modal-dialog">
					<!--Modal content -->
					<div class="modal-content">
						<div class="modal-header">
						<p>댓글 수정창</p>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h6 class="modal-title">번째</h6>
						</div>
						<div class="modal-body" data-rno>
							<p>
								<input type="text" id="replytext" class="form-control">
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-info" id="replyModBtn">댓글수정</button>
							<button type="button" class="btn btn-danger" id="replyDelBtn">댓글삭제</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end of Reply MODAL -->

			<!-- Footer -->
			<%@include file="/WEB-INF/views/include/footer.jsp"%>
			<!-- Footer end-->
		</div>
		<!-- container end div-->
	</div>
	<!-- script -->
	<!-- using handlebars -->
	<!-- reply ajax -->

	<script id="template" type="text/x-handlebars-template">
    {{#each .}}
    <li class="replyLi" data-rno={{rno}}>
        <div class="timeline-item content-main-level">
         <!-- Avatar 
            <div class="comment-avatar"><img src="" alt=""></div>
           end of Avatar -->
			<div class="comment-box">
 				<div class="comment-head">
            	<h6 class="timeline-header comment-name by-author">
					<strong>{{rno}}</strong>번째 댓글 --{{replyer}}가 씀
					<span class="time">
	          		   <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
       		    	</span>
				</h6>
			 <!--button-->
			 <a class="btn" data-toggle="modal" data-target="#modifyModal">
			 <i class="fa fa-pencil-square" style="font-size:28px; color:red;"></i>
			 </a>
            	</div>
				<div class="timeline-body comment-content">{{replytext}}</div>
			</div>
        </div>
    </li>
    {{/each}}
	</script>

	<script>
		$(document).ready(function() {

							Handlebars.registerHelper("prettifyDate", function(
									timeValue) {
								var dateObj = new Date(timeValue);
								var year = dateObj.getFullYear();
								var month = dateObj.getMonth() + 1;
								var date = dateObj.getDate();
								console.log(date);
								return year + "/" + month + "/" + date;
							});

							//현재 게시글 번호
							//var bno = ${boardVO.bno};
							var bno = "${boardVO.bno}";
							console.log(bno);
							//댓글 페이지 번호 초기화
							var replyPage = 1;

							//댓글 출력함수 호출
							//printData("/replies/" + bno + "/1");

							//댓글 페이지 번호 클릭 이ㅔㄴ트
							$(".pagination").on("click", "li a",function(event) {
										event.preventDefault();
										replyPage = $(this).attr("href");
										getPage("/replies/" + bno + "/" + replyPage);
										//getPage(replyPage);
									});

							// 게시판 button
							var formObj = $("form[role='form']");

							//console.log(formObj);

							$(".boardModBtn").on("click", function() {
								formObj.attr("action", "/sboard/modifyPage");
								formObj.attr("method", "get");
								formObj.submit();
							});

							$(".boardDelBtn").on("click", function() {
								formObj.attr("action", "/sboard/removePage");
								formObj.submit();
							});

							$(".boardLiBtn").on("click", function() {
								/* 				self.location = "/board/listAll";
								 */
								formObj.attr("method", "get");
								formObj.attr("action", "/sboard/list");
								formObj.submit();
							});

							// 게시판 button end

							//댓글 목록 출력함수
							var printData = function(replyArr, target,templateObject) {
								var template = Handlebars.compile(templateObject.html());
								console.log(replyArr + "replyArr")

								var html = template(replyArr);
								console.log(replyArr + "replyArr")
								console.log(html + "html")
								$(".replyLi").remove();
								target.after(html);
							}

							//getPage함수하면서 데이터 print!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
							function getPage(pageInfo) {

								$.getJSON(pageInfo, function(data) {
									printData(data.list, $("#repliesDiv"),$('#template'));
									printPaging(data.pageMaker,$(".pagination"));
								});
							}

							//printPaging함수
							var printPaging = function(pageMaker, target) {

								var str = "";

								if (pageMaker.prev) {
									str += "<li><a href='"+ (pageMaker.startPage - 1)+ "'> << </a></li>";
								}

								for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
									var strClass = pageMaker.cri.page == i ? 'class=active': '';
									str += "<li " + strClass + "><a href='" + i + "'>"+ i + "</a></li>";
								}

								if (pageMaker.next) {
									str += "<li><a href='"+ (pageMaker.endPage + 1)+ "'> >> </a></li>";
								}
								target.html(str);
							};

							//Div 클릭하면 댓글 열리게 함.
							$("#repliesDiv").on("click", function() {
								if ($(".timeline li").length > 1) {
									return;
								}
								getPage("/replies/" + bno + "/1");
							});

							//각 댓글 모델창 이벤트 처리
							$(".timeline").on("click",".replyLi",function() {
										var reply = $(this);

										$("#replytext").val(reply.find('.timeline-body').text());
										$(".modal-title").html(reply.attr("data-rno"));

									});

							//댓글 등록 이벤트 처리
							$("#replyAddBtn").on("click",function() {
													console.log(bno+"댓글 등록");
												var replyObj = $("#newReplyWriter");
												var replytextObj = $("#newReplyText");
												var replyer = replyObj.val();
												var replytext = replytextObj.val();
												$.ajax({
															type : 'post',
															url : '/replies/',
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "POST"
															},
															dataType : 'text',
															data : JSON.stringify({
																		bno : bno,
																		replyer : replyer,
																		replytext : replytext
																	}),
															success : function(
																	result) {
																console.log("댓글등록 result : "+ result);
																if (result == 'SUCCESS') {
																	alert("등록되었습니다.");
																	replyPage = 1;
																	getPage("/replies/"+ bno+ "/"+ replyPage);
																	replyObj.val("");
																	replytextObj.val("");
																}
															}
														});
													});

							//댓글 수정 이벤트 처리
							$("#replyModBtn").on("click",function() {
								console.log(bno+"댓글 수정");
												var rno = $(".modal-title").html();
												var replytext = $("#replytext").val();

												$.ajax({
															type : 'put',
															url : '/replies/'+ rno,
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "PUT"
															},
															data : JSON.stringify({replytext : replytext}),
															dataType : 'text',
															success : function(result) {
																console.log("댓글수정 result : "+ result);
																if (result == 'SUCCESS') {
																	alert("수정되었습니다.");
																	getPage("/replies/"+ bno+ "/"+ replyPage);
																	$("#modifyModal").modal("hide");
																}
															}
														});
											});

							//댓글 삭제 이벤트 처리
							$("#replyDelBtn").on("click",function() {
												//	console.log(bno);
												var rno = $(".modal-title").html();
												var replytext = $("#replytext").val();

												$.ajax({
															type : 'delete',
															url : '/replies/'
																	+ rno,
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "POST"
															},
															dataType : 'text',
															success : function(result) {
																console.log("댓글삭제 result : "+ result);
																if (result == 'SUCCESS') {
																	alert("삭제되었습니다.");
																	getPage("/replies/"+ bno+ "/"+ replyPage);
																	 $("#modifyModal").modal("hide");
																}
															}
														});
											});
						});
	</script>
</body>

</html>