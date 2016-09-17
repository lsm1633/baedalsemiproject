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
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css"
	type="text/css" />

<script type="text/javascript"
	src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>

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
							<div style="float: left;">데이터 개수(현재페이지/전체페이지)</div>
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
									<tr>
										<td class="text-center">1</td>
										<td>테스트</td>
										<td class="text-center">홍길동</td>
										<td class="text-center">2016-09-16</td>
										<td class="text-center">1</td>
										<td class="text-center">첨부파일</td>
								</tr>
								</tbody>
							</table>
						</div>
						
						<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
							1 2 3 .. 
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
	        		        <button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/notice/created.do';"><span class="glyphicon glyphicon glyphicon-pencil"></span> 글쓰기</button>
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