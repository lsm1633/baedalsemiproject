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

<style type="text/css">
.bbs-article .table {
    margin-top: 15px;
}
.bbs-article .table thead tr, .bbs-article .table tbody tr {
    height: 30px;
}
.bbs-article .table thead tr th, .bbs-article .table tbody tr td {
    font-weight: normal;
    border-top: none;
    border-bottom: none;
}
.bbs-article .table thead tr {
    border-top: #d5d5d5 solid 1px;
    border-bottom: #dfdfdf solid 1px;
} 
.bbs-article .table tbody tr {
    border-bottom: #dfdfdf solid 1px;
}
.bbs-article .table i {
    background: #424951;
    display: inline-block;
    margin: 0 7px 0 7px;
    position: relative;
    top: 2px;
    width: 1px;
    height: 13px;    
}
</style>



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
				
				
				<div class="table-responsive" style="clear: both;">
				   <div class="bbs-article">
				   			
					<table class="table">
					  <thead>
					   <tr>
					    <th colspan="2" style="text-align: center;">
						     <c:if test="${dto.depth!=0}">
	                              [Re]
	                         </c:if>
	                         ${dto.subject}
					    </th>
					 </tr>
					</thead>
				
				
				
					<tbody>
					<tr>
					    <td style="text-align: left;">
					                이름 : ${dto.userName}
					    </td>
					    <td style="text-align: right;">
	                          ${dto.created } <i></i>조회 : ${dto.hitCount }
	                     </td>
					</tr>
					<tr>
	                         <td colspan="2" style="height: 230px;">
	                        	      ${dto.content }
	                         </td>
	                </tr>
					
					
					<tr>
	                       <td colspan="2">
	                            <span style="display: inline-block; min-width: 45px;">이전글</span> :
	                            <c:if test="${not empty preReadDto }">
	                            	<a href="<%=cp%>/freeboard/article.do?${params}&boardNum=${preReadDto.boardNum}">${preReadDto.subject}</a>
	                            </c:if>
	                            <c:if test="${! not empty preReadDto }">
	                           	 등록된 게시물이 없습니다.
	                            </c:if>
	                       </td>
	                </tr>
								
					<tr>
	                      <td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
	                           <span style="display: inline-block; min-width: 45px;">다음글</span> :
	                           <c:if test="${not empty nextReadDto }">
								   <a href="<%=cp%>/freeboard/article.do?${params}&boardNum=${nextReadDto.boardNum}">${nextReadDto.subject}</a>
							    </c:if>
							  <c:if test="${! not empty nextReadDto }">
	                          	 등록된 게시물이 없습니다.
	                           </c:if>
	                      </td>
	                 </tr>
					</tbody>
					
					
					<tfoot>
	                	<tr>
	                		<td>
	                		    <c:if test="${sessionScope.member.userId==dto.userId}">		                		
	                		        <button type="button" class="btn btn-default btn-sm wbtn"
	                		                    onclick="javascript:location.href='<%=cp%>/freeboard/update.do?boardNum=${dto.boardNum}&page=${page}';">수정</button>
	                		    </c:if> 
	                		        <button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteNotice('${dto.boardNum}');">삭제</button>
	                		</td>
	                		<td align="right">
	                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/freeboard/freeboard.do?${params}';"> 목록으로 </button>
	                		</td>
	                	</tr>
	                </tfoot>
		
					
					
					
					</table>
					
				
		       </div>
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