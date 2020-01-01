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

.fileDrop {
	width: 100%;
	height: 250px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
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
	<!-- /nav -->

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container main-custom">

		<div class="col-lg-12 p-0"
			style="margin-top: 20px; margin-bottom: 20px; text-align: right;">
			<button class="btn btn-lg btn-danger wrn-btn" onclick="openChild()">온라인검색결과가져오기</button>
		</div>
		<br> <br>


		<!-- board Register Form -->
		<form role="form" id="registerForm" method="post">
			<div class="card shadow-sm p-3 mb rounded">
				<div class="card-header">중고책 등록 폼</div>
				<div class="card-body">
					<div class="row">
						<div class="form-group col">
							<label for="Title">Title</label> <input type="text" name="title"
								class="form-control" id="title" placeholder="Enter BOOK Title"
								required />
						</div>
						<div class="form-group col">
							<label for="Writer">Writer</label> <input type="text"
								name="writer" id="writer" class="form-control"
								placeholder="Enter Writer" required />
						</div>
					</div>
					<div class="row">
						<div class="form-group col">
							<label for="publisher">publisher</label> <input type="text"
								name="publisher" id="publisher" class="form-control"
								placeholder="Enter publisher" required />
						</div>
						<div class="form-group col">
							<label for="pubdate">pubdate</label> <input type="text"
								name="pubdate" id="pubdate" class="form-control"
								placeholder="Enter publishing date" required />
						</div>
					</div>
					<div class="row">
						<div class="form-group col">
							<label for="org_price">org_price</label> <input type="text"
								id="price" name="org_price" class="form-control"
								placeholder="Enter Original price" required />
						</div>
						<div class="form-group col">
							<label for="isbn">isbn</label> <input type="text" name="isbn"
								class="form-control" id="isbn" placeholder="Enter isbn number"
								required />
						</div>
					</div>
					<div class="row">
					<div class="form-group col">
							<label for="image">image</label> <input type="text" id="image" name="img" class="form-control" placeholder="imageFile" />
						</div>
					</div>
				</div>
				<!--  card body 1 done -->
				<div class="accordion" id="accordion">
					<div class="card">
						<div class="card-header" id="headingOne">
							<button class="btn" type="button" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">중고책 등록 폼 - CLICK!</button>
						</div>
					</div>
					<div id="collapseOne" class="collapse" aria-labelledby="headingOne"
						data-parent="#accordion">
						<div class="card-body">
							<div class="row">
								<div class="form-group col">
									<label for="sale_price">sale_price</label> <input type="text"
										name="sale_price" class="form-control"
										placeholder="Enter Sale price" required />
								</div>
								<div class="form-group col">
									<label for="Grade">Grade</label> <input type="text"
										name="grade" class="form-control"
										placeholder="Enter book Status ex)상 중 하" required />
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label for="content">Content</label>
									<textarea class="form-control rounded-0" name="content"
										rows="10" placeholder="Enter description...." required /></textarea>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label for="phone">phone</label> <input type="text"
										name="phone" class="form-control"
										placeholder="Enter your phone number" required />
								</div>
								<div class="form-group col">
									<label for="contraction">contraction</label> <input type="text"
										name="contraction" class="form-control"
										placeholder="Enter contraction ways" required />
								</div>
							</div>
						</div>
						<!-- 파일 드래그 부분 -->
						<div class="form-group">
							<h3>File DROP Here</h3>
							<div class="fileDrop"></div>
						</div>
						<!-- 파일 드래그 부분 -->
						
					</div>
					<!-- collpase done -->
				</div>
				<div class="card-footer text-center">
				<div>
					<hr>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList">
				</ul>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
				<!-- card footer done -->
			</div>
			<!-- card done -->
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
			openWin = window.open("/sboard/naverSearch", "childForm",
					"width=1000, height=800, resizable=no, location=no")
		}
	</script>
	
	
	<script id="template" type= "text/x-handlebars-template">
		<li>
   		 <span class="mailbox-attachment-icon has-img">
    		    <img src="{{imgsrc}}" alt="Attachment">
  		  </span>
   		 <div class="mailbox-attachment-info">
    		   <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
     		   <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
   		 </div>
		</li>
	</script>
	
	<script type = "text/javascript">
		var template = Handlebars.compile($("#template").html());
		
		// 전체 페이지 첨부파일 drag & drop 기본 이벤트 방지
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});
		
		// 첨부파일 drag & drop 이벤트 처리 : 파일 업로드 & 파일 출력.
		$(".fileDrop").on("drop",function(event) {
				event.preventDefault();

				// drop 시 전달된 파일 데이터.
				var files = event.originalEvent.dataTransfer.files;
				//단일 파일데이터기때문에 첫번째 파일만 저장.
				var file = files[0];

				//console.log(file);
				//파일 데이터 저장하는 변수
				var formData = new FormData();

				formData.append("file", file);

				$.ajax({
					url : '/sboard/register/uploadAjax',
					data : formData,
					dataType : 'text',
					// 데이터를 일반적인 query String으로 변환할건지 결정.
					// 기본값은 true 
					// 자동변환 방지위해 false
					processData : false,
					//multipart/form-data방식으로 전송하기 위해 false
					contentType : false,
					type : 'POST',
					success : function(data) {
						alert(data);
						var fileInfo = getFileInfo(data);
						
						var html = template(fileInfo);
						
						$(".uploadedList").append(html);
					}
				});
		});
		

		
	</script>
	
	<script type="text/javascript">
		//이미지 파일 여부 확인
		function checkImageType(fileName) {
			// i 대소문자 구분 없음
			var pattern = /jpg|gif|png|jpeg/i;
	
			return fileName.match(pattern);
		}
		
		function getFileInfo(fullName){
			
			var fileName, imgsrc, getLink;
			
			var fileLink;
			
			if(checkImageType(fullName)){
				imgsrc = "/sboard/register/displayFile?fileName="+fullName;
				fileLink = fullName.substr(18);
				
				var front = fullName.substr(0,12);   //2019/11/26/
				var end = fullName.substr(18);
				
				getLink = "/sboard/register/displayFile?fileName="+front+end;
			}else{
				//니가 추가해!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				imgsrc = "/resources/images/book4.png";
				fileLink = fullName.substr(12);
				getLink="/sboard/register/displayFile?fileName="+fullName;
			}
			
			fileName = fileLink.substr(fileLink.indexOf("_")+1);
			
			return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
		}
		
	</script>
	<script>
		$("#registerForm").submit(function(event){
			event.preventDefault();
		
		var that = $(this);
		
		var str = "";
		
		$(".uploadedList .delbtn").each(function(index){
			str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
		});
		
		that.append(str);
		
		that.get(0).submit();
		});
		//submit전 파일  삭제 처리
		$(".uploadedList").on("click", "delbtn", function(event) {
			var that = $(this);

			$.ajax({
				url : "/sboard/register/deleteFile",
				type : "post",
				data : {
					fileName : $(this).attr("href")
				},
				dataType : "text",
				success : function(result) {
					if (result = 'deleted') {
						alert("deleted");
						that.parent("li").remove();
					}
				}
			});
		});
	</script>
</body>

</html>