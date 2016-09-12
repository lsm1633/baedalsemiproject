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


	<ul class="nav nav-tabs">
  	<li ><a href="<%=cp%>/notice/notice.do" data-toggle="tab">공지사항</a></li>
  	<li class="active"><a href="<%=cp%>/freeboard/freeboard.do" data-toggle="tab">자유게시판</a></li>
  	<li><a href="<%=cp%>/qna/qna.do" data-toggle="tab">질문과답변</a></li>
  	<li><a href="<%=cp%>/faq/faq.do" data-toggle="tab">자주묻는질문</a></li>
	</ul>

	<div class="tab-content">
	  <div class="tab-pane" id="notice">공지사항</div>
	  <div class="tab-pane active" id="freeboard">자유게시판</div>
	  <div class="tab-pane" id="qna">질문과답변</div>
	  <div class="tab-pane" id="faq">자주묻는질문</div>
	</div>
	

<div>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

</body>
</html>