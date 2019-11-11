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

body {
	background-color: #f4f2e9;
	background-image:
		url("https://www.transparenttextures.com/patterns/wood-pattern.png");
}
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

	<div class="container">

		<!-- board MODIFY Form -->
		<p class="text-right"><b>${boardVO.bno}</b>번 게시물</p>
		<form role="form" action="modifyPage" method="post">
			<input type='hidden' name='page' value="${cri.page}"> <input
				type='hidden' name='perPageNum' value="${cri.perPageNum}">
			<div class="card shadow-sm p-3 mb rounded">
				<div class="card-header">중고책 수정 폼</div>
				<div class="form-group">
					<label for="bno"></label> <input type='hidden' name='bno'
						value="${boardVO.bno}" readonly="readonly" />
				</div>
				<div class="card-body">
					<div class="row">
						<div class="form-group col">
							<label for="Title">Title</label> <input type="text" name="title"
								class="form-control" id="title" value="${boardVO.title}"
								placeholder="Enter BOOK Title" required />
						</div>
						<div class="form-group col">
							<label for="Writer">Writer</label> <input type="text"
								name="writer" id="writer" class="form-control"
								placeholder="Enter Writer" value="${boardVO.writer}" required />
						</div>
					</div>
					<div class="row">
						<div class="form-group col">
							<label for="publisher">publisher</label> <input type="text"
								name="publisher" id="publisher" class="form-control"
								value="${boardVO.publisher}" placeholder="Enter publisher"
								required />
						</div>
						<div class="form-group col">
							<label for="pubdate">pubdate</label> <input type="text"
								name="pubdate" id="pubdate" class="form-control"
								value="${boardVO.pubdate}" placeholder="Enter publishing date"
								required />
						</div>
					</div>
					<div class="row">
						<div class="form-group col">
							<label for="org_price">org_price</label> <input type="text"
								id="price" name="org_price" class="form-control"
								value="${boardVO.org_price}" placeholder="Enter Original price"
								required />
						</div>
						<div class="form-group col">
							<label for="isbn">isbn</label> <input type="text" name="isbn"
								class="form-control" id="isbn" value="${boardVO.isbn}"
								placeholder="Enter isbn number" required />
						</div>
					</div>
				</div>
				<!--  card body 1 done -->
				<div class="accordion" id="accordion">
					<div class="card">
						<div class="card-header" id="headingOne">
							<button class="btn" type="button" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">중고책 수정 폼 - CLICK!</button>
						</div>
					</div>
					<div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
						data-parent="#accordion">
						<div class="card-body">
							<div class="row">
								<div class="form-group col">
									<label for="sale_price">sale_price</label> <input type="text"
										name="sale_price" class="form-control"
										value="${boardVO.sale_price}" placeholder="Enter Sale price"
										required />
								</div>
								<div class="form-group col">
									<label for="Grade">Grade</label> <input type="text"
										name="grade" class="form-control" value="${boardVO.grade}"
										placeholder="Enter book Status ex)상 중 하" required />
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label for="Content">Content</label>
									<textarea class="form-control rounded-0" name="content"
										value="${boardVO.content}" rows="10"
										placeholder="Enter description...." required>${boardVO.content}</textarea>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label for="phone">phone</label> <input type="text"
										name="phone" class="form-control" value="${boardVO.phone}"
										placeholder="Enter your phone number" required />
								</div>
								<div class="form-group col">
									<label for="contraction">contraction</label> <input type="text"
										name="contraction" class="form-control"
										value="${boardVO.contraction}"
										placeholder="Enter contraction ways" required />
								</div>
							</div>
						</div>
					</div>
					<!-- collpase done -->
				</div>
				<div class="card-footer text-center">
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>
				<!-- card footer done -->
			</div>
			<!-- card done -->
		</form>

		<!-- end of board MODIFY Form -->


		<%-- <!-- board Register Form -->
		<div class="container main-custom">
			<form role="form" action="modifyPage" method="post">
				<input type='hidden' name='page' value="${cri.page}"> <input
					type='hidden' name='perPageNum' value="${cri.perPageNum}">
				<div class="box-body">
					<div class="form-group">
						<label for="bno">BNO</label> <input type='text' name='bno'
							value="${boardVO.bno}" readonly="readonly" />
					</div>
				</div>
				<div class="box-body">
					<div class="form-group">
						<label for="Title">Title</label> <input type="text" name="title"
							class="form-control" value="${boardVO.title}"
							placeholder="Enter BOOK Title" required />
					</div>
					<div class="form-group">
						<label for="Writer">Writer</label> <input type="text"
							name="writer" class="form-control" value="${boardVO.writer}"
							placeholder="Enter Writer" required />
					</div>
					<div class="form-group">
						<label for="publisher">publisher</label> <input type="text"
							name="publisher" class="form-control"
							value="${boardVO.publisher}" placeholder="Enter publisher"
							required />
					</div>
					<div class="form-group">
						<label for="pubdate">pubdate</label> <input type="text"
							name="pubdate" class="form-control" value="${boardVO.pubdate}"
							placeholder="Enter publishing date" required />
					</div>
					<div class="form-group">
						<label for="isbn">isbn</label> <input type="text" name="isbn"
							class="form-control" value="${boardVO.isbn}"
							placeholder="Enter isbn number" required />
					</div>
					<div class="form-group">
						<label for="org_price">org_price</label> <input type="text"
							name="org_price" class="form-control"
							value="${boardVO.org_price}" placeholder="Enter Original price"
							required />
					</div>
					<div class="form-group">
						<label for="sale_price">sale_price</label> <input type="text"
							name="sale_price" class="form-control"
							value="${boardVO.sale_price}" placeholder="Enter Sale price"
							required />
					</div>
					<div class="form-group">
						<label for="Grade">Grade</label> <input type="text" name="grade"
							class="form-control" value="${boardVO.grade}"
							placeholder="Enter book Status ex)상 중 하" required />
					</div>
					<div class="form-group">
						<label for="Content">Content</label>
						<textarea class="form-control rounded-0" name="content" rows="10"
							value="${boardVO.content}" placeholder="Enter description...."
							required /></textarea>
					</div>
					<div class="form-group">
						<label for="phone">phone</label> <input type="text" name="phone"
							class="form-control" value="${boardVO.phone}"
							placeholder="Enter your phone number" required />
					</div>
					<div class="form-group">
						<label for="contraction">contraction</label> <input type="text"
							name="contraction" class="form-control"
							value="${boardVO.contraction}"
							placeholder="Enter contraction ways" required />
					</div>
				</div>
			</form>

			<div class="box-footer">
				<button type="submit" class="btn btn-primary">SAVE</button>
				<button type="submit" class="btn btn-warning">CANCEL</button>
			</div>
		</div>
		<!-- end of board Register Form -->
 --%>
		<!-- Footer -->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>

		<!-- Footer end-->
	</div>
	<!-- script -->

	<script>
		$(document)
				.ready(
						function() {
							var formObj = $("form[role='form']");

							console.log(formObj);

							$(".btn-warning")
									.on(
											"click",
											function() {
												self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
														+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
											});

							$(".btn-primary").on("click", function() {
								formObj.submit();
							});
						});
	</script>
</body>

</html>