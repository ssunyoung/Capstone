<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>test ajax</title>
<style>
#modDiv {
	width: 300px;
	height: 100px;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}
</style>
</head>
<body>
	<div>
		<div>
			Replyer <input type="text" name="replyer" id="newReplyWriter">
		</div>
		<div>
			Reply TEXT <input type="text" name="replytext" id="newReplyText">
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	<ul id="replies">
		<!-- 댓글 리스트 출력 -->
	</ul>
	<ul class="pagination">
		<!-- 댓글 페이징 처리 -->
	</ul>

	<div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext'>
		</div>
		<div>
			<button type="button" id="replyModBtn">댓글수정</button>
			<button type="button" id="replyDelBtn">댓글삭제</button>
			<button type="button" id="closeBtn">Close</button>

		</div>
	</div>


</body>


<script>
	//임의로 번호값주고~
	var bno = 13383;

	getPageList(1);
	$.getJSON("/replies/all/" + bno, function(data) {
		var str = "";
		console.log(data);

		/* 	$(data).each(
					function() {
						str += "<li data-rno'"+this.rno+"'class='replyLi'>"
								+ this.rno + ":" + this.replytext + "</li>";
					}); */
		$(data).each(
				function() {
					str += "<li data-rno='"+this.rno+"'class='replyList'>"
							+ this.rno + ":" + this.replytext
							+ "<button>댓글수정</button></li>";
				});
		$("#replies").html(str);

	});
	//댓글 수정 및 삭제 창 보이게 하는 것
	$("#replies").on("click", ".replyList button", function() {
		var reply = $(this).parent();

		var rno = reply.attr("data-rno");
		var replytext = reply.text();

		$(".modal-title").html(rno);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");

	});

	//댓글 추가 버튼
	$('#replyAddBtn').on("click", function() {
		var replyer = $('#newReplyWriter').val();
		var replytext = $('#newReplyText').val();

		$.ajax({
			type : 'post',
			url : '/replies',
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
			success : function(result) {
				if (result == 'SUCCESS') {
					alert("댓글 등록완료.");
				}
				getAllReplyList();
				replytext.val("");
				replyer.val("");
			}
		});
	});

	//댓글 삭제 처리
	$('#replyDelBtn').on("click", function() {

		var rno = $('.modal-title').html();
		var replytext = $('#replytext').val();

		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result:" + result);
				if (result == 'SUCCESS') {
					alert("댓글 삭제완료.");
					$("#modDiv").hide("slow");
					getAllReplyList();
				}

			}
		});
	});

	//댓글 수정 처리
	$('#replyModBtn').on("click", function() {

		var rno = $('.modal-title').html();
		var replytext = $('#replytext').val();

		$.ajax({
			type : 'put',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				replytext : replytext
			}),
			dataType : 'text',
			success : function(result) {
				console.log("result:" + result);
				if (result == 'SUCCESS') {
					alert("댓글 수정완료.");
					$("#modDiv").hide("slow");
					//getAllReplyList();
					getPageList(replyPage);
				}

			}
		});
	});

	// 댓글 페이징 처리 함수
	function getPageList(page) {

		$.getJSON("/replies/" + bno + "/" + page, function(data) {

			console.log(data.list.length);

			var str = "";

			$(data.list).each(
					function() {
						str += "<li data-rno='"+this.rno+"' class='replyLi'>"
								+ this.rno + ":" + this.replytext
								+ "<button>댓글수정</button></li>";
					});

			$("#replies").html(str);

			printPaging(data.pageMaker);
		});
	}

	function printPaging(pageMaker) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>"
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href = '" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}
		$('.pagination').html(str);
	}

	var replyPage = 1;
	
	//댓글 페이징 버튼 처리
	$(".pagination").on("click", "li a", function(event) {

		event.preventDefault();

		replyPage = $(this).attr("href");

		getPageList(replyPage);
	})
	//댓글 리스트 전체 가져오기
	function getAllReplyList() {
		$.getJSON("/replies/all/" + bno, function(data) {
			var str = "";
			console.log(data);

			$("#replies").html(str);
			$(data).each(
					function() {
						str += "<li data-rno'"+this.rno+"'class='replyLi'>"
								+ this.rno + ":" + this.replytext
								+ "<button>댓글수정</button></li>";
					});

		});

	}
</script>
</html>