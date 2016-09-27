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

<link rel="stylesheet"
	href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet"
	href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css"
	type="text/css" />

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css"
	type="text/css" />

<script type="text/javascript"
	src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>


<script type="text/javascript">
function searchFreeboard() {
	var f=document.freeboardForm;
	f.action="<%=cp%>/freeboard/freeboard.do";
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
			<li><a href="<%=cp%>/notice/notice.do" data-toggle="tab">공지사항</a></li>
			<li class="active"><a href="<%=cp%>/freeboard/freeboard.do"
				data-toggle="tab">자유게시판</a></li>
			<li><a href="<%=cp%>/qna/qna.do" data-toggle="tab">질문과답변</a></li>
			<li><a href="<%=cp%>/faq/faq.do" data-toggle="tab">자주묻는질문</a></li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane active" id="freeboard">
				<div class="bodyFrame col-sm-10"
					style="float: none; margin: 30px auto;">

					<div class="body-title">
						<h3>
							<span class="glyphicon glyphicon-book"></span>자유 게시판
						</h3>
					</div>

					<div class="alert alert-info">
						<i class="glyphicon glyphicon-pencil"> 욕설은 삼가해주세요!!</i>
					</div>


					<div>
						<div style="clear: both; height: 25px; line-height: 25px">
							<div style="float: left;">${dataCount}개(${page}/${total_page}
								페이지)</div>
							<div style="float: right;">&nbsp;</div>
						</div>



						<table class="table table-hover">
							<thead>
								<tr>
									<th class="text-center" style="width: 70px;">번호</th>
									<th>제목</th>
									<th class="text-center" style="width: 100px;">글쓴이</th>
									<th class="text-center" style="width: 100px;">날짜</th>
									<th class="text-center" style="width: 70px;">조회수</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="dto" items="${list}">
									<tr>
										<td class="text-center">${dto.listNum}</td>
										<td><c:forEach var="n" begin="1" end="${dto.depth}">
	                                &nbsp;&nbsp;
	                            </c:forEach> <c:if test="${dto.depth!=0}">
												<img src='<%=cp%>/res/images/re.gif'>
											</c:if> <a href='${articleUrl}&boardNum=${dto.boardNum}'>${dto.subject}</a>
											<c:if test="${dto.gap < 1}">
												<img src='<%=cp%>/res/images/new.gif'>
											</c:if></td>
										<td align="center">${dto.userName}</td>
										<td align="center">${dto.created}</td>
										<td align="center">${dto.hitCount}</td>
									</tr>
								</c:forEach>
						</table>


						<div class="paging"
							style="text-align: center; min-height: 50px; line-height: 50px;">
							<c:if test="${dataCount==0 }">
			                                          등록된 게시물이 없습니다.
			                </c:if>
							<c:if test="${dataCount!=0 }">
			                    ${paging}
			                </c:if>
						</div>


						<div style="clear: both;">
							<div style="float: left; width: 20%; min-width: 85px;">
								<button type="button" class="btn btn-default btn-sm wbtn"
									onclick="javascript:location.href='<%=cp%>/freeboard/freeboard.do';">새로고침</button>
							</div>
							<div style="float: left; width: 60%; text-align: center;">
								<form name="freeboardForm" method="post" class="form-inline">
									<select class="form-control input-sm" name="searchKey">
										<option value="subject">제목</option>
										<option value="userName">작성자</option>
										<option value="content">내용</option>
										<option value="created">등록일</option>
									</select> <input type="text" class="form-control input-sm input-search"
										name="searchValue">
									<button type="button" class="btn btn-info btn-sm btn-search"
										onclick="searchFreeboard();">
										<span class="glyphicon glyphicon-search"></span> 검색
									</button>
								</form>
							</div>
							<div
								style="float: left; width: 20%; min-width: 85px; text-align: right;">

								<button type="button" class="btn btn-primary btn-sm bbtn"
									onclick="javascript:location.href='<%=cp%>/freeboard/created.do';">
									<span class="glyphicon glyphicon glyphicon-pencil"></span> 글쓰기
								</button>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>