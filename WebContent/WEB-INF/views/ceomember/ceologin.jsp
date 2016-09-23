<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>free login form -bootstrap</title>

<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
function sendLogin(){
	var f = document.loginForm;
	
	var str = f.ceoId.value;
    if(!str) {
        alert("아이디를 입력하세요. ");
        f.ceoId.focus();
        return;
    }

    str = f.ceoPwd.value;
    if(!str) {
        alert("패스워드를 입력하세요. ");
        f.ceoPwd.focus();
        return;
    }

    f.action = "<%=cp%>/ceomember/login_ok.do";
    f.submit();
}
function findid(){
	var f = document.loginForm;
	
	var str = f.ceoName.value;	
    if(!str) {
        alert("이름을 입력하세요.");
        f.ceoName.focus();
        return;
    }

    str = f.ceoTel.value;
    if(!str) {
        alert("연락처를 입력하세요.");
        f.ceoTel.focus();
        return;
    }

    f.action = "<%=cp%>/ceomember/findid_ok.do";
    f.submit();
}
function findpwd1(){
	var f = document.loginForm;
	
	var str = f.ceoId.value;
	if(!str) {
        alert("아이디를 입력하세요. ");
        f.ceoId.focus();
        return;
    }
	
	str = f.ceoName.value;
    if(!str) {
        alert("이름을 입력하세요.");
        f.ceoName.focus();
        return;
    }  

    f.action = "<%=cp%>/ceomember/findpwd1_ok.do";
    f.submit();
}
function findpwd2(){
	var f = document.loginForm;
	
	var str = f.ansPwd.value;
	if(!str) {
        alert("질문 대답을 입력하세요. ");
        f.ansPwd.focus();
        return;
    }

    f.action = "<%=cp%>/ceomember/findpwd2_ok.do";
    f.submit();
}



</script>
</head>
<body>

	<div class="container">

<div>
<dl style="height: 150px">
    <dd>
      <jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp"/>
    </dd>
  </dl>
</div>


		<div class="row">
			<div class="page-header">
			<c:if test="${mode=='login'}">
				<h2>배달의 나라 점주 로그인</h2>
			</c:if>
			<c:if test="${mode=='findid'}">
				<h2>배달의 나라 점주 ID찾기</h2>
			</c:if>
			<c:if test="${mode=='findpwd1'}">
				<h2>배달의 나라 점주 비밀번호찾기 1단계</h2>
			</c:if>
			<c:if test="${mode=='findpwd2'}">
				<h2>배달의 나라 점주 비밀번호찾기 2단계</h2>
			</c:if>
			
			</div>
			<div class="col-md-5 col-md-offset-3">
				<div class="login-box well">
					<form name="loginForm" accept-charset="UTF-8" role="form" method="post" action="">
					
					<c:if test="${mode=='login'}">
						<h2>로그인</h2>
						<div class="form-group">
							<label for="username-email">아이디</label> <input name="ceoId"
								value='' id="ceoId" placeholder="Id" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input name="ceoPwd"
								id="ceoPwd" value='' placeholder="Password" type="password"
								class="form-control" />
						</div>
						<div class="form-group">
							<input type="button"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="Login" onclick="sendLogin();"/>
						</div>
					</c:if>
					
					<c:if test="${mode=='findid'}">
						<h2>ID찾기</h2>
						<div class="form-group">
							<label for="username-email">이름</label> <input name="ceoName"
								value='' id="ceoName" placeholder="이름" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">전화번호</label> <input name="ceoTel"
								id="ceoTel" value='' placeholder="전화번호(예:***-****-****)" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<input type="button"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="ID찾기" onclick="findid();"/>
						</div>
					</c:if>
					
					<c:if test="${mode=='findpwd1'}">
						<h2>비밀번호 찾기 1단계 ID확인</h2>
						<div class="form-group">
							<label for="username-email">아이디</label> <input name="ceoId"
								value='' id="ceoId" placeholder="Id" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">이름</label> <input name="ceoName"
								id="ceoName" value='' placeholder="이름" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<input type="button"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="ID확인" onclick="findpwd1();"/>
						</div>
					</c:if>
					
					<c:if test="${mode=='findpwd2'}">
						<h2>비밀번호 찾기 2단계 대답</h2>
						<div class="form-group">
							<label for="username-email">질문</label>
							<h3>${askPwd}</h3>
						</div>
						<div class="form-group">
							<label for="password">대답</label> <input name="ansPwd"
								id="ansPwd" value='' placeholder="대답" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<input type="button"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="패스워드확인" onclick="findpwd2();"/>
						</div>
					</c:if>
					
					
						<div class="form-group">
						<span class='text-center'>
						<a href="<%=cp%>/ceomember/findid.do"
							class="text-sm">ID 찾기</a></span>
						&nbsp;|&nbsp;
						<span class='text-center'>
						<a href="<%=cp%>/ceomember/findpwd1.do"
							class="text-sm">비밀번호 찾기</a></span></div>
						
						<span style="color: blue;">${message}</span>
						
					</form>
				</div>
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



	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>