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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>배달의 나라</title>

<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>
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

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
<c:if test="${sessionScope.member.userId=='admin'}">
function deleteNotice(num) {
	if(confirm("게시물을 삭제 하시겠습니까 ?")) {
		var url="<%=cp%>/notice/delete.do?num="+num;
		url+="&page=${page}";
		location.href=url;
	}
}
</c:if>
</script>

</head>
<body>

<div>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

<div class="container">
		<ul class="nav nav-tabs nav-justified">
			<li class="active"><a href="<%=cp%>/notice/notice.do"
				data-toggle="tab">공지사항</a></li>
			<li><a href="<%=cp%>/freeboard/freeboard.do" data-toggle="tab">자유게시판</a></li>
			<li><a href="<%=cp%>/qna/qna.do" data-toggle="tab">질문과답변</a></li>
			<li><a href="<%=cp%>/faq/faq.do" data-toggle="tab">자주묻는질문</a></li>
		</ul>
		
		<div class="tab-content">
			<div class="tab-pane active" id="notice">
				<div class="bodyFrame col-sm-10" style="float: none; margin: 30px auto;">
					<div class="body-title">
						<h3><span class="glyphicon glyphicon-book"></span>공지사항</h3>
					</div>
					
					<div class="alert alert-info">
						<i class="glyphicon glyphicon-pencil"> 배달의 나라의 중요한 이벤트와 공지사항을 확인 하세요!!</i>
					</div>
	    
	    <div class="table-responsive" style="clear: both;">
	        <div class="bbs-article">
	            <table class="table">
	                 <thead>
	                     <tr>
	                         <th colspan="2" style="text-align: center;">
	                              	${dto.subject}
	                         </th>
	                     </tr>
	                </thead>
	                 <tbody>
	                     <tr>
	                         <td style="text-align: left;">
	                             	이름 : ${dto.userName }
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
		                        <span style="display: inline-block; min-width: 45px;">첨부</span> :
		                        <c:if test="${not empty dto.saveFilename }">
		                        	<a href="<%=cp %>/notice/download.do?num=${dto.num}">${dto.originalFilename}</a>
		                        </c:if>
		                  </td>
		               </tr>
	                     <tr>
	                         <td colspan="2">
	                              <span style="display: inline-block; min-width: 45px;">이전글</span> :
	                              <c:if test="${not empty preReadDto }">
	                              	<a href="<%=cp%>/notice/article.do?${params}&num=${preReadDto.num}">${preReadDto.subject}</a>
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
								      <a href="<%=cp%>/notice/article.do?${params}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
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
	                		                    onclick="javascript:location.href='<%=cp%>/notice/update.do?num=${dto.num}&page=${page}';">수정</button>
	                		    </c:if>
		                        <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">    
	                		        <button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteNotice('${dto.num}');">삭제</button>
	                		    </c:if>
	                		</td>
	                		<td align="right">
	                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/notice/notice.do?${params}';"> 목록으로 </button>
	                		</td>
	                	</tr>
	                </tfoot>
	            </table>
	       </div>
	   </div>
	</div>
	</div>	
    </div>
</div>

<div>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>


</body>
</html>