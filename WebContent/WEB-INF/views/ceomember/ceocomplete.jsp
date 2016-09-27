<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공</title>

<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css"
	type="text/css">

<script type="text/javascript" src="<%=cp%>/res/js/util.js"></script>
<style type="text/css">
#header {
	width: 1000px;
	height: 100px;
	margin: 15px auto;
	font-size: 20pt;
	line-height: 100px;
}
</style>

</head>
<body>
	
	<div class="layoutHeader">
		<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp"></jsp:include>
	</div>
	
	
	<div class="container">

		<div style="min-height: 450px;">
			<div id=header>${title}</div>

			<div style="margin: 20px auto; width: 400px; min-height: 400px;">
				<div
					style="margin: 0px auto; padding: 10px; min-height: 50px; line-height: 130%; text-align: center;">${message}</div>
				<div style="height: 50px; text-align: center;">
					<input type="button" value=" 사장님사이트메인화면으로 이동 >> "
						class="moveButton"
						onclick="javascript:location.href='<%=cp%>/ceomain/ceomain.do';">
				</div>
			</div>
		</div>

	</div>

	<div class="layoutFooter">
		<jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp"></jsp:include>
	</div>
	
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>


</body>
</html>