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
<title>배달의 나라 로그인</title>

<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
function sendLogin(){
   var f = document.loginForm;
   
   var str = f.userId.value;
    if(!str) {
        alert("아이디를 입력하세요. ");
        f.userId.focus();
        return;
    }

    str = f.userPwd.value;
    if(!str) {
        alert("패스워드를 입력하세요. ");
        f.userPwd.focus();
        return;
    }

    f.action = "<%=cp%>/member/login_ok.do";
    f.submit();
}
</script>
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
            <div class="pwdChk">
               <form name="loginForm" accept-charset="UTF-8" role="form" method="post" action="">
                  <h3>로그인</h3>
                  <div class="form-group">
                     <label for="userId">아이디</label> <input name="userId"
                        value='' id="userId" placeholder="UserId" type="text"
                        class="form-control" />
                  </div>
                  <div class="form-group">
                     <label for="password">비밀번호</label> <input name="userPwd"
                        id="userPwd" value='' placeholder="Password" type="password"
                        class="form-control" />
                  </div>
                  <div class="form-group">
                     <input type="button"
                        class="btn btn-default btn-login-submit btn-block m-t-md"
                        value="Login" onclick="sendLogin();"/>
                  </div>
                  <div class="form-group" align="center">
                  <span class='text-center'>
                  <a href="<%=cp%>/member/searchId.do"
                     class="text-sm">ID 찾기</a></span>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span class='text-center'>
                  <a href="<%=cp%>/member/searchPwd.do"
                     class="text-sm">비밀번호 찾기</a></span></div>
                  <hr />
                  <div class="form-group">
                     <a href="<%=cp%>/member/join.do" class="btn btn-default btn-block m-t-md"> 회원가입</a>
                  </div>
                  <span style="color: tomato;">${message}</span>
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