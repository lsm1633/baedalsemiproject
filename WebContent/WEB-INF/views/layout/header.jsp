<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div class="container">
	<div id ="page-haeder">
		<div class="header-brand"><a href="<%=cp%>"><span class="logo">배달의 나라</span></a></div>
		<div class="login header-login">
			<c:if test="${empty sessionScope.member}">
				<a href="<%=cp%>/"><span class="glyphicon glyphicon-log-in">로그인</span></a> <i></i>
				<a href="<%=cp%>/"><span class="glyphicon glyphicon-user"></span>회원가입</a>
				<a href="<%=cp%>/"><span class="glyphicon glyphicon-bbs"></span>고객센터</a>
			</c:if>
			
			<c:if test="${not empty sessionScope.member}">
                <span style="color:green;">${sessionScope.member.userName}</span>님 <i></i>
                <c:if test="${sessionScope.member.userId=='admin'}">
                    <a href="<%=cp%>/admin/main.do">관리자</a> <i></i>
                </c:if>
                <a href="<%=cp%>/"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a>
                <a href="<%=cp%>/"><span class="glyphicon glyphicon-bbs"></span>고객센터</a>
            </c:if>
		</div>
	</div>
</div>