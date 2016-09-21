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
<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
<style type="text/css">
#store{
   width:1300px;
   margin:10px auto;
   text-align: center;  
}
.row1{
  text-align: left;
}
</style>


</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
    <div style="line-height: 100px; background-color: black;">
      <label></label>

    </div>
    
<div style="background-color: #FFE6D9; min-height: 800px;" >
<div style="height: 50px"></div>
<div id="store"  align="center">

      <div style="padding: 30px auto 30px;">
      <c:forEach var="dto" items="${list}">
         <div class="row1">
          <div class="col-sm-5 col-md-4">
           <div class="thumbnail">
            <img src="<%=cp%>/res/images/${dto.imageFilename}" style="float: left" width="200px" height="150" border="1px solid #ccc"> 
             <div class="caption">
             <h3>${dto.storeName}</h3>
             <p>주소: ${dto.storeAddr} <br> 전화번호: ${dto.storeTel}</p>   
             <p align="center"><a href="#" class="btn btn-primary" role="button" >주문하기</a></p>
             </div>
           </div>
          </div>
         </div>   
       </c:forEach>
       </div>
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