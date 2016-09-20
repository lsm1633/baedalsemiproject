<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점포 관리</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	font-family: Malgun Gothic, NanumGothic;
}

#header {
	width: 750px;
	height: 100px;
	margin: 15px auto;
	font-size: 20pt;
	line-height: 100px;
}

#formbody {
	width: 750px;
	margin: 0px auto;
}


#item {
	float: left;
	width: 149px; height: 410px;	
	background: #DCDCDC;
	font-size: 10pt;
	font-weight: bold;
	text-align: left;
}

#info {
	float: left;
	width: 600px;
	height: 400px;
	font-size: 10pt;
}

#footer {
	clear: both;
	width: 750px;
	text-align: center;
}

.row01 dd {
	height: 50px;
	border-right: 1px solid silver;
	border-bottom: 1px solid silver;
	text-align:center;
	line-height: 50px;
}

.row02 dd {
	height: 50px;
	padding: 0px 0px 0px 20px;
	border-bottom: 1px solid silver;
	line-height: 50px;
}

.completeBtn {
padding:0px;
	width:100px; height: 40px;
	font-size:13pt;
	line-height: 40px;
	border: 0;
	outline:0;
	border-radius: 3px;
	color: #FFFFFF;
	background: DarkTurquoise;
	cursor: pointer;
}

.completeBtn:hover {
	background: tomato;
	color:#FFFFFF;
}

.cancelBtn {
	width: 100px; height: 40px;
	font-size: 13pt;
	line-height: 40px;
	padding:0px;
	border: 0;
	outline: 0;
	border-radius: 3px;
	color: #FFFFFF;
	background: Slategrey;
	cursor: pointer;
}

.cancelBtn:hover {
	background: tomato;
	color:#FFFFFF;
}

</style>
</head>

<div>
<div id=header>점포 정보 관리</div>
	<div id=formbody>
		<div id=item>
		<%/*항목 컬럼 레이아웃 */%>	
			<dl class=row01 style="border-top: 2px solid DarkSlateGrey ;">
		 		<dd>주&nbsp;&nbsp;&nbsp;&nbsp;소</dd>
		 		<dd>전화번호</dd>
		 		<dd>영업시간</dd>
		 		<dd>휴무일</dd>		 		
		 		<dd>카드사용여부</dd>
		 		<dd>배달지역</dd>
		 		<dd>메&nbsp;&nbsp;&nbsp;&nbsp;뉴</dd>
		 		<dd>기타정보</dd>			 		
		 	</dl>		
		</div>
		
		
		<div id=info>
		<%/* 정보출력 레이아웃 */%>
			<dl class=row02 style="border-top: 2px solid DarkSlateGrey ;">
		 		<dd>서울시 여러분</dd>
		 		<dd>070-8262-9104</dd>
		 		<dd>오후 11시 59분 ~ 오전 12시 1분</dd>
		 		<dd>2016년 1월 1일 ~ 2016년 12월 31일</dd>
		 		<dd>카드사용문의</dd>
		 		<dd>한강</dd>
		 		<dd class="menu">탕수육, 군만두</dd>
		 		<dd>카드 안받음(탈세왕)</dd>			 		
		 	</dl>
		</div>
		<div id=footer>
			<br>
			<input type="button" name="completeBtn" class="completeBtn" 
				onclick="javascript:location.href='<%/* business_info_modify.jsp 경로 */%>';"
				value=" 수정 ">&nbsp;&nbsp;
			<input type="button" name="cancelBtn" class="cancelBtn" value=" 취소 ">
		</div>
	</div>
</div>

</body>
</html>