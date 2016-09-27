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
    function check() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

    	var mode="${mode}";
    	if(mode=="created")
    		f.action="<%=cp%>/qna/created_ok.do";
    	else if(mode=="update")
    		f.action="<%=cp%>/qna/update_ok.do";
    	else if(mode=="reply")
       		f.action="<%=cp%>/qna/reply_ok.do";
       		
        return true;
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
	width: 650px;
	margin: 0px auto;
}

#category {
	float: left;
	width: 150px; height: 280px;
	background: #EEEEEE;	
	text-align: center;	
}

#item {
	float: left;
	width: 500px; height: 280px;	
	text-align: left;
}

#footer {
	clear: both;
	width: 650px;
	height: 50px;	
	line-height: 50px;
	text-align: center;
}

.created_sub {
	height: 25px; width: 450px;
	border: 1px solid silver;
	margin: 6px 0px 0px 10px;
	padding: 0px 0px 0px 10px;
	border-radius: 3px;
	outline-color: SlateGray ;
}

.btn_created {
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

.btn_created:hover {
	background: tomato;
	color:#FFFFFF;
}

textarea {
	width: 470px;
	margin: 10px 0px 0px 10px;
	padding: 0px 0px 0px 10px;
	border: 1px solid silver;
	border-radius: 3px;
	outline-color: SlateGray ;
}

dd {		
	border-bottom: 1px solid #B0C4DE;
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
<form name="boardForm" method="post" onsubmit="return check();">
<div id=category>
	<dl>
		<dd style="height: 40px; line-height: 40px; border-top: 1px solid #B0C4DE;">제&nbsp;&nbsp;목</dd>
		<dd style="height: 40px; line-height: 40px; ">작성자</dd>
		<dd style="height: 200px; line-height: 200px;">내&nbsp;&nbsp;용</dd>
	</dl>

</div>

<div id=items>
	<dl>
		<dd style="height: 40px; border-top: 1px solid #B0C4DE;">
			<input type="text" name="subject" class=created_sub maxlength="100" class="boxTF" value="${head==null ? dto.subject : head}">
		</dd>
		<dd style="height: 40px; line-height: 40px;">&nbsp;&nbsp;${sessionScope.member.userName}</dd>
		<dd style="height: 200px;">
			<textarea name="content" class="boxTA">${dto.content}</textarea>
		</dd>
	</dl>
</div>


<div id=footer>
	<input type="submit" name="btn" class="btn_created" value=" 확인 " >
		
	<a href="javascript:location.href='<%=cp%>/qna/qna.do';">
		<input type="button" name="btn" class="btn_created" value=" 취소 " ></a>
							
	<c:if test="${mode=='update'}">
		<input type="hidden" name="boardNum" value="${dto.boardNum}">
		<input type="hidden" name="page" value="${page}">
	</c:if>
							
	<c:if test="${mode=='reply'}">
		<input type="hidden" name="groupNum" value="${dto.groupNum}">
		<input type="hidden" name="orderNo" value="${dto.orderNo}">
		<input type="hidden" name="depth" value="${dto.depth}">
		<input type="hidden" name="parent" value="${dto.boardNum}">
		<input type="hidden" name="parent_id" value="${dto.userId}">
		<input type="hidden" name="page" value="${page}">
	</c:if>
</div> 
</form>  
</div> 
</div>
<div>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
</body>
</html>