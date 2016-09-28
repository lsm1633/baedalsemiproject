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
<title>사장님 정보 수정</title>
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

<script type="text/javascript">

function ceomemberok() {
	var f = document.ceomemberForm;
	var str;
		
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
  
    var mode="${mode}";
    if(mode=="ceoinfo_update") {
    	f.action = "<%=cp%>/ceomember/ceoinfo_update_ok.do";
		}

		f.submit();

	}

	function setEmail() {
		var f = document.ceomemberForm;

		var str = f.getEmail.value;

		if (str != "direct") {
			f.ceoEmail2.value = str;
			f.ceoEmail2.readOnly = true;
			f.ceoEmail1.focus();
		} else {
			f.ceoEmail2.value = "";
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
	height: 300px;
	line-height: 300px;
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
									/* 비밀번호 */
								%>
								<input type="password" name="ceoPwd" size="50" maxlength="20"
									placeholder="5~10자이며 하나 이상의 숫자나 특수문자가 포함" >
							</dd>

							<dd>
								<%
									/* 비밀번호 확인 */
								%>
								<input type="password" name="ceoPwd1" size="50" maxlength="20"
									placeholder="위 비밀번호를 한번 더 입력해 주세요" >
							</dd>

							<dd>
								<%
									/* 비밀번호 질문 */
								%>
								<input type="text" name="askPwd" size="50" maxlength="20"
									value="${dto.askPwd}">
							</dd>

							<dd>
								<%
									/* 비밀번호 대답 */
								%>
								<input type="text" name="ansPwd" size="50" maxlength="20"
									value="${dto.ansPwd}">
							</dd>

							<dd style="border-bottom: 1px solid silver;"></dd>

							<dd></dd>
							<dd>
								<%
									/* 사장성명 */
								%>
								<input type="text" name="ceoName" size="28"
									value="${dto.ceoName}">
							</dd>

							<dd>
								<%
									/* 전화번호 */
								%>
								<select name="ceoTel1">
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>&nbsp; <input type="text" name="ceoTel2" value="${dto.ceoTel2}"
									size="11" maxlength="4">&nbsp; <input type="text"
									name="ceoTel3" value="${dto.ceoTel3}" size="11" maxlength="4">&nbsp;

							</dd>

							<dd>
								<%
									/* 생년월일 */
								%>
								<select name="ceoBirth1">
									<option value="" selected="selected">연도&nbsp;&nbsp;</option>
									<c:forEach var="i" begin="1924" end="2015" step="1">
										<option value="${i+1}">${i+1}</option>
									</c:forEach>
								</select>&nbsp; <select name="ceoBirth2">
									<option value="" selected="selected">월&nbsp;&nbsp;</option>
									<c:forEach var="i" begin="0" end="11" step="1">
										<option value="${i+1}">${i+1}</option>
									</c:forEach>
								</select>&nbsp; <select name="ceoBirth3">
									<option value="" selected="selected">일&nbsp;&nbsp;</option>
									<c:forEach var="i" begin="0" end="30" step="1">
										<option value="${i+1}">${i+1}</option>
									</c:forEach>
								</select>&nbsp;
							</dd>

							<dd>
								<%
									/* 이메일 */
								%>

								<input type="text" name="ceoEmail1" value="${dto.ceoEmail1}">&nbsp;@&nbsp;
								<input type="text" name="ceoEmail2"> <select
									name="getEmail" onchange="setEmail();">
									<option value="direct" selected="selected">직접입력&nbsp;&nbsp;</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hotmail.com">hotmail.com</option>
								</select>

							</dd>

							<dd style="border-bottom: 1px solid silver;"></dd>

						</dl>
					</div>


					<div id=footer>
						<br> <input type="button" name="complete_btn" class="cbtn"
							value="수정완료 " onclick="ceomemberok();"> &nbsp; <input
							type="reset" class="cbtn" value="다시하기 "> &nbsp; <input
							type="button" name="complete_btn" class="cbtn" value="수정취소 "
							onclick="javascript:location.href='<%=cp%>/ceomember/ceoinfo.do';">
						<input type="hidden" name="ceoId" value="${dto.ceoId}">
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