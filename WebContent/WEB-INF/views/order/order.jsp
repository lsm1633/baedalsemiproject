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
<script type="text/javascript">
function orderOk() {
	var f = document.orderForm;
	
	f.action = "<%=cp%>/order/order_ok.do";
	f.submit();
}
</script>
	
</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
	
	<div class="container" role = "main">
	<form name="orderForm" role="form">
		<div class="form-group" style="line-height: 60px; border-bottom: 1px solid black; margin: 15px 0px 15px"><h1 style="font-weight: bold;">배달 / 결제정보</h1> </div>
		<h3 style="line-height: 50px; border-bottom: 1px solid black;">01. 배달정보</h3>
		<div class= "col-md-6">
			<div class="form-group">
				<label> 휴대폰 </label>
				<input width="500px;" type="text" class="form-control" name="tel" placeholder="-없이 입력해주세요." value="${tel}">
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
             	  name="coment" placeholder="예) 벨 누르시기전에 전화해 주세요."> 
       		</div>
			<h3 style="line-height: 50px; min-width:1140px; border-bottom: 1px solid black;">02. 결제정보 및 결제방법 선택</h3>
			<div class="form-group">
            	<label> 주문내역 </label> 
            	<c:set var="total" value="0"/>
            	<c:set var="totalmenu" value=" "/>
            	<c:forEach var="dto" items="${list}">
            	<div style="border-bottom: 1px solid #ccc; clear: both;" align="left">
         			<label style="width: 200px">${dto.menuName}</label>
        			<label style="width: 150px">${dto.price}원</label>
         			<label style="width: 80px">${dto.num}개</label>
      			</div>
      			<c:set var="total" value="${total+(dto.price*dto.num)}"/>
      			<c:set var="totalmenu" value="${dto.menuName}+${totalmenu}"/>
      			</c:forEach>
      			<div class="form-group">총 가격 
      				<input type="text" value="${total}" name="price" readonly="readonly">원
      				<input type="hidden" name="menuName" value="${totalmenu}">
      			</div>
      			
      			
       		</div>
       		<div class="form-group" style="line-height: 50px">
       			<label style="margin-right: 50px"> 결제방법 </label>
       			<select style="width: 300px" name="payment">
					<option value="cash">만나서 결제 - 현금</option>
					<option value="card">만나서 결제 - 카드</option>
				</select>
				<input type="hidden" name="ceoId" value="${ceoId}">
				<input type="hidden" name="userId" value="${userId}">
       		</div>
       		
		</div>
       		<div class="col-md-6 col-md-offset-5" style="line-height: 100px;">
       			<input type="button" value=" 주문완료하기  " class ="btn btn-info" onclick="orderOk()">
       		</div>
		</form>
		</div>

	
	<div style="clear: both;">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>


<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>