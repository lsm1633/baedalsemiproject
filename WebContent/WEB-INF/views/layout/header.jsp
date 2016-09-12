<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div class="container">
	<div class="page-header">
		<div align="right" style="margin: 10px">
			<c:if test="${empty sessionScope.member}">
				<a href="<%=cp%>/member/login.do"><span class="glyphicon glyphicon-log-in">로그인  </span></a> | <i></i>
				<a href="<%=cp%>/member/join.do"><span class="glyphicon glyphicon-user"></span>회원가입 </a> | <i></i>
				<a href="<%=cp%>/faq/faq.do"><span class="glyphicon glyphicon-volume-down"></span>고객센터 </a> |
				<a href="<%=cp%>/ceo/ceoMain.jsp"><span class="glyphicon glyphicon-piggy-bank"></span>사장님싸이트 </a>

			</c:if>
			<c:if test="${not empty sessionScope.member}">
				<span style="color: green;">${sessionScope.member.userName}</span>님 <i></i>
				<c:if test="${sessionScope.member.userId=='admin'}">
					<a href="<%=cp%>/admin/main.do">관리자</a>
					<i></i>
				</c:if>
				<a href="<%=cp%>/"><span class="glyphicon glyphicon-log-out"></span>
					로그아웃</a>
				<a href="<%=cp%>/faq/faq.do"><span class="glyphicon glyphicon-bbs"></span>고객센터</a>
			</c:if>
			<div class="header-brand" align="center">
				<a href="<%=cp%>"> <span class="logo"><img alt="배달의 나라"
						src="<%=cp%>/res/images/logo.png" class=" img-responsive"
						alt="Responsive image"></span></a>
			</div>
			<div class="row" style="margin: 10px auto;">
				<div class="col-lg-6 col-md-offset-3">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="업소명을 검색해주세요">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">검색</button>
						</span>
					</div>
				</div>
			</div>
			<div class="category">
				<div align="center" style="margin: 10px">
					카테고리 : <a href="<%=cp%>"> 치킨 </a> |
					<a href="<%=cp%>"> 중국집 </a> |
					<a href="<%=cp%>"> 피자 </a> |
					<a href="<%=cp%>"> 분식,떡볶이 </a> |
					<a href="<%=cp%>"> 족발,보쌈 </a> |
					<a href="<%=cp%>"> 한식 </a> 
				</div>
			</div>
		</div>
	</div>
</div>