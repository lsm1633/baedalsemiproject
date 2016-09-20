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
<title>점포 관리 수정</title>
<script type="text/javascript">
//객
</script>
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


/*
.menu {
	height: 905px;
	background: #DCDCDC;
	font-size: 13pt;
	font-weight: 500;
	text-align: center;
}*/

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

input {	
	border: 1px solid silver;
	height: 25px;
	padding: 0px 0px 0px 5px;
	border-radius: 3px;
	outline-color: SlateGray ;
}

select {
	border-radius: 3px;
}

input[type="radio"] {
	position: relative;
	background: #FFFFFF;
	top: 8px;
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
		 		<dd>
		 			<%/* 주소 입력 */%>
		 			<select name="province">
		 				<option value=" " selected="selected">시/도&nbsp;&nbsp;</option>
		 				<option value="서울">서울특별시</option>
		 				<option value="부산">부산광역시</option>
		 				<option value="대구">대구광역시</option>
		 				<option value="인천">인천광역시</option>
		 				<option value="대전">대전광역시</option>
		 				<option value="광주">광주광역시</option>
		 				<option value="세종">세종특별자치시</option>		 					 			
		 				<option value="경기">경기도</option>
		 				<option value="강원">강원도</option>
		 				<option value="충남">충청남도</option>
		 				<option value="충북">충청북도</option>
		 				<option value="전남">전라남도</option>
		 				<option value="전북">전라북도</option>
		 				<option value="경남">경상남도</option>
		 				<option value="경북">경상북도</option>
		 				<option value="제주">제주특별자치도</option>
		 			</select>&nbsp;&nbsp;
		 			<input style="text" name="addr" placeholder="구/시/군" size="15">		 		
		 		</dd>
		 		
		 		<dd>
		 			<%/* 전화번호 */%>
		 			<input style="text" name="phoneNum" placeholder="'-'없이 입력">
		 		</dd>
		 		<dd>
		 			<%/* 영업시간 설정 */%>
		 			<select name="start_ampm">
		 				<option value="오전" selected="selected">오전&nbsp;&nbsp;</option>
		 				<option value="오후">오후</option>	 			
		 			</select>&nbsp;		 			
		 			
		 			<select name="starthour">
		 				<option value="" selected="selected">시&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="11" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>	 			
		 			</select>&nbsp;		 		
		 			<select name="startMinute">
		 				<option value="" selected="selected">분&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="58" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>		 						 			
		 			</select>	 			
		 			~
		 			<select name="end_ampm">
		 				<option value="오전" selected="selected">오전&nbsp;&nbsp;</option>
		 				<option value="오후">오후</option>	 			
		 			</select>&nbsp;	
		 			
		 			<select name="endhour">
		 				<option value="" selected="selected">시&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="11" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>	 			
		 			</select>&nbsp;
		 			
		 			<select name="endMinute">
		 				<option value="" selected="selected">분&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="58" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>		 						 			
		 			</select>	 			
		 		</dd>
		 		
		 		<dd>
		 			<%/* 휴무일 설정 */%>		 		
		 			<select name="startYear">
		 				<option value="" selected="selected">연도&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="2015" end="2017" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>	 			
		 			</select>&nbsp;
		 			
		 			<select name="startMonth">
		 				<option value="" selected="selected">월&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="11" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>		 						 			
		 			</select>&nbsp;
		 			
		 			<select name="startDay">
		 				<option value="" selected="selected">일&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="30" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>		 			
		 			</select>
		 			~
		 			<select name="endYear">
		 				<option value="" selected="selected">연도&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="2015" end="2017" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>	 			
		 			</select>&nbsp;
		 			
		 			<select name="endMonth">
		 				<option value="" selected="selected">월&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="11" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>		 						 			
		 			</select>&nbsp;
		 			
		 			<select name="endDay">
		 				<option value="" selected="selected">일&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="30" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>		 			
		 			</select>
		 		</dd>
		 		
		 		<dd>
		 		 	<%/* 카드사용여부 라디오 버튼 */%>
		 			<input type="radio" name="na_card" value="1">&nbsp;카드사용가능&nbsp;&nbsp;
					<input type="radio" name="na_card" value="0">&nbsp;카드사용문의	
		 		</dd>
		 		
		 		<dd>
		 			<%/* 배달지역 */%>
		 			<input type="text" name="dili_zone" size="35">					
				</dd>
		 		
		 		<dd>
		 			<%/* 메뉴표시 */%>		 				
		 			<input type="text" size="20">		 			
		 		</dd>
		 		
		 		<dd>
		 			<%/* 기타 정보 입력란*/%>
		 			<input style="text" name="phoneNum" size="50">
		 		</dd>			 		
		 	</dl>
		</div>
		<div id=footer>
			<br>
			<input type="submit" name="completeBtn" class="completeBtn" 
				onclick="javascript:location.href='<%/* business_info.jsp 경로 */%>';" 
				value=" 수정완료 ">&nbsp;&nbsp;
			<input type="submit" name="cancelBtn" class="cancelBtn" value=" 취소 ">
		</div>
	</div>
</div>

</body>
</html>