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
		</div>
		<div class="body-menu" align="center">
			<dl style="margin: 15px 30px 15px;">
				<dd><a href="#"><img src="<%=cp%>/res/images/chicken.png"class="img-circle"></a></dd>
				<dd><a href="#"><img src="<%=cp%>/res/images/pizza.png" class="img-circle"></a></dd>
				<dd><a href="#"><img src="<%=cp%>/res/images/jungkukzip.png"class="img-circle"></a></dd>
			</dl>
			<dl style="margin: 15px 30px 15px;">
				<dd><a href="#"><img src="<%=cp%>/res/images/bunsik.png"class="img-circle"></a></dd>
				<dd><a href="#"><img src="<%=cp%>/res/images/jokbal.png"class="img-circle"></a></dd>
				<dd><a href="#"><img src="<%=cp%>/res/images/hansik.jpg"class="img-circle"></a></dd>
			</dl>
		</div>
	</div>
	
	<div class = "main-carousel" align="center">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="3000">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-genericl" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox" align="center">
			<div class="item active">
				<img src="<%=cp%>/res/images/banner3.png" alt="배너1">
				<div class="carousel-caption">
				</div>
			</div>
			<div class="item">
				<img src="<%=cp%>/res/images/banner4.png" alt="배너2">
			</div>
			<div class="item">
				<img src="<%=cp%>/res/images/banner5.png" alt="배너3">
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"role="button" data-slide="prev"> 
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> 
			<span class="sr-only">Previous</span>
		</a> 
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> 
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>
	<div style="margin: 120px auto  30px" align="center">
		<a><img src="<%=cp%>/res/images/game.png"></a>
	</div>


	<div style="clear: both;">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>