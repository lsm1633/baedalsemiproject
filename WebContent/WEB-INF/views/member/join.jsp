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
		<form role="form">

			<div class="form-group">
				<label for="InputId"> ID </label>
				<div class="input-group">
					<input type="text" class="form-control" id="InputuUserId"
						placeholder="ID를 입력해 주세요"> <span class="input-group-btn">
						<button class="btn btn-success">
							중복확인<i class="fa fa-mail-forward spaceLeft"></i>
						</button>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="username">닉네임</label> <input type="text"
					class="form-control" id="userNickname" placeholder="닉네임을 입력해 주세요">
			</div>
			<!-- 			<div class="form-group">
				<label for="InputEmail">이메일 주소</label> <input type="email"
					class="form-control" id="InputEmail" placeholder="이메일 주소">
			</div> -->
			<div class="form-group">
				<label for="InputPassword1">비밀번호</label> <input type="password"
					class="form-control" id="InputPassword1" placeholder="비밀번호">
			</div>
			<div class="form-group">
				<label for="InputPassword2">비밀번호 확인</label> <input type="password"
					class="form-control" id="InputPassword2" placeholder="비밀번호 확인">
				<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
			</div>

			<div class="form-group">
				<label for="InputAddr">주소</label> <input type="addr"
					class="form-control" id="InputAddr" placeholder="주소"> <input
					type="addrdetail" class="form-control" id="InputAddrDetail"
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
					class="form-control" id="InputTel" placeholder="-없이 입력해주세요.">
			</div>

			<div class="form-group">
				<label for="InputEmail">이메일</label> <input type="email"
					class="form-control" id="InputEmail" placeholder="e-mail주소를 입력하세요">
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
				<button type="submit" class="btn btn-info">
					회원가입<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="submit" class="btn btn-warning">
					가입취소<i class="fa fa-times spaceLeft"></i>
				</button>
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