<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문과 답변</title>

<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="<%=cp%>/res/js/util.js"></script>
<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.action="<%=cp%>/qna/qna.do";
		f.submit();
	}	
</script>

<style type="text/css">
* {	
	margin: 0px;
	padding: 0px;
	font-family: Malgun Gothic, NanumGothic;
}

#header {
	width: 800px;
	height: 80px;
	margin: 15px auto;
	border-bottom: 2px solid DarkSlateGrey;
	font-size: 18pt;
	font-weight: bold;
	line-height: 80px;
	color: slategray;
}

#formbody {
	width: 800px;
	margin: 0px auto;
}

#shoulder {
	width: 800px;	
	height: 50px;
	line-height: 50px;
	text-align: right;
}

#column {
	width: 800px;
	color: #FFFFFF;
	background: #A9A9A9;
	text-align: center;
	height: 30px;
	line-height: 30px;
}

#content {
	width: 800px;
	height: 30px;
	line-height: 30px;	
	text-align: center;
	border-bottom: 1px solid silver;
}

.col1 {
	float: left;
	width: 500px;
}

.col2 {
	float: left;
	width: 150px;
}

.col3 {
	float: left;
	width: 150px;
}

#footer {
	clear: both;
	width: 800px;
	height: 50px;
	text-align: center;
	line-height: 50px;
}

.btn_write {
	padding:0px; 
	width:60px; height: 25px; 
	line-height: 25px; 
	border: 0; 
	outline:0; 
	color: #FFFFFF; 
	background: DarkTurquoise;
	cursor: pointer; 
	border-radius: 3px;
}

.btn_write:hover {
	background: tomato;
	color:#FFFFFF;
}

</style>
</head>
<body>
<div>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

<div class="container">

   <ul class="nav nav-tabs nav-justified">
     <li><a href="<%=cp%>/notice/notice.do">공지사항</a></li>
     <li><a href="<%=cp%>/freeboard/freeboard.do">자유게시판</a></li>
     <li class="active"><a href="<%=cp%>/qna/qna.do">질문과답변</a></li>
     <li><a href="<%=cp%>/faq/faq.do">자주묻는질문</a></li>
   </ul>


<div id=header>질문과 답변</div>
<div id=formbody>
<div id=shoulder>
	<input type="submit" name="btn_write" class="btn_write" value=" 글쓰기 " 
		style="" onclick="javascript:location.href='<%=cp%>/qna/created.do';">
	<%-- <input type="submit" name="btn" class="btn_write" value=" 글쓰기 " 
		style="padding:0px; width:60px; height: 25px; line-height: 25px; border: 0; outline:0; color: #FFFFFF; background: DarkTurquoise;
		cursor: pointer; border-radius: 3px;" onclick="javascript:location.href='<%=cp%>/qna/created.do';"> --%>
</div>

<div id=column>
	<div class=col1>제목</div>
	<div class=col2>작성자</div>
	<div class=col3>작성일</div>
</div>


<c:forEach var="dto" items="${list}">
<div id=content>
<%/* 내용 */%>
	<div class=col1>
	<%-- 질문 제목 --%>
		<c:forEach var="n" begin="1" end="${dto.depth}">
			&nbsp;&nbsp;
		</c:forEach>
		<c:if test="${dto.depth!=0}">
			>[답변]&nbsp;
		</c:if>
			<a href='${articleUrl}&boardNum=${dto.boardNum}'>${dto.subject}</a>
		<c:if test="${dto.gap < 1}">
			&nbsp;[new]
		</c:if>
	</div>
	
	<div class=col2>
		<%-- 작성자 --%>
		${dto.userName}
	</div>
	<div class=col3>
		<%-- 작성일 --%>
		${dto.created}
	</div>	
</div>
</c:forEach>

<div id=footer>
<%-- 페이지 이동 --%>
<c:if test="${dataCount!=0 }">
	${paging}
</c:if>
</div>

</div>
<div>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>