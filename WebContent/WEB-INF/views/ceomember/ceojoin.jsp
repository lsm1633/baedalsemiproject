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
function chkceoId() {
	var f = document.ceomemberForm;
	var str;
	
	str=f.ceoId.value;
	
	f.action = "<%=cp%>/ceomember/join_idchk.do";
	
	f.submit();
	
}

function chkceoCodeNum() {
	var f = document.ceomemberForm;
	var str;
	
	str = f.ceoCodeNum.value;
	
	f.action = "<%=cp%>/ceomember/join_numchk.do";
	
	f.submit();
}


function ceomemberok() {
	var f = document.ceomemberForm;
	var str;
	
	str=f.ceoId.value;
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.ceoId.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.userId.focus();
		return;
	}
	f.ceoId.value = str;
	
	
	str = f.ceoPwd.value;
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.ceoPwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.ceoPwd.focus();
		return;
	}
	f.ceoPwd.value = str;

	if(str!= f.ceoPwd1.value) {
        alert("패스워드가 일치하지 않습니다. ");
        f.ceoPwd1.focus();
        return;
	}
	
	str = f.askPwd.value;
	if(!str) {
		alert("패스워드 질문을 입력하세요. ");
		f.askPwd.focus();
		return;
	}
	
	str = f.ansPwd.value;
	if(!str) {
		alert("패스워드 대답을 입력하세요. ");
		f.ansPwd.focus();
		return;
	}
	
		
	str = f.ceoName.value;
    if(!str) {
        alert("이름을 입력하세요. ");
        f.ceoName.focus();
        return;
    }
    f.ceoName.value = str;
    
    str = f.ceoTel1.value;
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.ceoTel1.focus();
        return;
    }

    str = f.ceoTel2.value;
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.ceoTel2.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.ceoTel2.focus();
        return;
    }
    
    

    str = f.ceoTel3.value;
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.ceoTel3.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.ceoTel3.focus();
        return;
    }
    
    str = f.ceoBirth1.value;
    if(!str) {
        alert("생년월일를 입력하세요.");
        f.ceoBirth1.focus();
        return;
    }
    
    str = f.ceoBirth2.value;
    if(!str) {
        alert("생년월일를 입력하세요.");
        f.ceoBirth2.focus();
        return;
    }
    
    str = f.ceoBirth3.value;
    if(!str) {
        alert("생년월일를 입력하세요.");
        f.ceoBirth3.focus();
        return;
    }
    
    str = f.ceoEmail1.value;
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.ceoEmail1.focus();
        return;
    }

    str = f.ceoEmail2.value;
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.ceoEmail2.focus();
        return;
    }      
	
    str = f.storeName.value;
    if(!str) {
        alert("가게이름을 입력하세요. ");
        f.storeName.focus();
        return;
    }
    
    str = f.ceoCodeNum.value;
    if(!str) {
        alert("사업자등록번호를 입력하세요. ");
        f.ceoCodeNum.focus();
        return;
    }
    
    str = f.region.value;
    if(!str) {
        alert("지역을 선택하세요. ");
        f.region.focus();
        return;
    }
    
    str = f.storeAddr.value;
    if(!str) {
        alert("가게주소를 입력하세요. ");
        f.storeAddr.focus();
        return;
    }
    
    str = f.storeTel.value;
    if(!str) {
        alert("가게 전화번호를 입력하세요. ");
        f.storeTel.focus();
        return;
    }
    
    str = f.storeType.value;
    if(!str) {
        alert("가게 종류를 선택하세요. ");
        f.storeType.focus();
        return;
    }
	    
    
  
    var mode="${mode}";
    if(mode=="created") {
    	f.action = "<%=cp%>/ceomember/join_ok.do";
    } else if(mode=="update") {
    	f.action = "<%=cp%>/ceomember/update_ok.do";
    }

    f.submit();
    
}
function setEmail() {
    var f = document.ceomemberForm;
    
 	var str = f.getEmail.value;
 	
    if(str!="direct") {
         f.ceoEmail2.value=str; 
         f.ceoEmail2.readOnly = true;
         f.ceoEmail1.focus(); 
    }
    else {
        f.ceoEmail2.value="";
        f.ceoEmail2.readOnly = false;
        f.ceoEmail1.focus();
    }
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
	height: 1055px;
	background: #DCDCDC;
	font-size: 13pt;
	font-weight: 500;
	text-align: center;
}

#item {
	float: left;
	width: 200px;
	height: 900px;
	font-size: 10pt;
	font-weight: 500;
	text-align: center;
}

#input {
	float: left;
	width: 600px;
	height: 900px;
	font-size: 10pt;
}

#footer {
	clear: both;
	width: 1000px;
	height: 200px;	
	text-align: center;
}

#personal {
	height:300px; line-height: 300px;
	margin: 0px; padding: 0px;
}

#myStore {
	height:400px; line-height: 400px;
	margin: 0px; padding: 0px;
}

#accountInfo {
	height:350px; line-height: 350px;
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

<form name="ceomemberForm" method="post" enctype="multipart/form-data">
<div>
<div id=header>사장님 회원가입</div>
	<div id=formbody>
		<div id=category>
		<%/*항목 카테고리 컬럼 레이아웃 */%>
		 	<dl class=row01 style="border-top: 3px solid DarkSlateGrey ;">
				<dd id=accountInfo>계정 정보</dd>		 	
		 		<dd id=personal>사장님 정보</dd>
		 		<dd id=myStore>내 업소 정보</dd>		 		
		 	</dl>
		</div>
		
		<div id=item>
		<%/*항목 컬럼 레이아웃 */%>	
			<dl class=row02 style="border-top: 3px solid DarkSlateGrey ;">
				<dd></dd>
		 		<dd>아이디</dd>
		 		<dd>비밀번호 입력</dd>
		 		<dd>비밀번호 확인</dd>
		 		<dd>비밀번호 질문</dd>
		 		<dd>비밀번호 대답</dd>		 		
		 		<dd style="border-bottom: 1px solid silver;"></dd>
		 		
		 		<dd></dd>
		 		<dd>사장님 성함</dd>
		 		<dd>휴대폰 번호</dd>
		 		<dd>생년월일</dd>
		 		<dd>이메일 주소</dd>
		 		<dd style="border-bottom: 1px solid silver;"></dd>
		 		
		 		<dd></dd>
		 		<dd>점포명</dd>
		 		<dd>사업자 등록번호</dd>
		 		<dd>점포 주소</dd>
		 		<dd>점포 전화번호</dd>
		 		<dd>카테고리</dd>
		 		<dd>점포사진</dd>
		 		<dd style="border-bottom: 1px solid silver;"></dd>
		 		
		 				 		
		 	</dl>		
		</div>
		
		
		<div id=input>
		<%/* 입력란 레이아웃 */%>
			<dl class=row03 style="border-top: 3px solid DarkSlateGrey ;">
				<dd></dd>
		 		<dd>
		 			<%/* 아이디 */%>
		 			<input type="text" name="ceoId" size="50" maxlength="20" value="${params.ceoId}"
		 				placeholder="영문자와 숫자합쳐 5~10자 첫글자는 영문자">&nbsp;
					<input type="button" name="check_bNum" class="chBtn" value="중복확인 " onclick="chkceoId();"><span style="color: blue;">${message2}</span>					
				</dd>
				
		 		<dd>
		 			<%/* 비밀번호 */%>
		 			<input type="password" name="ceoPwd" size="50" maxlength="20"
		 				placeholder="5~10자이며 하나 이상의 숫자나 특수문자가 포함">		 			
		 		</dd>
		 		
		 		<dd>
		 			<%/* 비밀번호 확인 */%>
		 			<input type="password" name="ceoPwd1" size="50" maxlength="20"
		 				placeholder="위 비밀번호를 한번 더 입력해 주세요">
		 		</dd>
		 		
		 		<dd>
		 			<%/* 비밀번호 질문 */%>
		 			<input type="text" name="askPwd" size="50" maxlength="20" value="${param.askPwd}">
		 		</dd>
		 		
		 		<dd>
		 			<%/* 비밀번호 대답 */%>
		 			<input type="text" name="ansPwd" size="50" maxlength="20" value="${param.ansPwd}">
		 		</dd>
		 		
		 		<dd style="border-bottom: 1px solid silver;"></dd>			
				
		 		<dd></dd>
		 		<dd>
		 			<%/* 사장성명 */%>	 			
		 			<input type="text" name="ceoName" size="28" value="${param.ceoName}">		 			
		 		</dd>
		 				 		
		 		<dd>
		 			<%/* 전화번호 */%>
		 			<select name="ceoTel1" >
		 				<option value="">선택</option>
		 				<option value="010">010</option>
		 				<option value="011">011</option>
		 				<option value="016">016</option>
		 				<option value="017">017</option>
		 				<option value="018">018</option>
		 				<option value="019">019</option>		 			
		 			</select>&nbsp;
		 			<input type="text" name="ceoTel2" value="${param.ceoTel2}" size="11" maxlength="4" >&nbsp;
		 			<input type="text" name="ceoTel3" value="${param.ceoTel3}" size="11" maxlength="4">&nbsp;
		 			
		 		</dd>
		 		
		 		<dd>
		 			<%/* 생년월일 */%>
		 			<select name="ceoBirth1">
		 				<option value="" selected="selected">연도&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="1924" end="2015" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>	 			
		 			</select>&nbsp;
		 			
		 			<select name="ceoBirth2">
		 				<option value="" selected="selected">월&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="11" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>		 						 			
		 			</select>&nbsp;
		 			
		 			<select name="ceoBirth3">
		 				<option value="" selected="selected">일&nbsp;&nbsp;</option>
		 				<c:forEach var="i" begin="0" end="30" step="1">
		 					<option value="${i+1}">${i+1}</option>
		 				</c:forEach>		 			
		 			</select>&nbsp;
		 		</dd>
		 		
		 		<dd>
		 			<%/* 이메일 */%>	 			 
		 			
						<input type="text" name="ceoEmail1" value="${param.ceoEmail1}" >&nbsp;@&nbsp;
						<input type="text" name="ceoEmail2" >
		 				<select name="getEmail" onchange="setEmail();">
							<option value="direct" selected="selected">직접입력&nbsp;&nbsp;</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="hotmail.com">hotmail.com</option>
						</select> 
					
				</dd>
		 		
		 		<dd style="border-bottom: 1px solid silver;"></dd>
		 		
		 		
		 		<dd></dd>
		 		
		 		<dd>
		 			<%/* 업소명 */%> 			
					<input type="text" name="storeName" value="${param.storeName}" size="40">&nbsp;
				</dd>
		 		
		 		<dd>
		 			<%/* 사업자등록번호 */%> 			
					<input type="text" name="ceoCodeNum" size="40" value="${param.ceoCodeNum}">&nbsp;
					<input type="button" name="check_bNum" class="chBtn" value="중복확인 " onclick="chkceoCodeNum();"><span style="color: blue;">${message1}</span>
					
				</dd>
		 		
		 		<dd>
		 			<%/* 점포 주소 */%>
		 			<select name="region">
		 				<option value="" selected="selected">선택&nbsp;&nbsp;</option>
		 				<option value="seoul">서울</option>
		 				<option value="gyeonggi">경기</option>
		 				<option value="incheon">인천</option>		 					 			
		 			</select>
		 			<input type="text" name="storeAddr"  value="${param.storeAddr}" size="60">
				</dd>
				
				<dd>
		 			<%/* 점포 전화번호 */%> 			
					<input type="text" name="storeTel"   value="${param.storeTel}" size="40">&nbsp;
				</dd>
		 		
		 		<dd>
		 			<%/* 카테고리 */%>
		 			<select name="storeType">
		 				<option value="" selected="selected">선택&nbsp;&nbsp;</option>
		 				<option value="jungkukzip">중식</option>
		 				<option value="chicken">치킨</option>
		 				<option value="bunsik">분식</option>
		 				<option value="pizza">피자</option>
		 				<option value="hansik">한식</option>
		 				<option value="jokbal">족발</option>	 			
		 			</select>
		 		</dd>
		 		
		 		<dd>
		 			<%/* 가게사진등록  */%>						
					<input type="file" name="storePhoto" style="height: 35px; border: 0px solid silver;	padding: 0px 0px 0px 0px;">					
				</dd>
		 		
		 		<dd style="border-bottom: 1px solid silver;"></dd>		 				 		
		 		 		
		 	</dl>
		</div>
		
		
		<div id=footer>
			<br>
			<input type="button" name="complete_btn" class="cbtn" value="가입완료 " onclick="ceomemberok();">
			<input type="reset" class="cbtn" value="다시하기 ">
			<input type="button" name="complete_btn" class="cbtn" value="가입취소 " onclick="javascript:location.href='<%=cp%>/ceomain/ceomain.do';">
		</div>
	</div>
</div>

</form>

<div align="center">
<dl style="height: 140px">
    <dd>
      <jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp"/>
    </dd>
  </dl>
</div>


</body>
</html>