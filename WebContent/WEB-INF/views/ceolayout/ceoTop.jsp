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

  <div id="main_header">
    <h1 class="logo">
      <a href="<%=cp%>/ceomain/ceomain.do"><img src="<%=cp%>/res/images/logo.png" width="250" height="80"/></a>
    </h1>
    <div class="login_menu">
      <span><a href="#">가게관리</a></span> ㅣ
      <span><a href="#">서비스 소개</a></span> ㅣ
      <span><a href="#">주문 내역</a></span> ㅣ
      <span><a href="<%=cp%>">고객 사이트</a></span>

    </div>
  </div>
