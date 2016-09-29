<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문확인 상세</title>
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
	padding:0px 0px 0px 5px; 
	width:70px; height: 25px; 
	line-height: 25px;
	text-align:center;
	border: 0; 
	outline:0; 
	color: #FFFFFF; 
	background: DarkTurquoise;
	cursor: pointer; 
	border-radius: 3px;
}

.cbtn:hover {
	background: tomato;
	color: #FFFFFF;
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
			<li><a href="<%=cp%>/ceomoney/orderConfirm.do">주문확인</a></li>
			<li><a href="<%=cp%>/ceomoney/ceomoney.do">정산내역</a></li>
		</ul>

		<div class="body-title">
			<h3 align="left">주문내역 상세</h3>
		</div>
		<hr>
	
			<div id=formbody>
				<div id=item>
					<% /*항목 컬럼 레이아웃 */ %>
					<dl class=row01 style="border-top: 3px solid DarkSlateGrey;">
						<dd>메뉴 이름</dd>
						<dd>가&nbsp;&nbsp;격</dd>
						<dd>주&nbsp;&nbsp;소</dd>
						<dd>연락처</dd>
						<dd>주문일시</dd>
						<dd>결제수단</dd>
						<dd style="border-bottom: 1px solid silver;">요청사항</dd>
					</dl>
				</div>


				<div id=input>
					<% /* 주문상세정보 표시부 */ %>
					<dl class=row02 style="border-top: 3px solid DarkSlateGrey;">

						<dd>
							<% /* 메뉴명 */ %>
							${dto.menuName}
						</dd>

						<dd>
							<% /* 가격 */ %>
							${dto.price}원
						</dd>

						<dd>
							<% /* 주문자 주소 */ %>
							${dto.adrress}
						</dd>

						<dd>
							<% /* 주문자 연락처 */ %>
							${dto.tel}
						</dd>

						<dd>
							<% /* 주문일시 */ %>
							${dto.created}
						</dd>

						<dd>
							<% /* 결제수단 */ %>
							${dto.payment}
						</dd>

						<dd style="border-bottom: 1px solid silver;">
							<% /* 요청사항 */ %>
							${dto.coment}
						</dd>

					</dl>
				</div>

				<div id=footer>
					<input type="button" name="complete_btn" class="cbtn"
						value="돌아가기 "
						onclick="javascript:location.href='<%=cp%>/ceomoney/orderConfirm.do';">
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
