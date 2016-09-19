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
	function searchList() {
		var f=document.searchForm;
		f.action="<%=cp%>/freeboard/freeboard.do";
		f.submit();
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
         <div style="min-height: 450px;">
				<div style="width:100%;	height: 40px; line-height:40px;clear: both;">
				    <div style="width:600px; height:30px; line-height:30px; margin:5px auto;">
				        <img src="<%=cp%>/res/images/board.jpg" width="50px" alt="" style="padding-left: 5px; padding-right: 5px;">
				        <span style="font-weight: bold;font-size:13pt;font-family: 'Jeju Hallasan', serif;">자유 게시판</span>
				    </div>
				</div>
			
				<div style="margin: 10px auto; margin-top: 20px; width:700px; min-height: 400px;">
		
					<table style="width: 700px; margin: 0px auto; border-spacing: 0px;">
					   <tr height="35">
					      <td align="left" width="50%">
					          <form name="searchForm" action="" method="post">
					              <select name="searchKey" class="selectField">
									<option value="subject">제목</option>
									<option value="userName">작성자</option>
									<option value="content">내용</option>
									<option value="created">등록일</option>
					            </select>
					            <input type="text" name="searchValue" class="boxTF">
					            <input type="button" value=" 검 색 " class="btn" onclick="searchList()">
					        </form>
					      </td>
					      <td align="right">
					          <input type="image" src="<%=cp%>/res/images/btn_write.gif" onclick="javascript:location.href='<%=cp%>/freeboard/created.do';">
					      </td>
					   </tr>
					</table>
					
					<table style="width: 700px; margin: 0px auto; border-spacing: 0px;">
					  <tr align="center" bgcolor="#05FFB2" height="30"> 
					      <td width="60" style="color: #ffffff;">번호</td>
					      <td width="400" style="color: #ffffff;">제목</td>
					      <td width="100" style="color: #ffffff;">작성자</td>
					      <td width="80" style="color: #ffffff;">작성일</td>
					      <td width="60" style="color: #ffffff;">조회수</td>
					  </tr>
					 
					 <c:forEach var="dto" items="${list}">
					  <tr align="center" bgcolor="#ffffff" height="30"> 
					      <td align="center">${dto.listNum}</td>
					      <td align="left" style="padding-left: 10px;">
					          <c:forEach var="n" begin="1" end="${dto.depth}">
	                                &nbsp;&nbsp;
	                            </c:forEach>
	                            <c:if test="${dto.depth!=0}">
	                                <img src='<%=cp%>/res/images/re.gif'>
	                            </c:if>
	                            <a href='${articleUrl}&boardNum=${dto.boardNum}'>${dto.subject}</a>
	                            <c:if test="${dto.gap < 1}">
								       <img src='<%=cp%>/res/images/new.gif'>
							    </c:if>
					      </td>
					      <td align="center">${dto.userName}</td>
					      <td align="center">${dto.created}</td>
					      <td align="center">${dto.hitCount}</td>
					  </tr>
					  <tr><td height="1" colspan="5" bgcolor="#e4e4e4"></td></tr> 
					 </c:forEach>
					</table>
					 
					<table style="width: 700px; margin: 0px auto; border-spacing: 0px;">
					   <tr height="35">
						<td align="center">
					        <c:if test="${dataCount==0 }">
			                       등록된 게시물이 없습니다.
			                </c:if>
			                <c:if test="${dataCount!=0 }">
			                    ${paging}
			                </c:if>
						</td>
					   </tr>
					</table>
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