<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
function memberOk(){
	var f = document.memberForm;
	var str;
	
	str = f.userId.value;
	str = str.trim();
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
	
    str = f.userName.value;
	str = str.trim();
    if(!str) {
        alert("이름을 입력하세요. ");
        f.userName.focus();
        return;
    }
    f.userName.value = str;

	str = f.userPwd.value;
	str = str.trim();
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
	str = str.trim();
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
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email.focus();
        return;
    }
    
    str = f.addr1.value;
    str = str.trim();
    if(!str){
    	alert("주소를 입력하세요 ");
    	f.addr1.focus();
    	return;
    }
    str = f.addr2.value;
    str = str.trim();
    if(!str){
    	alert("나머지주소를 입력하세요  ");
    	f.addr2.focus();
    	return;
    }
    
    var mode="${mode}";
    if(mode == "created"){
    	f.action = "<%=cp%>/member/join_ok.do";
    }else if(mode == "update"){
    	f.action = "<%=cp%>/member/update_ok.do";
    }
    
    f.submit();
    
}

</script>

<title>배달의 나라_회원가입</title>

<link rel="stylesheet"
	href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet"
	href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css"
	type="text/css" />

<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/style.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=cp%>/res/bootstrap/css/layout/layout.css" type="text/css" />

</head>
<body>

	<div class="container">

	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div class="page-header">
		<h1>
			회원가입 <small>쟈쟌회원가입폼 </small>
		</h1>
	</div>
	<div class="col-md-6 col-md-offset-3">
		<form name="memberForm" role="form">

			<div class="form-group">
				<label for="InputId"> ID </label>
				<div class="input-group">
					<input type="text" class="form-control" id="userId" name="userId"
						placeholder="ID를 입력해 주세요"
						value="${dto.userId}" ${mode=="update" ? "readonly='readonly' style='border:none;'":"" }>
					<span class="input-group-btn">
						<button class="btn btn-success">
							중복확인<i class="fa fa-mail-forward spaceLeft"></i>
						</button>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="username">닉네임</label> <input type="text"
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
				<label for="InputAddr">주소</label> <input type="addr"
					class="form-control" name="addr1" placeholder="주소"> <input
					type="addr" class="form-control" name="addr2"
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
					class="form-control" name="tel" placeholder="-없이 입력해주세요.">
			</div>

			<div class="form-group">
				<label for="InputEmail">이메일</label> <input type="email"
					class="form-control" name="email" placeholder="e-mail주소를 입력하세요">
			</div>



			<div class="form-group">
				<label>약관 동의</label>
				<div data-toggle="button">
					<label class="btn btn-primary active"> <span
						class="fa fa-check"></span> <input id="agree" type="checkbox"
						autocomplete="off" checked>
					</label> <a href="#">이용약관</a>에 동의합니다.
				</div>
			</div>
			<div class="form-group text-center">
				<c:if test="${mode=='created'}">
					<input type="button" value=" 회원가입  " class ="btn btn-info" onclick="memberOk();">
					<input type="reset" value=" 다시입력  "  class="btn" onclick="document.memberForm.userId">
					<input type="button" value=" 가입취소  " class ="btn btn-warning" onclick="javascript:location.href='<%=cp%>/';">
				</c:if>
				<c:if test="${mode=='update'}">
					<input type="hidden" name="enabled" value="${dto.enabled}">
					<input type="button" value=" 정보수정 " class="btn btn-info" onclick="memberOk();"/>
					<input type="reset" value=" 다시입력 " class="btn" onclick="document.memberForm.userId"/>
					<input type="button" value=" 수정취소  " class ="btn btn-warning" onclick="javascript:location.href='<%=cp%>/';">
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



	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>



</body>
</html>