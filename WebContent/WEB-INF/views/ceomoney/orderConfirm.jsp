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
<title>주문 확인</title>
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

<style type="text/css">
* {	
	margin: 0px;
	padding: 0px;
	font-family: Malgun Gothic, NanumGothic;
}

#formbody {
	width: 800px;
	margin: 0px auto;
}

#column {
	width: 800px;
	color: #FFFFFF;
	font-size: 10pt;
	background: #A9A9A9;
	text-align: center;
	height: 30px;
	line-height: 30px;
}

#content {
	width: 800px;
	height: 30px; line-height: 30px;
	
	text-align: center;
	border-bottom: 1px solid silver;
}

.col1 {
	float: left;
	width: 80px;
}

.col2 {
	float: left;
	width: 320px;
}

.col3 {
	float: left;
	width: 100px;
}


.col4 {
	float: left;
	width: 100px;
}

.col5 {
	float: left;
	width: 200px;
}

#footer {
	clear: both;
	width: 800px;
	height: 100px;
	text-align: center;
	line-height: 100px;
}
</style>

</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp"></jsp:include>
	</div>

	<div class="container" role="main">
	<div class="bodyFrame col-sm-10"
			style="float: none; margin-left: auto; margin-right: auto;">
		<ul class="nav nav-tabs nav-justified">
			<li class="active"><a href="<%=cp%>/ceomoney/orderConfirm.do">주문확인</a></li>
			<li><a href="<%=cp%>/ceomoney/ceomoney.do">정산내역</a></li>
		</ul>

		<div class="body-title">
			<h3 align="left">주문내역 확인</h3>
		</div>
		<hr>
	
			<div id=formbody>
				<div id=column>					
					<div class=col1>번호</div>
					<div class=col2>메뉴이름</div>
					<div class=col3>가격</div>
					<div class=col4>결제수단</div>
					<div class=col5>주문일시</div>					
				</div>					
			
				<c:forEach var="dto" items="${list}">
				<div id=content>
					<div class=col1>${dto.listNum}</div>
					<div class=col2><a href='${articleUrl}&ordernum=${dto.ordernum}'>${dto.menuName}</a></div>
					<div class=col3>${dto.price}원</div>
					<div class=col4>${dto.payment}</div>
					<div class=col5>${dto.created}</div>					
				</div>					
				</c:forEach>

				<div id=footer>
					<%-- 페이지 이동 --%>
					<c:if test="${dataCount!=0 }">
						${paging}
					</c:if>
				</div>
			</div>
		</div>		
	</div>



	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp"></jsp:include>
	</div>

	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>