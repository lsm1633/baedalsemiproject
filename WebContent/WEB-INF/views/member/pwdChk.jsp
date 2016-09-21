<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배달의 나라 회원정보확인</title>
<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>

<script type="text/javascript">
function sendOk() {
    var f = document.pwdChkForm;

    var str = f.userPwd.value;
    if(!str) {
        alert("\n패스워드를 입력하세요. ");
        f.userPwd.focus();
        return;
    }

    f.action = "<%=cp%>/member/update.do";
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
			<h3 align="left">회원정보확인</h3>
		</div>
		
		<h4 align="left"> 회원님의 개인정보 보호를 위해 비밀번호를 한번 더 입력해주세요~!</h4>
		
		<div class="col-md-5 col-md-offset-3">
				<div class="pwdChk">
					<form name="pwdChkForm" accept-charset="UTF-8" role="form" method="post" action="">
						<div class="form-group">
							<label for="userId">아이디</label>
							<input type="text" name="userId" class="form-control" maxlength="15"
					                tabindex="1"
					                value="${sessionScope.member.userId}"
			                        readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="password">비밀번호</label>
							<input name="userPwd"
								id="userPwd" value='' placeholder="Password" type="password"
								class="form-control" />
						</div>
						
						<div class="form-group" style="margin-top:20px">
							<input type="button"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="확인" onclick="sendOk();"/>
						</div>
					</form>
					
					
						<span style="color: tomato;">${message}</span>
					
					
				</div>
		</div>
	</div>
	
	
	<div style="clear: both;">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>
	

</body>
</html>