<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 String cp=request.getContextPath();
 request.setCharacterEncoding("utf-8");
%>

<style>
  *{
    margin:0; padding:0;
    font:nomal 12px 'Dotum';
  }
  
  a{text-decoration:none;}
  img{border:0;}
  ul{list-style:none;}
  
  body{
    width:980px;
    margin:0 auto;
  }

  #main_header{
    position:relative;
    height:75px;
  }
  
  #main_header > h1.logo{
    position:absolute;
    left:15px; top:10px;
  }
  
  #main_header > div.login_menu{
    position:absolute;
    top:10px; right:0px;
  }
</style>
<div class = "container">
	<div class="page-header" id="main-header">
		<div align="right" style="margin: 10px">
			<c:if test="${empty sessionScope.ceomember}">
				<a href="<%=cp%>/ceomember/login.do"><span class="glyphicon glyphicon-log-in">로그인  </span></a> | <i></i>
				<a href="<%=cp%>/ceomember/join.do"><span class="glyphicon glyphicon-user"></span>회원가입 </a> | <i></i>
				
				<a href="<%=cp%>"><span class="glyphicon glyphicon-piggy-bank"></span>고객사이트 </a>

			</c:if>
			<c:if test="${not empty sessionScope.ceomember}">
				<span style="color: green;">${sessionScope.ceomember.ceoName}</span>님 | <i></i>
				
				<a href="<%=cp%>/ceoMember/pwdChk.do"><span class="glyphicon glyphicon-hand-right"></span>점포메뉴관리 </a> | <i></i>
				<a href="<%=cp%>/ceoMember/pwdChk.do"><span class="glyphicon glyphicon-hand-right"></span>점포정보수정 </a> | <i></i>
				<a href="<%=cp%>/ceomember/logout.do"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a> | <i></i>
				<a href="<%=cp%>/faq/faq.do"><span class="glyphicon glyphicon-bbs"></span>고객센터</a>
			</c:if>
			<div class="header-brand" align="center">
				<a href="<%=cp%>/ceomain/ceomain.do"> <span class="logo"><img alt="배달의 나라"
						src="<%=cp%>/res/images/logo.png" class=" img-responsive"
						alt="Responsive image"></span></a>
			</div>
			
	
		</div>
	</div>
</div>



<%--   <div id="main_header">
    <h1 class="logo">
      <a href="<%=cp%>/ceomain/ceomain.do"><img src="<%=cp%>/res/images/logo.png" width="250" height="80"/></a>
    </h1>
    <div class="login_menu">
      <span><a href="#">가게관리</a></span> ㅣ
      <span><a href="<%=cp%>/intro/intro.do">서비스 소개</a></span> ㅣ
      <span><a href="#">주문 내역</a></span> ㅣ
      <span><a href="<%=cp%>">고객 사이트</a></span>

    </div>
  </div> --%>
