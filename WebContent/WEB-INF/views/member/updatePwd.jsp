<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript">
function sendOk() {
    var f = document.pwdForm;

    var str = f.userPwd1.value;
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.userPwd1.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.userPwd1.focus();
		return;
	}

	if(str!= f.userPwd2.value) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwd2.focus();
        return;
	}

    f.action = "<%=cp%>/member/updatePwd_ok.do";
	f.submit();
	}
</script>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div class="container" role="main">
		<div class="body-title">
			<h3 align="left">비밀번호 변경</h3>
		</div>

		<h4 align="left">변경하실 비밀번호를 입력해주세요</h4>

		<div class="col-md-5 col-md-offset-3">
			<div class="pwdChk">
				<form name="pwdForm" accept-charset="UTF-8" role="form"
					method="post" action="">
					<div class="password">
						<label for="password">변경할 비밀번호</label> <input type="password" id="userPwd1"
							name="userPwd1" class="form-control"
							maxlength="10" tabindex="1">
							<p class="help-block">패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</p>
					</div>

					<div class="form-group">
						<label for="passwordchk">비밀번호 확인</label> <input name="userPwd2"
							id="userPwd2" value='' placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요"
							type="password" class="form-control" />
					</div>

					<div class="form-group" style="margin-top: 20px">
						<input type="button"
							class="btn btn-default btn-login-submit btn-block m-t-md"
							value="비밀번호 변경" onclick="sendOk();" />
					</div>

					<div class="form-group text-right">
							<input type="hidden" name="userId" value="${userId}">
					</div>
				</form>


			</div>
		</div>
	</div>


	<div style="clear: both;">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>


</body>
</html>