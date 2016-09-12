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
</head>
<body>

	<div class="container">
	
		<div>
			<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
		</div>

		<div class="row">
			<div class="page-header">
				<h2>배달의 나라 로그인</h2>
			</div>
			<div class="col-md-5 col-md-offset-3">
				<div class="login-box well">
					<form accept-charset="UTF-8" role="form" method="post" action="">
						<legend>로그인</legend>
						<div class="form-group">
							<label for="username-email">아이디</label> <input name="user_id"
								value='' id="username-email" placeholder="UserId" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input name="password"
								id="password" value='' placeholder="Password" type="password"
								class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="Login" />
						</div>
						<div class="form-group">
						<span class='text-center'>
						<a href="#"
							class="text-sm">ID 찾기</a></span>
						&nbsp;|&nbsp;
						<span class='text-center'>
						<a href="#"
							class="text-sm">비밀번호 찾기</a></span></div>
						<hr />
						<div class="form-group">
							<a href="<%=cp%>/member/join.do" class="btn btn-default btn-block m-t-md"> 회원가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

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