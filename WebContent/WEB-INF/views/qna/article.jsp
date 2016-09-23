<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
   String cp = request.getContextPath();
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
function deleteBoard() {
	<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
	    var boardNum = "${dto.boardNum}";
	    var page = "${page}";
	    var params = "boardNum="+boardNum+"&page="+page;
	    var url = "<%=cp%>/qna/delete.do?" + params;

	    if(confirm("위 자료를 삭제 하시겠습니까 ? "))
	    	location.href=url;
	</c:if>    
	<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
	    alert("게시물을 삭제할 수 없습니다.");
	</c:if>
}

function updateBoard() {
	<c:if test="${sessionScope.member.userId==dto.userId}">
	    var boardNum = "${dto.boardNum}";
	    var page = "${page}";
	    var params = "boardNum="+boardNum+"&page="+page;
	    var url = "<%=cp%>/qna/update.do?" + params;

	    location.href=url;
	</c:if>

	<c:if test="${sessionScope.member.userId!=dto.userId}">
	   alert("게시물을 수정할 수 없습니다.");
	</c:if>
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
	margin: 30px auto;
	border-bottom: 2px solid DarkSlateGrey;
	font-size: 18pt;
	font-weight: bold;
	line-height: 80px;
	color: slategray;
}

#formbody {
	width: 700px;
	margin: 0px auto;
}

#subject {
	width: 700px;
	height: 33px;
	font-weight: 500;
	text-align: center;
	border-top: 1px solid silver;
	border-bottom: 1px solid silver;	
	line-height: 35px;
}

#shoulder {
	width: 700px;	
	height: 34px;
	line-height: 35px;	
	border-bottom: 1px solid silver;	
}

#shoulder_p1 {
	float:left;
	width:350px;
	text-align: left;
}

#shoulder_p2 {
	float:left;
	width:350px;
	text-align: right;	
}

#main_content {
	width: 700px;
	height: 350px;
	border-bottom: 1px solid silver;
}

#ankle_p1 {
	width: 700px;
	height: 34px;
	line-height: 35px;	
	border-bottom: 1px solid silver;
}

#ankle_p2 {
	width: 700px;
	height: 34px;
	line-height: 35px;	
	border-bottom: 1px solid silver;
}

#footer {
	clear: both;
	width: 700px;
	height: 50px;	
	line-height: 50px;
}


#footer_p1 {
	float:left;
	width:350px;
	text-align: left;
}

#footer_p2 {
	float:right;
	width:350px;
	text-align: right;
}

.btn_article {
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

.btn_article:hover {
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
     <li><a href="<%=cp%>/qna/qna.do">질문과답변</a></li>
     <li class="active"><a href="<%=cp%>/faq/faq.do">자주묻는질문</a></li>
   </ul>

<div id=header>질문과 답변</div>
<div id=formbody>
<div id=subject>
	<%/* 제목 */%>
	${dto.subject}
	
</div>
<div id=shoulder>
	<%/* 작성자, 날짜 및 시간 */%>
	<div id=shoulder_p1>	
		이름: ${dto.userName}
	</div>
	<div id=shoulder_p2>		
		${dto.created}
	</div>
</div>

<div id=main_content>
	<%/* 본문 */%>
	${dto.content}
</div>

<div id=ankle_p1>
	이전글:&nbsp;
	<c:if test="${not empty preReadDto }">
		<a href="<%=cp%>/qna/article.do?${params}&boardNum=${preReadDto.boardNum}">${preReadDto.subject}</a>
	</c:if>
</div>

<div id=ankle_p2>
	다음글:&nbsp;
	<c:if test="${not empty nextReadDto }">
		<a href="<%=cp%>/qna/article.do?${params}&boardNum=${nextReadDto.boardNum}">${nextReadDto.subject}</a>
	</c:if>
</div>

<div id=footer>
	<%-- 각종 버튼들(하단) --%>
	<div id=footer_p1>
		<%-- 답글: depth가 0인 글만 버튼 노출 --%>
		<c:if test="${dto.depth==0}">
		<input type="submit" name="btn" class="btn_article" value=" 답글 " 
				onclick="javascript:location.href='<%=cp%>/qna/reply.do?boardNum=${dto.boardNum}&page=${page}';">
		</c:if>		
		
		<%-- 수정: 해당 글 작성자(userId)에게만 버튼 노출 --%>
		<c:if test="${sessionScope.member.userId==dto.userId}">
			<input type="submit" name="btn" class="btn_article" value=" 수정 " 
				onclick="updateBoard();">
		</c:if>
		
		<%-- 삭제: 해당 글 작성자(userId)와 관리자(admin)에게만 버튼 노출 --%>
		<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
			<input type="submit" name="btn" class="btn_article" value=" 삭제 " 
				onclick="deleteBoard();">
		</c:if>					
	</div>
	<div id=footer_p2>
		<input type="submit" name="btn" class="btn_article" value=" 목록 " 			
			onclick="javascript:location.href='<%=cp%>/qna/qna.do';">
	</div>
</div>

</div>

</div>

</body>
</html>