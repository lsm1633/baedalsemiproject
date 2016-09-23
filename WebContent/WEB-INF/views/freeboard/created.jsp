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
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
</style>
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
    		f.action="<%=cp%>/freeboard/created_ok.do";
    	else if(mode=="update")
    		f.action="<%=cp%>/freeboard/update_ok.do";
       	else if(mode=="reply")
       		f.action="<%=cp%>/freeboard/reply_ok.do";

    	// image 버튼, submit은 submit() 메소드 호출하면 두번전송
        return true;
    }
</script>
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

<div class="container">
	<ul class="nav nav-tabs nav-justified">
  	<li ><a href="<%=cp%>/notice/notice.do" data-toggle="tab">공지사항</a></li>
  	<li class="active"><a href="<%=cp%>/freeboard/freeboard.do" data-toggle="tab">자유게시판</a></li>
  	<li><a href="<%=cp%>/qna/qna.do" data-toggle="tab">질문과답변</a></li>
  	<li><a href="<%=cp%>/faq/faq.do" data-toggle="tab">자주묻는질문</a></li>
	</ul>

	<div class="tab-content">
	  <div class="tab-pane active" id="freeboard">
	      <div class="bodyFrame col-sm-10" style="float: none; margin: 30px auto;">
	      
	         <div class="body-title">
						<h3><span class="glyphicon glyphicon-book"></span>자유 게시판</h3>
				</div>
				
				<div class="alert alert-info">
						<i class="glyphicon glyphicon-pencil"> 욕설은 삼가해주세요!!</i>
				</div>
			
			
			
			
			
				<div>
										
			
		
					<form name="boardForm" method="post" onsubmit="return check();">
					  <table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
					  <tr><td colspan="2" height="3" bgcolor="#507CD1"></td></tr>
					
					  <tr align="left" height="40"> 
					      <td width="100" bgcolor="#EEEEEE" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					      <td width="500" style="padding-left:10px;"> 
					        <input type="text" name="subject" size="75" maxlength="100" class="boxTF" value="${dto.subject}">
					      </td>
					  </tr>
					  <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>
					  
					  <tr align="left" height="40"> 
					      <td width="100" bgcolor="#EEEEEE" style="text-align: center;">작 성 자</td>
					      <td width="500" style="padding-left:10px;"> 
					        ${sessionScope.member.userName}
					      </td>
					  </tr>
				      <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>
				      
					  <tr align="left"> 
					      <td width="100" bgcolor="#EEEEEE" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					      <td width="500" valign="top" style="padding:5px 0px 5px 10px;"> 
					        <textarea name="content" cols="75" rows="12" class="boxTA">${dto.content}</textarea>
					      </td>
					  </tr>
					  <tr><td colspan="2" height="3" bgcolor="#507CD1"></td></tr>
					  </table>
					
					  <table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
					     <tr height="45"> 
					      <td align="center" >
				
						    <button type="submit" class="btn btn-primary"> 확인 <span class="glyphicon glyphicon-ok"></span></button>
		        		    <a href="javascript:location.href='<%=cp%>/freeboard/freeboard.do';"><button type="button" class="btn btn-danger"> 취소 </button></a>
		        		    
		        		    <c:if test="${mode=='update'}">
		        		          <input type="hidden" name="boardNum" value="${dto.boardNum}">
		        		          <input type="hidden" name="page" value="${page}">
		        		    </c:if>
		        		    
		        		    <c:if test="${mode=='reply'}">
		        		    	  <input type="hidden" name="groupNum" value="${dto.groupNum}">
		        		    	  <input type="hidden" name="orderNo" value="${dto.orderNo}">
		        		    	  <input type="hidden" name="depth" value="${dto.depth}">
		        		    	  <input type="hidden" name="parent" value="${dto.boardNum}">
		        		    	  <input type="hidden" name="page" value="${page}">
		        		    </c:if>
		
					      </td>
					    </tr>
					  </table>
					</form>
				</div>
		</div>
	  
	  
	  </div>
	</div>
	

<div>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>