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
</style>
<!-- end of style -->
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


	<!-- board Register Form with Paging-->
	<div class="container main-custom">
		<form role="form" action="modifyPage" method="post">

			<input type='hidden' name='bno' value="${boardVO.bno}"> <input
				type='hidden' name='page' value="${cri.page}"> <input
				type='hidden' name='perPageNum' value="${cri.perPageNum}"> <input
				type='hidden' name='searchType' value="${cri.searchType}"> <input
				type='hidden' name='keyword' value="${cri.keyword}">

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
			<button type="submit" class="btn btn-warning boardModBtn">Modify</button>
			<button type="submit" class="btn btn-danger boardDelBtn">REMOVE</button>
			<button type="submit" class="btn btn-primary boardLiBtn">List ALL</button>
		</div>
		<!-- end of board Register Form -->

		<!-- Reply start -->
		<br>

		<!-- for 댓글 등록 -->
		<div class="row">
			<div class="col-md=12">
				<div class="box box-success">
					<div class="box-header">
						<h3 class="box-title">댓글 작성 폼</h3>
					</div>
					<div class="box-body">
						<label for="newReplyWriter">Writer</label> <input
							class="form-control" type="text" placeholder="USER ID"
							id="newReplyWriter"> <label for="newReplyText">ReplyText</label>
						<input class="form-control" type="text" placeholder="REPLY TEXT"
							id="newReplyText">
					</div>
					<div class="box-footer">
						<button type="submit" class="btn btn-primary" id="replyAddBtn">ADD
							REPLY</button>
					</div>
				</div>
			</div>
		</div>
		<!-- for 댓글 리스트 및 페이징-->

		<ul class="timeline">
			<li class="time-label" id="repliesDiv"><span class="bg-green">Replies
					List</span></li>
		</ul>

		<div class='text-center'>
			<ul id="pagination" class="pagination pagination-sm no-margin">

			</ul>
		</div>

		<!-- Reply MODAL -->
		<div id="modifyModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-dialog">
				<!--Modal content -->
				<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">댓글수정</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">댓글삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
		</div>
		<!-- end of Reply MODAL -->
		<!-- end of Reply start -->

		<!-- Footer -->

		<!-- Footer end-->
	</div>
	<!-- container end div-->

	<!-- script -->
	<!-- using handlebars -->
	<!-- reply ajax -->

	<script id="template" type="text/x-handlebars-template">
    {{#each .}}
    <li class="replyLi" data-rno={{rno}}>
        <i class="fa fa-comments bg-blue"></i>
        <div class="timeline-item">
            <span class="time">
                <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
            </span>
            <h3 class="timeline-header"><strong>{{rno}}</strong> --{{replyer}}</h3>
            <div class="timeline-body">{{replytext}}</div>
            <div class="timeline-footer">
                <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">댓글수정</a>
            </div>
        </div>
    </li>
    {{/each}}
	</script>

	<script>
    $(document).ready(function () {
  
        Handlebars.registerHelper("prettifyDate", function (timeValue) {
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
        $(".pagination").on("click", "li a",
            function (event) {
                event.preventDefault();
                replyPage = $(this).attr("href");
                getPage("/replies/" + bno + "/1");
            });

        // 게시판 button
        var formObj = $("form[role='form']");

        //console.log(formObj);

        $(".boardModBtn").on("click", function () {
            formObj.attr("action", "/sboard/modifyPage");
            formObj.attr("method", "get");
            formObj.submit();
        });

        $(".boardDelBtn").on("click", function () {
            formObj.attr("action", "/sboard/removePage");
            formObj.submit();
        });

        $(".boardLiBtn").on("click", function () {
            /* 				self.location = "/board/listAll";
             */
            formObj.attr("method", "get");
            formObj.attr("action", "/sboard/list");
            formObj.submit();
        });

        // 게시판 button end

        //댓글 목록 출력함수
        var printData = function (replyArr, target, templateObject) {
            var template = Handlebars
                .compile(templateObject.html());
            console.log(replyArr + "replyArr")

            var html = template(replyArr);
            console.log(replyArr + "replyArr")
            console.log(html + "html")
            $(".replyLi").remove();
            target.after(html);
        }

        //getPage함수하면서 데이터 print!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function getPage(pageInfo) {

            $.getJSON(pageInfo, function (data) {
                printData(data.list, $("#repliesDiv"),
                    $('#template'));
                printPaging(data.pageMaker,
                    $(".pagination"));
            });
        }

        //printPaging함수
        var printPaging = function (pageMaker, target) {

            var str = "";

            if (pageMaker.prev) {
                str += "<li><a href='"
                    + (pageMaker.startPage - 1)
                    + "'> << </a></li>";
            }

            for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
                var strClass = pageMaker.cri.page == i ? 'class=active'
                    : '';
                str += "<li " + strClass + "><a href='" + i + "'>"
                    + i + "</a></li>";
            }

            if (pageMaker.next) {
                str += "<li><a href='"
                    + (pageMaker.endPage + 1)
                    + "'> >> </a></li>";
            }
            target.html(str)
        };

        //Div 클릭하면 댓글 열리게 함.
        $("#repliesDiv").on("click", function () {
            if ($(".timeline li").length > 1) {
                return;
            }
            getPage("/replies/" + bno + "/1");
        });

        //각 댓글 모델창 이벤트 처리
        $(".timeline").on("click", ".replyLi", function () {
            var reply = $(this);

            $("#replytext").val(reply.find('.timeline-body').text());
            $(".modal-title").html(reply.attr("data-rno"));

        });


        //댓글 등록 이벤트 처리
        $("#replyAddBtn").on("click", function () {
            //	console.log(bno);
            var replyObj = $("#newReplyWriter");
            var replytextObj = $("#newReplyText");
            var replyer = replyObj.val();
            var replytext = replytextObj.val();

            $.ajax({
                type: 'post',
                url: '/replies/',
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "POST"
                },
                dataType: 'text',
                data: JSON.stringify({
                    bno: bno,
                    replyer: replyer,
                    replytext: replytext
                }),
                success: function (result) {
                    console.log("댓글등록 result : " + result);
                    if (result == 'SUCCESS') {
                        alert("등록되었습니다.");
                        replyPage = 1;
                        getPage("/replies/" + bno + "/" + replyPage);
                        replyer.Obj.val("");
                        replytextObj.val("");
                    }
                }
            });
        });

        //댓글 수정 이벤트 처리
        $("#replyModBtn").on("click", function () {
            //	console.log(bno);
            var rno = $(".modal-title").html();
            var replytext = $("#replytext").val();

            $.ajax({
                type: 'put',
                url: '/replies/' + rno,
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "PUT"
                },
                data: JSON.stringify({replytext: replytext}),
                dataType: 'text',
                success: function (result) {
                    console.log("댓글수정 result : " + result);
                    if (result == 'SUCCESS') {
                        alert("수정되었습니다.");
                        getPage("/replies/" + bno + "/" + replyPage);
                    }
                }
            });
        });

        //댓글 삭제 이벤트 처리
        $("#replyDelBtn").on("click", function () {
            //	console.log(bno);
            var rno = $(".modal-title").html();
            var replytext = $("#replytext").val();

            $.ajax({
                type: 'delete',
                url: '/replies/' + rno,
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "POST"
                },
                dataType: 'text',
                success: function (result) {
                    console.log("댓글삭제 result : " + result);
                    if (result == 'SUCCESS') {
                        alert("삭제되었습니다.");
                        getPage("/replies/" + bno + "/" + replyPage);
                    }
                }
            });
        });
    });
</script>
</body>

</html>