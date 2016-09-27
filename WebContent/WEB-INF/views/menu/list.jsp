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
<script type="text/javascript">
function basketadd(ceoId, price, name) {
	var f = document.jangForm;
	
	f.ceoId.value=ceoId;
	f.price.value=price;
	f.name.value=name;
	
	
	f.action = "<%=cp%>/menu/menuadd_ok.do";
	f.submit();
}
</script>

<script type="text/javascript">
function basketdelete(userId, ceoId, menuName) {
	var f = document.jangdelform;
	
	f.userId.value=userId;
	f.ceoId.value=ceoId;
	f.menuName.value=menuName;
	
	
	f.action = "<%=cp%>/menu/menudelete_ok.do";
	f.submit();
}
</script>

</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div class="container">

		<div style="font-size: 20pt">주문 하기</div>
		<div style="width: 300px; border: 1px solid #ccc; margin: 30px auto 5px; float: right;" ><h5 align="center">장바구니</h5>
		<c:if test="${empty list2}">
			<label>장바구니가 비어있습니다</label>
		</c:if>
		<c:if test="${not empty list2}">
		<c:forEach var="dto" items="${list2}">
		<div style="width: 300px; border-bottom: 1px solid #ccc; clear: both;" align="left">
			<label style="width: 150px">${dto.menuName}</label>
			<label style="width: 80px">${dto.price}원</label>
			<label style="width: 30px">${dto.num}개</label>
			<a onclick="basketdelete('${dto.userId}', '${dto.ceoId}', '${dto.menuName}')" role="button">X</a>
		</div>
		</c:forEach>
		<form name="jangdelform" method="post" class="form-inline">
			<input name="userId" type="hidden">
			<input name="ceoId" type="hidden">
			<input name="menuName" type="hidden">
		</form>
		<div style="width: 300px">
			<button style="width: 300px" class="btn btn-success">주문하기</button>
		</div>
		</c:if>
		</div>
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true" style="width: 800px;">
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
										<c:if test="${empty dto.name}">
											<div>
												<img alt="" src="<%=cp%>/res/images/nomenu.png">
											</div>
										</c:if>
										<a onclick="basketadd('${dto.ceoId}', '${dto.price}', '${dto.name}')" class="btn btn-default" role="button" style="width: 350px; height: 160px"> <img
											src="<%=cp%>/uploads/${dto.ceoId}/menu/${dto.imageFilename}"
											style="float: left" width="150px" height="130px"> 
											<b style="font-size: 15pt">${dto.name}</b> <br> 
											<b style="font-size: 10pt">${dto.price} </b> <br>
											<b style="font-size: 10pt">${dto.content} </b> 
											
										</a>
									</div>
								</div>
							</div>
						</c:if>
						</c:forEach>

<form name="jangForm" method="post" class="form-inline">
<input name="ceoId" type="hidden">
<input name="price" type="hidden">
<input name="name" type="hidden">
</form>


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
										<a onclick="basketadd('${dto.ceoId}', '${dto.price}', '${dto.name}')" class="btn btn-default" role="button" style="width: 350px; height: 160px" > <img
											src="<%=cp%>/uploads/${dto.ceoId}/menu/${dto.imageFilename}"
											style="float: left" width="150px" height="130px"> <b
											style="font-size: 15pt;">${dto.name}</b> <br> <b
											style="font-size: 10pt;">${dto.price} </b> <br> <b
											style="font-size: 10pt; ">${dto.content} </b> 
											<input name="ceoId" type="hidden" value="${dto.ceoId}">
											<input name="price" type="hidden" value="${dto.price}">
											<input name="menuName" type="hidden" value="${dto.name}">
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
								<div class="scol-sm-5 col-md-6">
									<div class="thumbnail" style="border-color: white;">
										<a onclick="basketadd('${dto.ceoId}', '${dto.price}', '${dto.name}')" class="btn btn-default" role="button" style="width: 350px; height: 160px"> <img
											src="<%=cp%>/uploads/${dto.ceoId}/menu/${dto.imageFilename}"
											style="float: left" width="150px" height="130px"> <b
											style="font-size: 15pt">${dto.name}</b> <br> <b
											style="font-size: 10pt">${dto.price} </b> <br> <b
											style="font-size: 10pt">${dto.content} </b> 
											<input name="ceoId" type="hidden" value="${dto.ceoId}">
											<input name="price" type="hidden" value="${dto.price}">
											<input name="menuName" type="hidden" value="${dto.name}">
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