<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>배달의 나라</title>
<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>

</head>
<body>
<div>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

<div class="container" role="main">
	<div class="body-title">
		<h3 align="center">MENU 선택</h3>
		<h3 align="center">지역 선택</h3>
	</div>
	<div class="body-menu">
		<input type="checkbox" name="menu"><img src="<%=cp%>/res/images/chicken.png" class="img-circle">
		<input type="checkbox" name="menu"><img src="<%=cp%>/res/images/pizza.png" class="img-circle">
		<input type="checkbox" name="menu"><img src="<%=cp%>/res/images/jungkukzip.png" class="img-circle">
		<input type="checkbox" name="menu"><img src="<%=cp%>/res/images/bunsik.png" class="img-circle">
		<input type="checkbox" name="menu"><img src="<%=cp%>/res/images/jokbal.png" class="img-circle">
		<input type="checkbox" name="menu"><img src="<%=cp%>/res/images/hansik.jpg" class="img-circle">
	</div>
</div>

<div>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

</body>
</html>