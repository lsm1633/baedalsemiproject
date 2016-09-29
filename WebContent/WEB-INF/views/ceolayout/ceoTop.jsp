<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 String cp=request.getContextPath();
 request.setCharacterEncoding("utf-8");
%>

<div class = "container">
	<div class="page-header" id="main-header">
		<div align="right" style="margin: 10px">
			<c:if test="${empty sessionScope.ceomember}">
				<a href="<%=cp%>/ceomember/login.do"><span class="glyphicon glyphicon-log-in">로그인  </span></a> | <i></i>
				<a href="<%=cp%>/ceomember/join.do"><span class="glyphicon glyphicon-user"></span>회원가입 </a> | <i></i>
				<a href="<%=cp%>/faq/faq.do"><span class="glyphicon glyphicon-volume-down"></span>고객센터 </a> |
				<a href="<%=cp%>"><span class="glyphicon glyphicon-piggy-bank"></span>고객사이트 </a>

			</c:if>
			<c:if test="${not empty sessionScope.ceomember}">
				<span style="color: green;">${sessionScope.ceomember.ceoName}</span>님 | <i></i>
				
				<a href="<%=cp%>/ceomoney/orderConfirm.do"><span class="glyphicon glyphicon-hand-right"></span>가게주문관리 </a> | <i></i>				
				<a href="<%=cp%>/faq/faq.do"><span class="glyphicon glyphicon-volume-down"></span>고객센터 </a> |
				<a href="<%=cp%>/ceomember/logout.do"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a>
				
			</c:if>
			<div class="header-brand" align="center">
				<a href="<%=cp%>/ceomain/ceomain.do"> <span class="logo"><img alt="배달의 나라"
						src="<%=cp%>/res/images/ceologo.png" class=" img-responsive"
						alt="Responsive image"></span></a>
			</div>
			
	
		</div>
	</div>
</div>

