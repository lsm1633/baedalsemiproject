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


//-- 댓글 ------------------------------------
function login() {
	location.href="<%=cp%>/member/login.do";
}

//댓글 리스트
$(function(){
	listPage(1);
});

function listPage(page) {
	var url="<%=cp%>/freeboard/listReply.do";
	var boardNum="${dto.boardNum}";
	$.post(url, {boardNum:boardNum, pageNo:page}, function(data){
		$("#listReply").html(data);
	});
}

//리플 저장
function sendReply() {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		login();
		return false;
	}

	var boardNum="${dto.boardNum}"; // 해당 게시물 번호
	var content=$.trim($("#content").val());
	if(! content ) {
		alert("내용을 입력하세요 !!! ");
		$("#content").focus();
		return false;
	}
	
	var params="boardNum="+boardNum;
	params+="&content="+content;
	
	$.ajax({
		type:"POST"
		,url:"<%=cp%>/freeboard/insertReply.do"
		,data:params
		,dataType:"json"
		,success:function(data) {
			$("#content").val("");
			
			var state=data.state;
			if(state=="true") {
				listPage(1);
			} else if(state=="false") {
				alert("댓글을 등록하지 못했습니다. !!!");
			} else if(state=="loginFail") {
				login();
			}
		}
		,error:function(e) {
			alert(e.responseText);
		}
	});
}

//리플 삭제
function deleteReply(replyNum, pageNo, userId) {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		login();
		return false;
	}
	
	if(confirm("게시물을 삭제하시겠습니까 ? ")) {	
		var url="<%=cp%>/freeboard/deleteReply.do";
		$.post(url, {replyNum:replyNum, userId:userId}, function(data){
		        var state=data.state;
				if(state=="loginFail") {
					login();
				} else {
					listPage(pageNo);
				}
		}, "json");
	}
}

</script>


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


					<div class="table-responsive" style="clear: both; overflow: visible;">
						<div class="bbs-article">

							<table class="table">
								<thead>
									<tr>
										<th colspan="2" style="text-align: center;"><c:if
												test="${dto.depth!=0}">
	                              [Re]
	                         </c:if> ${dto.subject}</th>
									</tr>
								</thead>



								<tbody>
									<tr>
										<td style="text-align: left;">이름 : ${dto.userName}</td>
										<td style="text-align: right;">${dto.created }<i></i>조회 :
											${dto.hitCount }
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 230px;">${dto.content }</td>
									</tr>


									<tr>
										<td colspan="2"><span
											style="display: inline-block; min-width: 45px;">이전글</span> :
											<c:if test="${not empty preReadDto }">
												<a
													href="<%=cp%>/freeboard/article.do?${params}&boardNum=${preReadDto.boardNum}">${preReadDto.subject}</a>
											</c:if> <c:if test="${! not empty preReadDto }">
	                           	 등록된 게시물이 없습니다.
	                            </c:if></td>
									</tr>

									<tr>
										<td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
											<span style="display: inline-block; min-width: 45px;">다음글</span>
											: <c:if test="${not empty nextReadDto }">
												<a
													href="<%=cp%>/freeboard/article.do?${params}&boardNum=${nextReadDto.boardNum}">${nextReadDto.subject}</a>
											</c:if> <c:if test="${! not empty nextReadDto }">
	                          	 등록된 게시물이 없습니다.	
	                           </c:if>
										</td>
									</tr>
								</tbody>


								<tfoot>
									<tr>
										<td>

											<button type="button" class="btn btn-default btn-sm wbtn"
												onclick="javascript:location.href='<%=cp%>/freeboard/reply.do?boardNum=${dto.boardNum}&page=${page}';">답변</button>
											<c:if test="${sessionScope.member.userId==dto.userId}">
												<button type="button" class="btn btn-default btn-sm wbtn"
													onclick="javascript:location.href='<%=cp%>/freeboard/update.do?boardNum=${dto.boardNum}&page=${page}';">수정</button>
											</c:if> <c:if test="${sessionScope.member.userId==dto.userId}">
												<button type="button" class="btn btn-default btn-sm wbtn"
													onclick="deleteBoard('${dto.boardNum}');">삭제</button>
											</c:if>

										</td>
										<td align="right">
											<button type="button" class="btn btn-default btn-sm wbtn"
												onclick="javascript:location.href='<%=cp%>/freeboard/freeboard.do?${params}';">
												목록으로</button>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>

						<div class="bbs-reply">
							<div class="bbs-reply-write">
								<div style="clear: both;">
									<div style="float: left;">
										<span style="font-weight: bold;">댓글쓰기</span><span> -
											타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
									</div>
									<div style="float: right; text-align: right;"></div>
								</div>
								<div style="clear: both; padding-top: 10px;">
									<textarea id="content" class="form-control" rows="3"
										required="required"></textarea>
								</div>
								<div style="text-align: right; padding-top: 10px;">
									<button type="button" class="btn btn-primary btn-sm"
										onclick="sendReply();">
										댓글등록 <span class="glyphicon glyphicon-ok"></span>
									</button>
								</div>
							</div>
							
							<div id="listReply"></div>
<%-- 
							<div>
								<jsp:include page="/WEB-INF/views/freeboard/listReply.jsp"></jsp:include>
							</div>
 --%>

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