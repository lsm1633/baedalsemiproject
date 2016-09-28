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
<title>사장님 정보</title>
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
<link rel="stylesheet" href="<%=cp%>/res/css/layout/mainHover.css"
	type="text/css" />

<script type="text/javascript"
	src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	font-family: Malgun Gothic, NanumGothic;
}

#header {
	width: 1000px;
	height: 100px;
	margin: 15px auto;
	font-size: 20pt;
	line-height: 100px;
}

#formbody {
	width: 1000px;
	margin: 0px auto;
}

#category {
	float: left;
	width: 200px;
	font-size: 13pt;
	font-weight: 500;
	text-align: center;
}

#item {
	float: left;
	width: 200px;
	font-size: 10pt;
	font-weight: 500;
	text-align: center;
}

#input {
	float: left;
	width: 600px;
	font-size: 10pt;
}

#footer {
	clear: both;
	width: 1000px;
	height: 100px;
	text-align: center;
}

#accountInfo {
	height: 250px;
	line-height: 250px;
	background: #DCDCDC;
	margin: 0px;
	padding: 0px;
}

#personal {
	height: 300px;
	line-height: 300px;
	background: #DCDCDC;
	margin: 0px;
	padding: 0px;
}

.row01 dd {
	height: 50px;
	border-bottom: 1px solid silver;
	line-height: 50px;
}

.row02 dd {
	height: 50px;
	line-height: 50px;
}

.row03 dd {
	height: 50px;
	line-height: 50px;
}

.cbtn {
	padding: 0px;
	width: 250px;
	height: 50px;
	font-size: 13pt;
	line-height: 50px;
	border: 0;
	outline: 0;
	color: #FFFFFF;
	background: DarkTurquoise;
	cursor: pointer;
}

.cbtn:hover {
	background: tomato;
	color: #FFFFFF;
}

.chBtn {
	width: 70px;
	height: 35px;
	line-height: 35px;
	padding: 0px;
	border: 1px solid SlateGray;
	outline: 0;
	color: SlateGray;
	background: #FFFFFF;
	cursor: pointer;
}

.chBtn:hover {
	background: royalblue;
	color: #FFFFFF;
}

input {
	height: 35px;
	border: 1px solid silver;
	padding: 0px 0px 0px 10px;
	border-radius: 3px;
	outline-color: SlateGray;
}

select {
	width: 100px;
	height: 35px;
}
</style>
</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp"></jsp:include>
	</div>
	
	<div class="container">
		<form name="ceomemberForm" method="post">
			<div>
				<div id=header>사장님 정보 수정</div>
				<div id=formbody>
					<div id=category>
						<%
							/*항목 카테고리 컬럼 레이아웃 */
						%>
						<dl class=row01 style="border-top: 3px solid DarkSlateGrey;">
							<dd id=accountInfo>계정 정보</dd>
							<dd id=personal>사장님 정보</dd>
						</dl>
					</div>

					<div id=item>
						<%
							/*항목 컬럼 레이아웃 */
						%>
						<dl class=row02 style="border-top: 3px solid DarkSlateGrey;">
							<dd></dd>
							<dd> 아이디</dd>
							<dd>비밀번호 질문</dd>
							<dd>비밀번호 대답</dd>
							<dd style="border-bottom: 1px solid silver;"></dd>

							<dd></dd>
							<dd>사장님 성함</dd>
							<dd>휴대폰 번호</dd>
							<dd>생년월일</dd>
							<dd>이메일 주소</dd>
							<dd style="border-bottom: 1px solid silver;"></dd>

						</dl>
					</div>


					<div id=input>
						<%
							/* 입력란 레이아웃 */
						%>
						<dl class=row03 style="border-top: 3px solid DarkSlateGrey;">
							<dd></dd>
							<dd>
								<%
									/* 사장님 ID */
								%>
								${dto.ceoId}
							</dd>

							<dd>
								<%
									/* 비밀번호 질문 */
								%>
								${dto.askPwd}
							</dd>

							<dd>
								<%
									/* 비밀번호 대답 */
								%>
								${dto.ansPwd}
							</dd>

							<dd style="border-bottom: 1px solid silver;"></dd>

							<dd></dd>
							<dd>
								<%
									/* 사장성명 */
								%>
								${dto.ceoName}
							</dd>

							<dd>
								<%
									/* 전화번호 */
								%>
								${dto.ceoTel}
							</dd>

							<dd>
								<%
									/* 생년월일 */
								%>
								${dto.ceoBirth1}년&nbsp;${dto.ceoBirth2}월&nbsp;${dto.ceoBirth3}일
							</dd>

							<dd>
								<%
									/* 이메일 */
								%>
								${dto.ceoEmail}
							</dd>

							<dd style="border-bottom: 1px solid silver;"></dd>

						</dl>
					</div>


					<div id=footer>
						<br> <input type="button" name="complete_btn" class="cbtn"
							value=" 수정하기 "
							onclick="javascript:location.href='<%=cp%>/ceomember/ceoinfo_update.do';">
						&nbsp; <input type="button" name="complete_btn" class="cbtn"
							value=" 돌아가기 "
							onclick="javascript:location.href='<%=cp%>/ceomain/ceomain.do';">
						&nbsp;
						<input type="button" name="complete_btn" class="chBtn"
							value=" 회원탈퇴 " 
							onclick="javascript:location.href='<%=cp%>/ceomember/quit.do';">
					</div>

				</div>
			</div>
		</form>
	</div>

	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp"></jsp:include>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>