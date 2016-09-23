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
<title>배달의 나라 소개</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

</style>
<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>

<style type="text/css">
#mainbox{
   width:800px;
   height:350px;
   margin:10px auto;
   text-align: center;
}
.bannerMain dd{
  float:left;
}
</style>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
@import url(http://fonts.googleapis.com/earlyaccess/kopubbatang.css);
</style>
</head>
<body>
<div class="container">

<div>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

<div style="height: 1500px">
<h1><b>서비스 소개</b></h1>
  <div align="center" style="font-family: 'KoPub Batang', serif; font-size: 20pt" style="height: 200px">대한민국 &nbsp;1등&nbsp; 배달&nbsp; 사이트,<br>우리는&nbsp; 배달의 나라&nbsp; 입니다.<br>
  업계 최고!<br>월간 순 사용자수 1위<br>
  </div>
  <!-- 16:9 aspect ratio -->
  <div align="center" class="embed-responsive embed-responsive-16by9">
    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/pLbNcnU4gkc" width="300px"></iframe>
  </div>
  
  <div style="height: 80px"></div>
  
  <div style="height: 250px" >
   <div style="float: left"> &emsp; &emsp; <img src="<%=cp%>/res/images/review.jpg" width="300" height="200"/></div>
   <div style="float: left">
	  <strong style="font-family:'Hanna', serif; font-size: 28pt"> &emsp;사진리뷰로 확인하고,<br></strong>
	  <div style="font-family: 'Nanum Myeongjo', serif; font-size: 15pt">
	   &emsp; &emsp;직접 찍어서 올린 생생한 사진리뷰를 보고 주문할 수 있어요.
	  <br>&emsp; &emsp;또한 내가 쓴 리뷰에 음식점 사장님이 정성스런 댓글을 달아주시니
	  <br>&emsp; &emsp;소소한 감동이 밀려와요.<br></div>
   </div>
  </div>
  <div style="height: 250px" >
    <div style="float: left">  &emsp; &emsp;<img src="<%=cp%>/res/images/order.JPG" width="300" height="200"/></div>
    <div style="float: left">
	  <strong style="font-family:'Hanna', serif; font-size: 28pt"> &emsp;다양한 메뉴를 주문하고!<br></strong>
	  <div style="font-family: 'Nanum Myeongjo', serif; font-size: 15pt">
	   &emsp; &emsp;드시고 싶은 메뉴를 언제든지 주문할 수 있어요.
	  <br>&emsp; &emsp;치킨, 피자, 중식 등등 어떤 메뉴든지
	  <br>&emsp; &emsp;주문할 수 있어요.<br></div>
    </div>
  </div>
  
  <div align="center" style="height: 200px">
   <a href="<%=cp%>" class="btn btn-default" role="button" style="font-size: 30pt; font-family: 'Nanum Pen Script', serif;">
   <img src="<%=cp%>/res/images/kakaneo.gif" width="100" height="100"/>주문하러 가기 &nbsp;GO!!</a>
  </div >
  
</div>

<div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

</div>
</body>
</html>