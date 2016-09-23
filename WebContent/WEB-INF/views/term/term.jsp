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
<title>배달의 나라 이용약관</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

</style>
<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>

<style type="text/css">
#mainbox{
   width:800px;
   height:350px;
   margin:10px auto;
   text-align: center;
}
.bannerMain dd{
  float:left;
}
</style>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
@import url(http://fonts.googleapis.com/earlyaccess/kopubbatang.css);
</style>
</head>
<body>
<div class="container">

<div>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

<div style="height: 500px">
<h1><b>이용약관</b></h1>
	<div class="col-xs-12">
					<textarea class="form-control" readonly rows="20" cols="150">제1조(목적)
이 약관은 주식회사 배달의 나라(전자거래 사업자)이 운영하는 홈페이지(이하 "홈페이지"라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버홈페이지과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」	
제 7 조 (전자금융거래 기록의 생성 및 보존)
① “회사”는 “이용자”가 이용한 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
② 제1항의 규정에 따라 “회사”가 보존하여야 하는 기록의 종류 및 보존방법은 아래 각 호와 같습니다.
1. 제1항의 대상이 되는 거래내용 중 대상기간이 5년인 것은 다음 각호와 같습니다.
가. 전자금융거래의 종류(보험계약의 경우에는 보험계약의 종류를 말한다) 및 금액, 전자금융거래의 상대방에 관한 정보
나. 전자금융거래의 거래일시, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보
다. 전자금융거래가 계좌를 통하여 이루어지는 경우 거래계좌의 명칭 또는 번호(보험계약의 경우에는 보험증권번호를 말한다)
라. “회사”가 전자금융거래의 대가로 받은 수수료
마. 회원의 출금 동의에 관한 사항
바. 해당 전자금융거래와 관련한 전자적 장치의 접속기록
사. 전자금융거래의 신청 및 조건의 변경에 관한 사항
아. 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록
2. 제1항의 대상이 되는 거래내용 중 대상기간이 1년인 것은 다음 각호와 같습니다.
가. 건당 거래금액이 1만원 이하인 전자금융거래에 관한 기록
나. 전자지급수단 이용과 관련된 거래승인에 관한 기록
다. “이용자”의 오류정정 요구사실 및 처리결과에 관한 사항</textarea>
				</div>    
</div>

<div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

</div>
</body>
</html>