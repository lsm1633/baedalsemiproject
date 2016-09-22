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


<%-- <link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/> --%>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">


function memberOk(){
	var f = document.memberForm;
	var str;
	var mode="${mode}";
	
	str = f.userId.value;
	
	if(mode=="created"){
		if(!str) {
			alert("아이디를 입력하세요. ");
			f.userId.focus();
			return;
		}
		if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
			alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
			f.userId.focus();
			return;
		}
		f.userId.value = str;
	}
	
    str = f.userName.value;
    if(!str) {
        alert("이름을 입력하세요. ");
        f.userName.focus();
        return;
    }
    f.userName.value = str;

	str = f.userPwd.value;
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.userPwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.userPwd.focus();
		return;
	}
	f.userPwd.value = str;

	if(str!= f.userPwd1.value) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwd1.focus();
        return;
	}
	
    str = f.tel.value;
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel.focus();
        return;
    }
    
    str = f.email.value;
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email.focus();
        return;
    }
    
    str = f.addr1.value;
 
    if(!str){
    	alert("주소를 입력하세요 ");
    	f.addr1.focus();
    	return;
    }
    str = f.addr2.value;
    
    if(!str){
    	alert("나머지주소를 입력하세요  ");
    	f.addr2.focus();
    	return;
    }
   
    if(mode=="created"){
    	 str = f.agree.checked;
    	    if(str==""){
    	    	alert("약관에 동의해주세요.");
    	    	return;
    	    }
    }
    if(mode == "created")
    	f.action = "<%=cp%>/member/join_ok.do";
    else if(mode == "update")
    	f.action = "<%=cp%>/member/update_ok.do";
    	
    
    
    f.submit();
    
}

function chkId(){
	var f = document.memberForm;
	
	var str;
	str = f.userId.value;
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}
	else if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.userId.focus();
		return;
	}
	else{
		f.action = "<%=cp%>/member/chkId_ok.do";
	}
	f.submit();
}

</script>

<title>${title}</title>

<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>

</head>
<body>

	<div class="container">

	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div class="page-header">
		<h1>${title}</h1>
	</div>
	<div class="col-md-6 col-md-offset-3">
		<form name="memberForm" role="form">

			<div class="form-group">
				<label for="InputId"> ID </label>
				<div class="input-group">
					<input type="text" class="form-control" id="userId" name="userId"
						placeholder="ID를 입력해 주세요"
						value="${param.userId}" ${mode=="update" ? "readonly='readonly' style='border:none;'":"" }>
						<!--value="${dto.userId}" ${mode=="update" ? "readonly='readonly' style='border:none;'":"${param.userId}" }  -->
						<!--  value="${param.userId}"-->
					<c:if test="${empty sessionScope.member}">	
					<span class="input-group-btn">
						<input type="button" class="btn btn-success" value="중복확인" onClick="chkId();">
					</span>
					</c:if>
					
				</div>
				<span style="color: tomato;">${msg}</span>
			</div>

			<div class="form-group">
				<label for="username">닉네임</label> <input type="text" value="${sessionScope.member.userName}"
					class="form-control" name="userName" placeholder="닉네임을 입력해 주세요">
			</div>
			<!-- 			<div class="form-group">
				<label for="InputEmail">이메일 주소</label> <input type="email"
					class="form-control" id="InputEmail" placeholder="이메일 주소">
			</div> -->
			<div class="form-group">
				<label for="InputPassword1">비밀번호</label> <input type="password"
					class="form-control" name="userPwd" placeholder="비밀번호">
			</div>
			<div class="form-group">
				<label for="InputPassword2">비밀번호 확인</label> <input type="password"
					class="form-control" name="userPwd1" placeholder="비밀번호 확인">
				<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
			</div>

			<div class="form-group">
				<label for="InputAddr">주소</label> <input type="text"
					value="${dto.addr1}"
					class="form-control" name="addr1" placeholder="주소"> <input
					type="text" class="form-control" name="addr2"
					value="${dto.addr2}"
					placeholder="나머지 주소를 입력하세요">
			</div>

			<!-- 			<div class="form-group">
				<label for="username">휴대폰 인증</label>
				<div class="input-group">
					<input type="tel" class="form-control" id="username"
						placeholder="- 없이 입력해 주세요"> <span class="input-group-btn">
						<button class="btn btn-success">
							인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i>
						</button>
					</span>
				</div>
			</div> -->

			<div class="form-group">
				<label for="InputTel">휴대폰</label> <input type="tel"
					value="${dto.tel}"
					class="form-control" name="tel" placeholder="-없이 입력해주세요.">
			</div>

			<div class="form-group">
				<label for="InputEmail">이메일</label> <input type="email"
					value="${dto.email}"
					class="form-control" name="email" placeholder="e-mail주소를 입력하세요">
			</div>


	<c:if test="${empty sessionScope.member}">
			<div class="form-group">
				<label>약관 동의</label>
					
				<div class="col-xs-12">
					<textarea class="form-control" readonly rows="10" cols="100">제1조(목적)
이 약관은 주식회사 배달의 나라(전자거래 사업자)이 운영하는 홈페이지(이하 "홈페이지"라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버홈페이지과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」	
제 7 조 (전자금융거래 기록의 생성 및 보존)
① “회사”는 “이용자”가 이용한 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
② 제1항의 규정에 따라 “회사”가 보존하여야 하는 기록의 종류 및 보존방법은 아래 각 호와 같습니다.
1. 제1항의 대상이 되는 거래내용 중 대상기간이 5년인 것은 다음 각호와 같습니다.
가. 전자금융거래의 종류(보험계약의 경우에는 보험계약의 종류를 말한다) 및 금액, 전자금융거래의 상대방에 관한 정보
나. 전자금융거래의 거래일시, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보
다. 전자금융거래가 계좌를 통하여 이루어지는 경우 거래계좌의 명칭 또는 번호(보험계약의 경우에는 보험증권번호를 말한다)
라. “회사”가 전자금융거래의 대가로 받은 수수료
마. 회원의 출금 동의에 관한 사항
바. 해당 전자금융거래와 관련한 전자적 장치의 접속기록
사. 전자금융거래의 신청 및 조건의 변경에 관한 사항
아. 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록
2. 제1항의 대상이 되는 거래내용 중 대상기간이 1년인 것은 다음 각호와 같습니다.
가. 건당 거래금액이 1만원 이하인 전자금융거래에 관한 기록
나. 전자지급수단 이용과 관련된 거래승인에 관한 기록
다. “이용자”의 오류정정 요구사실 및 처리결과에 관한 사항</textarea>
				</div>
				<div class="col-xs-12">
					<div class="checkbox pull-right">
						<label for="join_user_agree" >
								<input id="agree" type="checkbox" name="agree" id="agree" value="1" />
										회원가입 약관에 동의합니다.									</label>
					</div>
				</div>
				
			</div>
			</c:if>
			
			
			<div class="form-group text-center">
				<c:if test="${mode=='created'}">
					<input type="button" value=" 회원가입  " class ="btn btn-info" onclick="memberOk();">
					<input type="reset" value=" 다시입력  "  class="btn" onclick="document.memberForm.userId">
					<input type="button" value=" 가입취소  " class ="btn btn-warning" onclick="javascript:location.href='<%=cp%>/';">
				</c:if>
				<c:if test="${mode=='update'}">
					<input type="hidden" name="enabled" value="${dto.enabled}">
					<input type="button" value=" 정보수정 " class="btn btn-info" onclick="memberOk();"/>
					<input type="button" value=" 수정취소  " class ="btn btn-warning" onclick="javascript:location.href='<%=cp%>/';">
				</c:if>
			</div>
			
			<div class="form-group text-right"  >
				<c:if test="${mode=='update'}">
					<input type="hidden" name = "userId" value="${dto.userId }">
					<a href="<%=cp%>/member/leave.do" style="color: orange; border-bottom: 1px solid orange ">배달의 나라 탈퇴하기</a>
				</c:if>
			</div>
			
			<div style="height: 40"> 
				<div align="center">
					<span style="color: blue;">${message}</span>
				</div>
			</div>
			
		</form>
	</div>

	</div>  <!--  -->

	<div>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>




	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> -->
	
	<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>