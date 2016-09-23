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
<title>메뉴관리</title>
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

<style type="text/css">
.imgLayout{
	width: 200px;
	height: 260px;
	padding: 5px 5px 5px;
	margin: 5px;
	border: 1px solid #DAD9FF;
	float: left;
}

.name {
     width:190px;
     height:25px;
     line-height:25px;
     margin:5px auto 0px;
     border-top: 1px solid #DAD9FF;
     display: inline-block;
     white-space:nowrap;
     overflow:hidden;
     text-overflow:ellipsis;
     cursor: pointer;
     text-align: center;
}
.price {
     width:190px;
     height:25px;
     line-height:25px;
     margin:5px auto 0px;
     border-top: 1px solid #DAD9FF;
     display: inline-block;
     white-space:nowrap;
     overflow:hidden;
     text-overflow:ellipsis;
     cursor: pointer;
     text-align: center;
}
</style>
<script type="text/javascript">
	function article(num) {
		var url = "${articleUrl}&num=" + num;
		location.href = url;
	}
</script>

</head>
<body>

	<div>
		<dl style="height: 150px">
			<dd>
				<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp" />
			</dd>
		</dl>
	</div>

	<div class="container" role="main">
	 <div class="bodyFrame col-sm-10"  style="float:none; margin-left: auto; margin-right: auto;">
		<ul class="nav nav-tabs nav-justified">
			<li><a href="<%=cp%>/storeMenu/menu.do">메뉴관리</a></li>
			<li><a href="<%=cp%>/business/storeUpdate.do">점포정보수정</a></li>
		</ul>
		

		<div class="body-title">
			<h3 align="left">메뉴관리</h3>
		</div>
		<hr>

		<div style="max-width: 660px; margin: 0px auto;">
			<c:if test="${dataCount!=0 }">

				<div style="clear: both; height: 30px; line-height: 30px;">
					<div style="float: left;">${dataCount}개(${page}/${total_page}
						페이지)</div>
					<div style="float: right;">&nbsp;</div>
				</div>

				<div style="clear: both;">
					<c:forEach var="dto" items="${list}" varStatus="status">
						<c:if test="${status.index==0}">
							<c:out
								value="<div style='clear: both; max-width:660px; margin: 0px auto;'>"
								escapeXml="false" />
						</c:if>
						<c:if test="${status.index!=0 && status.index%3==0}">
							<c:out
								value="</div><div style='clear: both; max-width:660px; margin: 0px auto;'>"
								escapeXml="false" />
						</c:if>
						<div class="imgLayout">
							<img src="<%=cp%>/uploads/${dto.ceoId}/menu/${dto.imageFilename}"
								onclick="javascript:article('${dto.num}');"
								style="width: 190px; height: 190px;" border="0"> <span
								class="name" onclick="javascript:article('${dto.num}');">
								${dto.name} </span>
								<span
								class="price" onclick="javascript:article('${dto.num}');">
								${dto.price}원</span>
						</div>
					</c:forEach>

					<c:set var="n" value="${list.size()}" />
					<c:if test="${n>0&&n%3!=0}">
						<c:forEach var="i" begin="${n%3+1}" end="3" step="1">
							<div class="imgLayout">&nbsp;</div>
						</c:forEach>
					</c:if>

					<c:if test="${n!=0 }">
						<c:out value="</div>" escapeXml="false" />
					</c:if>
				</div>
			</c:if>

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
				<div style="float: left; width: 20%; min-width: 85px;">&nbsp;</div>
				<div style="float: left; width: 60%; text-align: center;">
					&nbsp;</div>
				<div
					style="float: left; width: 20%; min-width: 85px; text-align: right;">
					<button type="button" class="btn btn-primary btn-sm bbtn"
						onclick="javascript:location.href='<%=cp%>/storeMenu/menuCreated.do';">
						<span class="glyphicon glyphicon-th-list"></span> 등록하기
					</button>
				</div>
			</div>
		</div>
	</div>
	</div>


	<div align="center">
		<dl style="height: 140px">
			<dd>
				<jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp" />
			</dd>
		</dl>
	</div>

	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>