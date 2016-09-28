<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>배달의 나라</title>

<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>
<style type="text/css">
.bbs-article .table {
    margin-top: 15px;
}
.bbs-article .table thead tr, .bbs-article .table tbody tr {
    height: 30px;
}
.bbs-article .table thead tr th, .bbs-article .table tbody tr td {
    font-weight: normal;
    border-top: none;
    border-bottom: none;
}
.bbs-article .table thead tr {
    border-top: #d5d5d5 solid 1px;
    border-bottom: #dfdfdf solid 1px;
} 
.bbs-article .table tbody tr {
    border-bottom: #dfdfdf solid 1px;
}
.bbs-article .table i {
    background: #424951;
    display: inline-block;
    margin: 0 7px 0 7px;
    position: relative;
    top: 2px;
    width: 1px;
    height: 13px;    
}
</style>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>

</head>
<body>

<div>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

<div class="container">				
		<div class="tab-content">
			<div class="tab-pane active" id="notice">
				<div class="bodyFrame col-sm-10" style="float: none; margin: 30px auto;">
					<div class="body-title">
						<h3><span class="glyphicon glyphicon-book"></span>주문상세 내역</h3>
					</div>					
	    
	    <div class="table-responsive" style="clear: both;">
	        <div class="bbs-article">
	            <table class="table">
	                 
	                 <tbody>	                    
	                     <tr>
	                         <td colspan="2" style="height: 300px;">
	                        	   주문날짜 : ${dto.created}<br>
	                        	  가게이름 : ${dto.storeName}<br>
	                        	 가게주소 : ${dto.region} ${dto.storeAddr}<br>
	                        	 주문 메뉴 : ${dto.menuName}<br>
	                        	  주문 가격 : ${dto.price}<br>
	                        	  배송 주소 : ${dto.adrress}<br>
	                        	 결제 수단 : ${dto.payment}<br>
	                        	 요청 사항 : ${dto.coment}<br>	                        	    
	                         </td>
	                     </tr>
	                                      
	                </tbody>
	                <tfoot>
	                	<tr>
	                	   	<td align="right">
	                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/orderlist/orderlist.do?${params}';"> 목록으로 </button>
	                		</td>
	                	</tr>
	                </tfoot>
	            </table>
	       </div>
	   </div>
	</div>
	</div>	
    </div>
</div>

<div>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>


</body>
</html>