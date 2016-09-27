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
<title>점포정보</title>
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
* {
	margin: 0px;
	padding: 0px;
	font-family: Malgun Gothic, NanumGothic;
}

#formbody {
	width: 650px;
	margin: 0px auto;
}

#item {
	float: left;
	width: 149px;
	font-size: 10pt;
	font-weight: bold;
	text-align: left;
}

#input {
	float: left;
	width: 500px;
	font-size: 10pt;
}

#footer {
	clear: both;
	width: 650px;
	height: 50px;
	text-align: center;
}

.row01 dd {
	height: 50px;
	background: #DCDCDC;
	border-right: 1px solid silver;
	border-bottom: 1px solid silver;
	text-align: center;
	line-height: 50px;
}

.row02 dd {
	height: 50px;
	padding: 0px 0px 0px 20px;
	border-bottom: 1px solid silver;
	line-height: 50px;
}

.cbtn {
	padding: 0px auto;
	width: 65px;
	height: 25px;
	line-height: 25px;
	border: 0;
	outline: 0;
	color: #FFFFFF;
	text-align: center;
	background: DarkTurquoise;
	cursor: pointer;
	text-align: cetner;
}

.cbtn:hover {
	background: tomato;
	color: #FFFFFF;
}

.chBtn {
	width: 65px;
	height: 25px;
	line-height: 25px;
	padding: 0px auto;
	border: 1px solid SlateGray;
	outline: 0;
	color: SlateGray;
	text-align: center;
	background: #FFFFFF;
	cursor: pointer;
	text-align: cetner;
}

.chBtn:hover {
	background: royalblue;
	color: #FFFFFF;
}

input {
	border: 1px solid silver;
	height: 25px;
	padding: 0px 0px 0px 5px;
	border-radius: 3px;
	outline-color: SlateGray;
}

select {
	border-radius: 3px;
}
</style>

</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp"></jsp:include>
	</div>

	<div class="container" role="main">
	<div class="bodyFrame col-sm-10"
			style="float: none; margin-left: auto; margin-right: auto;">
		<ul class="nav nav-tabs nav-justified">
			<li><a href="<%=cp%>/storeMenu/menu.do">메뉴관리</a></li>
			<li><a href="<%=cp%>/ceomember/storeInfo.do">점포정보</a></li>
		</ul>

		<div class="body-title">
			<h3 align="left">점포정보</h3>
		</div>
		<hr>


		<form name="storeUpdateForm" method="post"
			enctype="multipart/form-data">
			<div id=formbody>
				<div id=item>
					<%
						/*항목 컬럼 레이아웃 */
					%>
					<dl class=row01 style="border-top: 3px solid DarkSlateGrey;">

						<dd>점포명</dd>
						<dd>사업자 등록번호</dd>
						<dd>점포 주소</dd>
						<dd>점포 전화번호</dd>
						<dd>카테고리</dd>
						<dd style="border-bottom: 1px solid silver;">점포사진</dd>

					</dl>
				</div>


				<div id=input>
					<%
						/* 입력란 레이아웃 */
					%>
					<dl class=row02 style="border-top: 3px solid DarkSlateGrey;">

						<dd>
							<%
								/* 업소명 */
							%>
							${dto.storeName}
						</dd>

						<dd>
							<%
								/* 사업자등록번호 */
							%>
							${dto.ceoCodeNum}
						</dd>

						<dd>
							<%
								/* 점포 주소 */
							%>
							${dto.region}&nbsp;&nbsp;${dto.storeAddr}
						</dd>

						<dd>
							<%
								/* 점포 전화번호 */
							%>
							${dto.storeTel}
						</dd>

						<dd>
							<%
								/* 카테고리 */
							%>
							${dto.storeType}
						</dd>

						<dd style="border-bottom: 1px solid silver;">
							<a href="">${dto.storePhoto}</a>
						</dd>

					</dl>
				</div>




				<div id=footer>
					<input type="button" name="complete_btn" class="cbtn" value="수정하기 "
						onclick="javascript:location.href='<%=cp%>/ceomember/storeUpdate.do';">
					&nbsp;<input type="button" name="complete_btn" class="cbtn"
						value="돌아가기 "
						onclick="javascript:location.href='<%=cp%>/ceomain/ceomain.do';">
				</div>
			</div>
		</form>
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