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
function deleteBoard() {
<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
    var boardNum = "${dto.boardNum}";
    var page = "${page}";
    var params = "boardNum="+boardNum+"&page="+page;
    var url = "<%=cp%>/freeboard/delete.do?" + params;

    if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
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
    var url = "<%=cp%>/freeboard/update.do?" + params;

    location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!=dto.userId}">
   alert("게시물을 수정할 수  없습니다.");
</c:if>
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
				
				<div style="margin: 10px auto; margin-top: 20px; width:600px; min-height: 400px;">
					<table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
					<tr><td colspan="4" height="3" bgcolor="#507CD1"></td></tr>
					
					<tr height="35">
					    <td colspan="4" align="center">
						     <c:if test="${dto.depth!=0}">
	                              [Re]
	                         </c:if>
	                         ${dto.subject}
					    </td>
					</tr>
					<tr><td colspan="4" height="1" bgcolor="#507CD1" ></td></tr>
					
					<tr height="30">
					    <td width="80" bgcolor="#EEEEEE" align="center">작성자</td>
					    <td width="220" align="left" style="padding-left:10px;">
					         ${dto.userName}
					    </td>
					    <td width="80" height="30" bgcolor="#EEEEEE" align="center">줄&nbsp;&nbsp;수</td>
					    <td width="220" align="left" style="padding-left:10px;">
					         ${linesu}
					     </td>
					</tr>
					<tr><td colspan="4" height="1" bgcolor="#DBDBDB"></td></tr>
					
					<tr height="30" >
					    <td width="80" bgcolor="#EEEEEE" align="center">등록일</td>
					    <td width="220" align="left" style="padding-left:10px;">
					        ${dto.created}
					    </td>
					    <td width="80" bgcolor="#EEEEEE" align="center">조회수</td>
					    <td width="220" align="left" style="padding-left:10px;">
					        ${dto.hitCount}
					    </td>
					</tr>
					<tr><td colspan="4" height="1" bgcolor="#507CD1"></td></tr>
					
					<tr>
					  <td colspan="4" align="left" style="padding: 15px 30px 15px 30px;" valign="top" height="150">
					       ${dto.content}
					   </td>
					</tr>
					<tr><td colspan="4" height="1" bgcolor="#507CD1"></td></tr>
					
					<tr height="30">
					    <td width="80" bgcolor="#EEEEEE" align="center">이전글</td>
					    <td width="520" align="left" style="padding-left:10px;" colspan="3">
							<c:if test="${not empty preReadDto }">
								   <a href="<%=cp%>/board/article.do?${params}&boardNum=${preReadDto.boardNum}">${preReadDto.subject}</a>
							 </c:if>		
						</td>
					</tr>
					<tr><td colspan="4" height="1" bgcolor="#DBDBDB"></td></tr>
					
					<tr height="30">
					    <td width="80" bgcolor="#EEEEEE" align="center">다음글</td>
					    <td width="520" align="left" style="padding-left:10px;" colspan="3">
							<c:if test="${not empty nextReadDto }">
							     <a href="<%=cp%>/board/article.do?${params}&boardNum=${nextReadDto.boardNum}">${nextReadDto.subject}</a>
							</c:if>
					    </td>
					</tr>
					<tr><td colspan="4" height="3" bgcolor="#507CD1" align="center"></td></tr>
					</table>
					
					<table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
					<tr height="35">
					    <td width="50%" align="left">
					          <input type="image" src="<%=cp%>/res/images/btn_reply.gif" onclick="javascript:location.href='<%=cp%>/board/reply.do?boardNum=${dto.boardNum}&page=${page}';">
					          
					          <c:if test="${sessionScope.member.userId==dto.userId}">
					              <input type="image" src="<%=cp%>/res/images/btn_modify.gif" onclick="updateBoard();">
					          </c:if>
					          <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
					              <input type="image" src="<%=cp%>/res/images/btn_delete.gif" onclick="deleteBoard();">
					          </c:if>
					    </td>
					
					    <td align="right">
					           <input type="image"  src="<%=cp%>/res/images/btn_list.gif" onclick="javascript:location.href='<%=cp%>/board/list.do?${params}';">
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