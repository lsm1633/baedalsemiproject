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
<title>배달의 나라</title>
<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css" />

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/css/layout/mainHover.css" type="text/css" />
	
<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<style type="text/css">
.margin{
	margin: 20px 40px 30px;
}
</style>
	
</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
	
	<div class="container" role = "main">
		<div class="form-group" style="line-height: 60px; border-bottom: 1px solid black; margin: 15px 0px 15px"><h1 style="font-weight: bold;">배달 / 결제정보</h1> </div>
		<h3 style="line-height: 50px; border-bottom: 1px solid black;">01. 배달정보</h3>
		<div class= "col-md-6">
			<div class="form-group">
				<label> 휴대폰 </label>
				<input width="500px;" type="text" class="form-control" name="tel" placeholder="-없이 입력해주세요." value="01011115555">
			</div>
			<div class="form-group">
            	<label>주소</label> 
            	<input type="text" value="" class="form-control" 
             	  name="addr1" placeholder="지역을 입력해주세요 예) 서울특별시.."> 
             	<input type="text" class="form-control" name="addr2" value=""
            	   placeholder="나머지 주소를 입력하세요">
       		</div>
       		<div class="form-group">
            	<label> 요청 사항 </label> 
            	<input type="text" value="" class="form-control" 
             	  name="addr1" placeholder="예) 벨 누르시기전에 전화해 주세요."> 
       		</div>
		</div>
		<div class="form-group">
			<h3 style="line-height: 50px; min-width :800px; border-bottom: 1px solid black;">02. 결제정보 및 결제방법 선택</h3>
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