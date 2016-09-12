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
<title>사장님 회원가입</title>
<script type="text/javascript">
function setEmail() {
	selectEmail.email02.value=selectEmail.getEmail.value;
}


</script>
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
	height: 755px;
	background: #DCDCDC;
	font-size: 13pt;
	font-weight: 500;
	text-align: center;
}

#item {
	float: left;
	width: 200px;
	height: 770px;
	font-size: 10pt;
	font-weight: 500;
	text-align: center;
}

#input {
	float: left;
	width: 600px;
	height: 77px;
	font-size: 10pt;
}

#footer {
	clear: both;
	width: 1000px;
	height: 100px;
	text-align: center;
}

#personal {
	height:300px; line-height: 300px;
	margin: 0px; padding: 0px;
}

#myStore {
	height:200px; line-height: 200px;
	margin: 0px; padding: 0px;
}

#accountInfo {
	height:250px; line-height: 250px;
	margin: 0px; padding: 0px;
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
padding:0px;
	width:250px; height: 50px;
	font-size:13pt;
	line-height: 50px;
	border: 0;
	outline:0;
	color: #FFFFFF;
	background: DarkTurquoise;
	cursor: pointer;
}

.cbtn:hover {
	background: tomato;
	color:#FFFFFF;
}

.chBtn {
	width: 70px; height: 35px;
	line-height: 35px;
	padding:0px;
	border: 1px solid SlateGray ;
	outline: 0;
	color: SlateGray ;
	background: #FFFFFF;
	cursor: pointer;
}

.chBtn:hover {
	background: royalblue;
	color:#FFFFFF;
}

input {
	height: 35px;
	border: 1px solid silver;
	padding: 0px 0px 0px 10px;
	border-radius: 3px;
	outline-color: SlateGray ;
}

select {
	width: 100px;
	height: 35px;
}

</style>
</head>
<body>
<div>
<dl style="height: 150px">
    <dd>
      <jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp"/>
    </dd>
  </dl>
</div>

<div>
<div id=header>사장님 회원가입</div>
	<div id=formbody>
		<div id=category>
		<%/*항목 카테고리 컬럼 레이아웃 */%>
		 	<dl class=row01 style="border-top: 3px solid DarkSlateGrey ;">
		 		<dd id=personal>사장님 정보</dd>
		 		<dd id=myStore>내 업소 정보</dd>
		 		<dd id=accountInfo>계정 정보</dd> 		
		 	</dl>
		</div>
		
		<div id=item>
		<%/*항목 컬럼 레이아웃 */%>	
			<dl class=row02 style="border-top: 3px solid DarkSlateGrey ;">
		 		<dd></dd>
		 		<dd>사장님 성함</dd>
		 		<dd>휴대폰 번호</dd>
		 		<dd>생년월일</dd>
		 		<dd>이메일 주소</dd>
		 		<dd style="border-bottom: 1px solid silver;"></dd>
		 		
		 		<dd></dd>
		 		<dd>사업자 등록번호</dd>
		 		<dd>사업자 등록증 첨부</dd>
		 		<dd style="border-bottom: 1px solid silver;"></dd>
		 		
		 		<dd></dd>
		 		<dd>아이디</dd>
		 		<dd>비밀번호 입력</dd>
		 		<dd>비밀번호 확인</dd>
		 		<dd style="border-bottom: 1px solid silver;"></dd>		 		
		 	</dl>		
		</div>
		
		
		<div id=input>
		<%/* 입력란 레이아웃 */%>
			<dl class=row03 style="border-top: 3px solid DarkSlateGrey ;">
		 		<dd></dd>
		 		<dd>
		 			<%/* 사장성명 */%>	 			
		 			<input type="text" name="businessName" size="28">		 			
		 		</dd>
		 				 		
		 		<dd>
		 			<%/* 전화번호 */%>
		 			<select name="idNum">
		 				<option value="010" selected="selected">010&nbsp;&nbsp;</option>
		 				<option value="011">011</option>
		 				<option value="016">016</option>
		 				<option value="017">017</option>
		 				<option value="018">018</option>
		 				<option value="019">019</option>		 			
		 			</select>&nbsp;
		 			<input type="text" name="phoneNum01" size="11" maxlength="4">&nbsp;
		 			<input type="text" name="phoneNum02" size="11" maxlength="4">&nbsp;
		 			
		 		</dd>
		 		
		 		<dd>
		 			<%/* 생년월일 */%>
		 			<select name="birthYear">
		 				<option value="" selected="selected">연도&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="1924" end="2015" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>	 			
		 			</select>&nbsp;
		 			
		 			<select name="birthMonth">
		 				<option value="" selected="selected">월&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="11" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>		 						 			
		 			</select>&nbsp;
		 			
		 			<select name="birthDay">
		 				<option value="" selected="selected">일&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="30" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>		 			
		 			</select>&nbsp;
		 		</dd>
		 		
		 		<dd>
		 			<%/* 이메일 */%>	 			 
		 			<form name="selectEmail">	
						<input type="text" name="email01">&nbsp;@&nbsp;
						<input type="text" name="email02">
		 				<select name="getEmail" onchange="setEmail()">
							<option value="" selected="selected">직접입력&nbsp;&nbsp;</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="hotmail.com">hotmail.com</option>
						</select> 
					</form>
				</dd>
		 		
		 		<dd style="border-bottom: 1px solid silver;"></dd>
		 		
		 		
		 		<dd></dd>
		 		<dd>
		 			<%/* 사업자등록번호 */%> 			
					<input type="text" name="businessNum" size="40">&nbsp;
					<input type="button" name="check_bNum" class="chBtn" value=" 중복확인 ">
					
				</dd>
		 		
		 		<dd>
		 			<%/* 사업자등록증 첨부 */%>
		 			<input type="text" name="licenceUpload" size="40">&nbsp;
					<input type="button" name="check_bNum" class="chBtn" value=" 첨부하기 ">
				</dd>
		 		
		 		<dd style="border-bottom: 1px solid silver;"></dd>
		 		
		 				 		
		 		<dd></dd>
		 		<dd>
		 			<%/* 아이디 */%>
		 			<input type="text" name="userId" size="35" maxlength="20"
		 				placeholder="띄어쓰기 없이 영문자나 숫자 4~20자">&nbsp;
					<input type="button" name="check_bNum" class="chBtn" value=" 중복확인 ">					
				</dd>
				
		 		<dd>
		 			<%/* 비밀번호 */%>
		 			<input type="password" name="userPwd" size="35" maxlength="20"
		 				placeholder="띄어쓰기 없이 6~20자">		 			
		 		</dd>
		 		
		 		<dd>
		 			<%/* 비밀번호 확인 */%>
		 			<input type="password" name="userPwd" size="35" maxlength="20"
		 				placeholder="위 비밀번호를 한번 더 입력해 주세요">
		 		</dd>
		 		
		 		<dd style="border-bottom: 1px solid silver;"></dd>			 		
		 	</dl>
		</div>
		<div id=footer>
			<br>
			<input type="submit" name="complete_btn" class="cbtn" value=" 가입완료 ">
		</div>
	</div>
</div>

<div align="center">
<dl style="height: 140px">
    <dd>
      <jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp"/>
    </dd>
  </dl>
</div>



</body>
</html>