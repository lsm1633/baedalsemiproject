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
* {
	margin: 0px;
	padding: 0px;
	font-family: Malgun Gothic, NanumGothic;
}

#formbody {
	width: 650px;
	margin: 0px auto;
}

#item {
	float: left;
	width: 149px;
	font-size: 10pt;
	font-weight: bold;
	text-align: left;
}

#input {
	float: left;
	width: 500px;
	font-size: 10pt;
}

#footer {
	clear: both;
	width: 650px;
	height: 100px;
	text-align: center;
}

.row01 dd {
	height: 50px;
	background: #DCDCDC;
	border-right: 1px solid silver;
	border-bottom: 1px solid silver;
	text-align: center;
	line-height: 50px;
}

.row02 dd {
	height: 50px;
	padding: 0px 0px 0px 20px;
	border-bottom: 1px solid silver;
	line-height: 50px;
}

.chBtn {
	width: 65px;
	height: 25px;
	line-height: 25px;
	padding: 0px auto;
	border: 1px solid SlateGray;
	outline: 0;
	color: SlateGray;
	text-align: center;
	background: #FFFFFF;
	cursor: pointer;
}

.chBtn:hover {
	background: royalblue;
	color: #FFFFFF;
}

input {
	border: 1px solid silver;
	padding: 0px 0px 0px 5px;
	border-radius: 3px;
	outline-color: SlateGray;
}

select {
	border-radius: 3px;
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
					
					<div id=formbody>
				<div id=item>
					<%
						/*항목 컬럼 레이아웃 */
					%>
					<dl class=row01 style="border-top: 3px solid DarkSlateGrey;">

						<dd>주문날짜</dd>
						<dd>점포 이름</dd>
						<dd>점포 주소</dd>
						<dd>점포 전화번호</dd>
						<dd>주문 메뉴</dd>
						<dd>가격</dd>
						<dd>배송 주소</dd>
						<dd>결제 수단</dd>						
						<dd style="border-bottom: 1px solid silver;">요청 사항</dd>

					</dl>
				</div>


				<div id=input>
					<%
						/* 입력란 레이아웃 */
					%>
					<dl class=row02 style="border-top: 3px solid DarkSlateGrey;">

						<dd>
							<%/* 주문 날짜 */%>
							${dto.created}
						</dd>

						<dd>
							<%/* 점포이름 */%>
							${dto.storeName}
						</dd>

						<dd>
							<%/* 점포 주소 */%>
							${dto.region}&nbsp;${dto.storeAddr}
						</dd>

						<dd>
							<%/* 점포 전화번호 */%>
							${dto.storeTel}
						</dd>

						<dd>
							<%/* 주문메뉴 */%>
							${dto.menuName}
						</dd>

						<dd>
							<%/* 가격 */%>
							${dto.price}원
						</dd>
						
						<dd>
							<%/* 배송주소 */%>
							${dto.adrress}
						</dd>
						
						<dd>
							<%/* 결제수단 */%>
							${dto.payment}
						</dd>
						
						<dd>
							<%/* 요청사항 */%>
							${dto.coment}
						</dd>

					</dl>
				</div>
					
				<div id=footer>
					<input type="button" name="complete_btn" class="cbtn" value="목록으로 "
						onclick="javascript:location.href='<%=cp%>/orderlist/orderlist.do?${params}';">
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