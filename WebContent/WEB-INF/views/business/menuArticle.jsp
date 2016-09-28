<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
<title>메뉴</title>

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

<script type="text/javascript"
	src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
function updatePhoto(num) {
	<c:if test="${sessionScope.ceomember.ceoId==dto.ceoId}">
	     var url="<%=cp%>/storeMenu/update.do?num="+num+"&page=${page}";
	     location.href=url;
	</c:if>
}

function deletePhoto(num) {
	<c:if test="${sessionScope.ceomember.ceoId==dto.ceoId || sessionScope.ceomember.ceoId=='admin'}">
         if(confirm("게시물을 삭제 하시겠습니까 ?")) {
        	 var url="<%=cp%>/storeMenu/delete.do?num="+num+"&page=${page}";
        	 location.href=url;
         }	
	</c:if>
}
</script>
</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp"></jsp:include>
	</div>

	<div class="container" role="main">
		<div class="bodyFrame col-sm-10"
			style="float: none; margin-left: auto; margin-right: auto;">
			<ul class="nav nav-tabs nav-justified">
				<li class="active"><a href="<%=cp%>/storeMenu/menu.do">메뉴관리</a></li>
				<li><a href="<%=cp%>/ceomember/storeInfo.do">점포정보</a></li>
			</ul>

			<div class="body-title">
				<h3 align="left">
					<span class="glyphicon glyphicon-th"></span> 메뉴관리
				</h3>
			</div>

			<div class="table-responsive" style="clear: both;">
				<div class="bbs-article">
					<table class="table">
						<thead>
							<tr>
								<th colspan="2" style="text-align: center;">${dto.name}</th>
							</tr>
						<thead>
						<tbody>
							<tr>
								<td style="text-align: left;">카테고리 : ${dto.cate}
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 가격 : ${dto.price}원</td>

								<td style="text-align: right;">${dto.created}</td>
							</tr>
							<tr style="border-bottom: none;">
								<td colspan="2"><img
									src="<%=cp%>/uploads/${dto.ceoId}/menu/${dto.imageFilename}"
									style="max-width: 100%; height: auto; resize: both;"></td>
							</tr>
							<tr>
								<td colspan="2" style="min-height: 30px;">${dto.content}</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td><c:if test="${sessionScope.ceomember.ceoId==dto.ceoId}">
										<button type="button" class="btn btn-default btn-sm  cbtn"
											onclick="updatePhoto(${dto.num});">수정</button>
									</c:if>&nbsp;&nbsp;&nbsp;<c:if
										test="${sessionScope.ceomember.ceoId==dto.ceoId || sessionScope.ceomember.ceoId=='admin'}">
										<button type="button" class="btn btn-default btn-sm  cbtn"
											onclick="deletePhoto(${dto.num});">삭제</button>
									</c:if></td>
								<td align="right">
									<button type="button" class="btn btn-default btn-sm cbtn"
										onclick="javascript:location.href='<%=cp%>/storeMenu/menu.do?page=${page}';">
										목록으로</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>


	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp"></jsp:include>
	</div>

	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>