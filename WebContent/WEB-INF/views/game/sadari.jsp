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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>
</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
	<div class="col-lg-6 col-md-offset-3" align="left">
	 <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs"
	 	align="center" style="max-width: 800px">
    	<ul id="myTab" class="nav nav-tabs" role="tablist">
     	<li style="width: 400px" role="presentation" class="active"><a href="#sadari" id="sadari-tab" role="tab" data-toggle="tab" aria-controls="sadari" aria-expanded="true">사다리 게임</a></li>
      	<li style="width: 400px" role="presentation"><a href="#cal" role="tab" id="cal-tab" data-toggle="tab" aria-controls="cal">더치페이 계산기</a></li>
      
    	</ul>
    <div id="myTabContent" class="tab-content">
      <div role="tabpanel" class="tab-pane fade in active" id="sadari" aria-labelledBy="sadari-tab">
        <p>사다리 게임</p>
      </div>
      <div role="tabpanel" class="tab-pane fade" id="cal" aria-labelledBy="cal-tab">
        <p>더치페이 계산기</p>
      </div>
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