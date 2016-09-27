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
.margin{
	margin: 20px 40px 30px;
}
</style>

</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div class="container" role="main">
		<div class="body-title">
			<h3 align="center">MENU 선택</h3>
		</div>
		<!-- <form name="searchForm" method="post" class="form-inline"> -->
		<div class="body-menu" align="center" >
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-5 col-xs-12 margin">
			
				<div class="hovereffect ">
					<img class="img-responsive img-circle" src="<%=cp%>/res/images/chicken.png"
						alt="">
					<div class="overlay img-circle">
						<a class="info" onclick="searchList('chicken');">치킨</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-5 col-xs-12 margin">		
				<div class="hovereffect ">
					<img class="img-responsive img-circle" src="<%=cp%>/res/images/pizza.png"
						alt="">
					<div class="overlay img-circle">
						<a class="info" onclick="searchList('pizza');">피자</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-5 col-xs-12 margin">	
				<div class="hovereffect ">
					<img class="img-responsive img-circle" src="<%=cp%>/res/images/bunsik.png"
						alt="">
					<div class="overlay img-circle">
						<a class="info" onclick="searchList('bunsik');">분식</a>
					</div>
				</div>
			</div>
		
			<div class="col-lg-3 col-md-4 col-sm-5 col-xs-12 margin" style="clear: both;">	
				<div class="hovereffect ">
					<img class="img-responsive img-circle" src="<%=cp%>/res/images/jokbal.png"
						alt="">
					<div class="overlay img-circle">
						<a class="info" onclick="searchList('jokbal');">족발</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-5 col-xs-12 margin">		
				<div class="hovereffect ">
					<img class="img-responsive img-circle" src="<%=cp%>/res/images/jungkukzip.png"
						alt="">
					<div class="overlay img-circle">
						<a class="info" onclick="searchList('chinese');">중국집</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-5 col-xs-12 margin">	
				<div class="hovereffect ">
					<img class="img-responsive img-circle" src="<%=cp%>/res/images/hansik.jpg"
						alt="">
					<div class="overlay img-circle">
						<a class="info" onclick="searchList('hansik');">한식</a>
					</div>
				</div>
			</div>
			</div>



			<%-- <dl style="margin: 15px 30px 15px;">
				<dd><a onclick="searchList('chicken');"><img src="<%=cp%>/res/images/chicken.png"class="img-circle"></a></dd>
				<dd><a onclick="searchList('pizza');"><img src="<%=cp%>/res/images/pizza.png" class="img-circle"></a></dd>
				<dd><a onclick="searchList('jungkukzip');"><img src="<%=cp%>/res/images/jungkukzip.png"class="img-circle"></a></dd>
			</dl>
			<dl style="margin: 15px 30px 15px;">
				<dd><a onclick="searchList('bunsik');"><img src="<%=cp%>/res/images/bunsik.png"class="img-circle"></a></dd>
				<dd><a onclick="searchList('jokbal');"><img src="<%=cp%>/res/images/jokbal.png"class="img-circle"></a></dd>
				<dd><a onclick="searchList('hansik');"><img src="<%=cp%>/res/images/hansik.jpg"class="img-circle"></a></dd>
			</dl> --%>
		</div>
		<!-- </form> -->
	</div>
	
	<div class="container" role="main">
	<div class="main-carousel" align="center">
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
						src="<%=cp%>/res/images/banner3.png" alt="배너1"></a>
					<div class="carousel-caption"></div>
				</div>
				<div class="item">
					<a href="<%=cp%>/notice/article.do?${params}&num=8"> <img
						src="<%=cp%>/res/images/banner4.png" alt="배너2"></a>
				</div>
				<div class="item">
					<a href="<%=cp%>/notice/article.do?${params}&num=11"> <img
						src="<%=cp%>/res/images/banner5.png" alt="배너3"></a>
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

	<div style="margin: 15px auto 30px" align="center">
		<a href="<%=cp%>/game/sadari.do"><img
			src="<%=cp%>/res/images/game.png"></a>
	</div>
	</div>

	<div class="container" role="main" style="margin-top: 30px">
	<!-- <div class="main-carousel" align="center"> -->
	<div class="col-xs-6">
		<h3 class="glyphicon glyphicon-book">공지사항</h3>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="더보기"
			onclick="javascript:location.href='<%=cp%>/notice/notice.do';"><br>

		<div class="table-responsive">
			<table class="table table-hover">
				<c:forEach var="dto" items="${listNotice}">
					<tr>
						<td class="text-center"><span
							style="display: inline-block; width: 28px; height: 18px; line-height: 18px; background: #ED4C00; color: #FFFFFF">공지</span></td>
						<td><a href="${articleUrl}&num=${dto.num}">${dto.subject}</a></td>
						<td class="text-center">${dto.created}</td>
						<td><br></td>
					</tr>

				</c:forEach>
			</table>
		</div>
		<h3 class="glyphicon glyphicon-book">이용방법</h3>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="자세히"
			onclick="javascript:location.href='#';"><br>
	</div>
	
	<div class="col-xs-6">
	<div align="center">
		<iframe width="500" height="350"
			src="https://www.youtube.com/embed/pLbNcnU4gkc"></iframe>
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