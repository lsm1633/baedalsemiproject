<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

@import
	url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
</style>
<link rel="stylesheet"
	href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet"
	href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css"
	type="text/css" />

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css"
	type="text/css" />

<script type="text/javascript"
	src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>

 <style type="text/css">
*{
  padding:0px; margin:0px;
}

#box{
   width:640px;
   margin:10px auto;
   border:1px solid #ccc;
   text-align: center;
}
#box td{
   width:215px;   
}
.row td{  
   border-bottom:1px solid #ccc;
   background: #C4FFC9;
   line-height:38px;
   font-size:25px;
   font-family: 'Hanna', fantasy;
   
}
.row2 td{
  line-height:18px;
  font-size:18px;
  font-family: 'Nanum Gothic Coding', serif;
}

.row3 td{
   width:318px;
   margin:10px auto;
   text-align: center;
   border:1px solid #ccc;
   background: #D2FFF1;
   line-height:30px;
   font-size:20px;
   font-family: 'Hanna', fantasy;
}

.dayselect{
  width:640px;
  margin:10px auto;
  border: 2px solid #ccc;
  text-align: center;
  font-family: 'Jeju Hallasan', serif;
  font-size:16px;
} 

</style>

<script type="text/javascript">
function dateSelect() {
	var f = document.moneyForm;
	
	f.action = "<%=cp%>/ceomoney/money.do";
	f.submit();
}
</script>

</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp" />
	</div>
	<form name="moneyForm" role="form" method="post">
	<div class="container">
	<div style="font-family: 'Jeju Hallasan', serif; font-size: 20pt;">정산
		확인</div>
	<div align="center" style="height: 600px">
		<table class="dayselect">
			<tr>
				<td>기간 : <label> <input type="date" name="start">
						부터 <input type="date" name="last"> 까지
				</label> <br>
				<br>
					<button type="button" class="btn btn-default" onclick="dateSelect();">기간 검색</button>
				</td>

			</tr>
		</table>


		<div style="font-size: 20px"></div>


		<table id="box" style="table-layout: fixed">
			<tr class="row">
				<td>일자</td>
				<td>카드 매출</td>
				<td>현금 매출</td>
	
			</tr>
			
		
			
			
		
		<c:set var="daytotal" value="0"/>	
		<c:set var="cardtotal" value="0"/>	
		<c:set var="cashtotal" value="0"/>		
		<c:forEach var="dto" items="${list}">  
		  <tr class="row2" >
		  <td></td>
		    <td style="padding: 10px 10px">${dto.created}</td>
		   <c:if test="${dto.payment!='card'}">
		    <td style="padding: 10px 10px">-</td>
		   </c:if>
		   <c:if test="${dto.payment=='card'}">
		    <td style="padding: 10px 10px">${dto.price}원</td>
		     <c:set var="cardtotal" value="${cardtotal+(dto.price)}"/>  
		   </c:if>
		   <c:if test="${dto.payment!='cash'}">
		    <td style="padding: 10px 10px">-</td>
		   </c:if>
		   <c:if test="${dto.payment=='cash'}">
		    <td style="padding: 10px 10px">${dto.price}원</td>
		    <c:set var="cashtotal" value="${cashtotal+(dto.price)}"/>  
		     </c:if>
		   <c:set var="daytotal" value="${daytotal+(dto.price)}"/>  
	
		   </tr>
		</c:forEach>		  
		</table>
		

		<div style="font-size: 200px"></div>
		
		<table>
		   <tr class="row3">
				<td>카드 총 매출</td>
				<td>${cardtotal}원</td>
			</tr>
			<tr class="row3">
				<td>현금 총 매출</td>
				<td>${cashtotal}원</td>
			</tr>
			<tr class="row3">
				<td>총 매출</td>
				<td>${daytotal}원</td>
			</tr>
		</table>

	</div>
</div>
</form>
	<div style="clear: both;">
		<jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp" />
	</div>

	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>