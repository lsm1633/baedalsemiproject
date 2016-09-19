<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>배달의 나라</title>
<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css" />

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css" />

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
function searchList() {
		var f = document.searchForm;
		f.action = "<%=cp %>/notice/notice.do";
		f.submit();
	}
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
					
					<div>
						<div style="clear: both; height: 25px; line-height: 25px">
							<div style="float: left;">${dataCount}개(${page}/${total_page} 페이지)</div>
							<div style="float: right;">&nbsp;</div>
						</div>
						
						<div class="table-responsive" style="clear: both;">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="text-center" style="width: 70px;">번호</th>
	                        			<th >제목</th>
	                        			<th class="text-center" style="width: 100px;">글쓴이</th>
	                       				<th class="text-center" style="width: 100px;">날짜</th>
	                       				<th class="text-center" style="width: 70px;">조회수</th> 
										<th class="text-center" style="width: 50px;">첨부</th>
									</tr>
								</thead>
								<tbody>
					<c:forEach var="dto" items="${listNotice}">
	                    <tr>
                            <td class="text-center"><span style="display: inline-block;width: 28px;height:18px;line-height:18px; background: #ED4C00;color: #FFFFFF">공지</span></td>
                            <td><a href="${articleUrl}&num=${dto.num}">${dto.subject}</a></td>
                            <td class="text-center">${dto.userName}</td>
                            <td class="text-center">${dto.created}</td>
                            <td class="text-center">${dto.hitCount}</td>
							<td class="text-center">
							      <c:if test="${not empty dto.saveFilename}">
							          <a href="<%=cp%>/notice/download.do?num=${dto.num}"><img src="<%=cp%>/res/images/disk.gif" border="0" style="margin-top: 1px;"></a>
							      </c:if>
                            </td>
	                    </tr>
    			  </c:forEach>
    			  <c:forEach var="dto" items="${list}">
						<tr>
							<td class="text-center">${dto.listNum}</td>
							<td>
								<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
									<c:if test="${dto.gap < 1}">
										<img alt="" src="<%=cp%>/res/images/new.gif">
									</c:if>
							</td>
							<td class="text-center">${dto.userName}</td>
							<td class="text-center">${dto.created}</td>
							<td class="text-center">${dto.hitCount}</td>
							<td class="text-center">
								<c:if test="${not empty dto.saveFilename}">
									<a href="<%=cp%>/notice/download.do?num=${dto.num}"><img src="<%=cp%>/res/images/disk.gif" border="0" style="margin-top: 1px;"></a>
								</c:if>
							</td>
						</tr>
    			  </c:forEach>
								</tbody>
							</table>
						</div>
						
						<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
							<c:if test="${dataCount==0 }">
			                  	 등록된 게시물이 없습니다.
			        		</c:if>
			       			<c:if test="${dataCount!=0 }">
			             	  ${paging}
			        		</c:if>
						</div>
						
						 <div style="clear: both;">
	        				<div style="float: left; width: 20%; min-width: 85px;">
	        		   		 	<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/notice/notice.do';">새로고침</button>
	        				</div>
	        				<div style="float: left; width: 60%; text-align: center;">
	        		     		<form name="searchForm" method="post" class="form-inline">
							  		<select class="form-control input-sm" name="searchKey" >
							     		 <option value="subject">제목</option>
							     		 <option value="userName">작성자</option>
							      		 <option value="content">내용</option>
							      		 <option value="created">등록일</option>
							 		 </select>
							  		<input type="text" class="form-control input-sm input-search" name="searchValue">
							 		<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"><span class="glyphicon glyphicon-search"></span> 검색</button>
	        		    		 </form>
	        				</div>
	        				<div style="float: left; width: 20%; min-width: 85px; text-align: right;">
	        				 <c:if test="${sessionScope.member.userId=='admin'}">
	        		        	<button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/notice/created.do';"><span class="glyphicon glyphicon glyphicon-pencil"></span> 글쓰기</button>
	        				 </c:if>
	        			</div>
					</div>
				</div>
			</div>
		</div>

		<div>
			<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
		</div>
	</div>
	</div>


</body>
</html>