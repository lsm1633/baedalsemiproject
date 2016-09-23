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
<title>사장님 사이트</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
</style>
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
<link rel="stylesheet" href="<%=cp%>/res/css/layout/mainHover.css"
	type="text/css" />

<script type="text/javascript"
	src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>

<style type="text/css">
#mainbox {
	width: 1000px;
	height: 500px;
	margin: 10px auto;
	text-align: center;
}

.bannerMain dd {
	float: left;
}
</style>


</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp" />
	</div>


	<div class="container" role="main">
		<c:if test="${empty sessionScope.ceomember}">
			<div class="main-carousel"
				style="width: 450px; height: 220px; margin-left: 100px">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel" data-interval="3000">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-genericl" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox" align="center">
						<div class="item active">
							<a href="<%=cp%>/notice/article.do?${params}&num=5"> <img
								src="<%=cp%>/res/images/banner1.PNG"></a>
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<a href="<%=cp%>/notice/article.do?${params}&num=8"> <img
								src="<%=cp%>/res/images/banner2.PNG" alt="배너2"></a>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div style="float: right; margin: 50px 100px 50px 0px;">
				<dd style="width: 250px;">
					<a href="<%=cp%>/ceomember/join.do"> <input type="image"
						src="<%=cp%>/res/images/ceomemberjoin.PNG" width="200"
						height="100" />
					</a>
				</dd>

				<ul class="nav nav-pills">
					<li role="presentation"
						style="font-size: 45pt; font-family: 'Nanum Pen Script', serif;"><a
						href="<%=cp%>/ceomember/login.do">&nbsp;&nbsp;로그인</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.ceomember}">
			<div class="main-carousel"
				style="width: 450px; height: 220px; margin-left: 300px">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel" data-interval="3000">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-genericl" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox" align="center">
						<div class="item active">
							<a href="<%=cp%>/notice/article.do?${params}&num=5"> <img
								src="<%=cp%>/res/images/banner1.PNG"></a>
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<a href="<%=cp%>/notice/article.do?${params}&num=8"> <img
								src="<%=cp%>/res/images/banner2.PNG" alt="배너2"></a>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</c:if>
	</div>


	<div class="container">

		<div class="col-md-4 quick" style="background-color: #96CEB4;">
			<a class=" info" href="<%=cp%>/storeMenu/menu.do"><span
				class="glyphicon glyphicon-home"> 가게관리</span></a>
		</div>
		<div class="col-md-4 quick" style="background-color: #96CEB4">
			<a class="info" href="#"><span class="glyphicon glyphicon-user">
					개인정보수정</span></a>
		</div>
		<div class="col-md-4 quick" style="background-color: #96CEB4">
			<a class="info" href="<%=cp%>/ceomoney/ceomoney.do"><span
				class="glyphicon glyphicon-signal"> 정산확인</span></a>
		</div>
	</div>

	<div class="container" style="margin-top: 30px">
		<div class="col-md-8">
			<div align="center">
				<iframe width="500" height="350"
					src="https://www.youtube.com/embed/pLbNcnU4gkc"></iframe>
			</div>
		</div>

		<div class=" col-md-4" style="margin-top: 10px">
				<img class="img-responsive"
					src="<%=cp%>/res/images/sajang.PNG" alt="">
			</div>
		



	</div>

	<div style="clear: both;">
		<jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp" />
	</div>

	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
