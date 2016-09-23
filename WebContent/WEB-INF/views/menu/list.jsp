<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet"
	href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css"
	type="text/css" />

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css"
	type="text/css" />

<script type="text/javascript"
	src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="<%=cp%>/res/js/util.js"></script>

</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div class="container">
		<div style="font-size: 20pt">주문 하기</div>

		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true" style="width: 1000px">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne"> 세트 메뉴 </a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body" align="center">
					<c:forEach var="dto" items="${list}">
						<c:if test="${dto.cate == 'set'}">
							<div class="row1">
								<div class="col-sm-5 col-md-6">
									<div class="thumbnail" style="border-color: white;">
										<a href="#" class="btn btn-default" role="button" style="width: 450px; height: 160px"> <img
											src="<%=cp%>/uploads/${dto.ceoId}/menu/${dto.imageFilename}"
											style="float: left" width="200px" height="130px"> <b
											style="font-size: 15pt">${dto.name}</b> <br> <b
											style="font-size: 10pt">${dto.price} </b> <br> <b
											style="font-size: 10pt">${dto.content} </b> <input
											type="hidden" value="${dto.ceoId}">
										</a>
									</div>
								</div>
							</div>
						</c:if>
						</c:forEach>





					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo"> 메인 메뉴 </a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">
						<c:forEach var="dto" items="${list}">
						<c:if test="${dto.cate == 'main'}">
							<div class="row1">
								<div class="col-sm-5 col-md-6">
									<div class="thumbnail" style="border-color: white;">
										<a href="#" class="btn btn-default" role="button" style="width: 450px; height: 160px" > <img
											src="<%=cp%>/uploads/${dto.ceoId}/menu/${dto.imageFilename}"
											style="float: left" width="200px" height="130px"> <b
											style="font-size: 15pt;">${dto.name}</b> <br> <b
											style="font-size: 10pt;">${dto.price} </b> <br> <b
											style="font-size: 10pt; ">${dto.content} </b> <input
											type="hidden" value="${dto.ceoId}">
										</a>
									</div>
								</div>
							</div>
						</c:if>
						</c:forEach>


					</div>
				</div>
			</div>


			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingThree">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree"> 사이드 메뉴 </a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingThree">
					<div class="panel-body">
						<c:forEach var="dto" items="${list}">
						<c:if test="${dto.cate == 'side'}">
							<div class="row1">
								<div class="col-sm-5 col-md-6">
									<div class="thumbnail" style="border-color: white;">
										<a href="#" class="btn btn-default" role="button" style="width: 450px; height: 160px"> <img
											src="<%=cp%>/uploads/${dto.ceoId}/menu/${dto.imageFilename}"
											style="float: left" width="200px" height="130px"> <b
											style="font-size: 15pt">${dto.name}</b> <br> <b
											style="font-size: 10pt">${dto.price} </b> <br> <b
											style="font-size: 10pt">${dto.content} </b> <input
											type="hidden" value="${dto.ceoId}">
										</a>
									</div>
								</div>
							</div>
						</c:if>
						</c:forEach>
					
					</div>
				</div>
			</div>


		</div>
	</div>

	<div style="clear: both;">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>