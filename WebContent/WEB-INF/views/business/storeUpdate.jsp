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
<title>점포수정</title>
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
</head>
<body>

	<div>
		<dl style="height: 150px">
			<dd>
				<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp" />
			</dd>
		</dl>
	</div>

	<div class="container" role="main">

		<ul class="nav nav-tabs nav-justified">
			<li><a href="<%=cp%>/business/menu.do">메뉴관리</a></li>
			<li><a href="<%=cp%>/business/storeUpdate.do">점포정보수정</a></li>
		</ul>

		<div class="body-title">
			<h3 align="left">점포수정</h3>
		</div>
		<hr>
	</div>

	<div align="center">
		<dl style="height: 140px">
			<dd>
				<jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp" />
			</dd>
		</dl>
	</div>

	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>