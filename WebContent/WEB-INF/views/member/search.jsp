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
<title>${title }</title>

<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">

function sendOk() {
    var f = document.searchId;
    var mode="${mode}";

    var str = f.userName.value;
    if(!str) {
        alert("\n이름을 입력해주세요 ");
        f.userName.focus();
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
    
    if(mode=="pwd"){
    	str = f.userId.value;
    	
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
		
		str = f.email.value;
	    if(!str) {
	        alert("이메일을 입력하세요. ");
	        f.email.focus();
	        return;
	    }
		
	}
    if(mode == "id")
    	f.action = "<%=cp%>/member/searchId_ok.do";
    
    else if(mode == "pwd")
    	f.action = "<%=cp%>/member/searchPwd_ok.do";

    f.submit();
}

</script>
</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div class ="container" role="main">
		<div class="body-title">
			<h3 align="left">${title }</h3>
		</div>
		
		<h4 align="left"> 회원님이 가입때 기재한 정보를 입력해주세요~!</h4>
		
		<div class="col-md-5 col-md-offset-3">
			<div class="pwdChk">
				<form name="searchId" accept-charset="UTF-8" role="form" method="post" action="">
					
					<c:if test="${mode=='pwd'}">
						<div class="form-group">
							<label for="userId">아이디</label>
							<input type="text" name="userId" class="form-control" maxlength="15"
					                tabindex="1">
						</div>
					</c:if>
					
					<div class="form-group">
						<label for="userName">이름</label>
						<input type="text" name="userName" class="form-control" maxlength="15"
					                tabindex="1">
					</div>
					
					<div class="form-group">
						<label for="userTel">전화번호</label>
						<input type="text" name="tel" class="form-control" maxlength="15"
					                placeholder="숫자로만 입력하세요. ex)01012345678" tabindex="1">
					</div>
					
					<c:if test="${mode=='pwd'}">
						<div class="form-group">
							<label for="email">이메일</label>
							<input type="text" name="email" class="form-control" maxlength="25"
					                tabindex="1">
						</div>
					</c:if>
					
					<div class="form-group" style="margin-top:20px">
							<input type="button"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="확인" onclick="sendOk();"/>
					</div>
							
					<div class="form-group" align="center">
							<c:if test="${mode=='id'}">
								<span class='text-center'>
									<a href="<%=cp%>/member/login.do"
									class="text-sm">로그인창</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="<%=cp%>/member/searchPwd.do"
									class="text-sm">비밀번호 찾기</a></span>
									</c:if>
					</div>
							

					
					<span style="color: tomato;">${message}</span>
				
				</form>
				
				
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