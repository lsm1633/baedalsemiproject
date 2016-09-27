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
<title>회원 탈퇴</title>
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

<script type="text/javascript">
function leaveOk(){
	var f = document.leaveForm;
	var str;
	
	str = f.agree.checked;
    if(str==""){
    	alert("체크안했어요")
    	return;
    }
    
    f.action = "<%=cp%>/ceomember/quit_ok.do"
    
    f.submit();
    	
}

</script>

</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp" />
	</div>



	<div class="container" role="main">
		<div class="page-header">
			<h1>점주계정 탈퇴</h1>
		</div>
		<div class="col-md-7 col-md-offset-3">

			<div>
				<p>점주탈퇴에 앞서 아래의 사항을 반드시 확인하시기 바랍니다.</p>
				<ol>
					<li>탈퇴 후 재가입 시, 제한을 받을 수 있습니다.</li>
					<li>탈퇴한 계정의 배달의나라 <strong>이용기록은 모두 삭제</strong>됩니다. <strong>삭제된
							데이터는 복구가 불가</strong>합니다. (단, 작성된 리뷰와 결제 내역은 5년까지 보관) <br>- 삭제되는 이용 기록
						: 아이디, 이메일, 휴대폰 번호, 주문이력, 관심지역(앱), 포인트, 쿠폰, 간단결제카드정보(앱), OK캐쉬백 이력
					</li>
					<li>한 번 탈퇴한 아이디는 <strong>동일 아이디로 재가입하거나, 복구하는 것이 불가능</strong>하오니,
						탈퇴 시 유의하시기 바랍니다.
					</li>
					<li>배달의나라와 사장님사이트 계정이 동일할 경우, 사장님사이트 계정만 삭제됩니다. 배달의나라 회원 탈퇴는
						배달의나라에서 가능합니다.</li>
				</ol>
			</div>

			<hr>
			<form name="leaveForm" role="form">
				<div class="form-group" align="center">
					<label>정말 탈퇴하시겠습니까?</label>
					<div class="checkbox">
						<label> <input id="agree"
							type="radio" name="agree" id="agree" value="1" /> 네, 탈퇴하겠습니다.
						</label>
					</div>
				</div>
			</form>

			<div class="form-group text-center" style="margin-top: 30px">
				<input type="button" value=" 탈퇴하기 " class="btn btn-info"
					onclick="leaveOk();" /> <input type="button" value=" 탈퇴취소  "
					class="btn btn-warning"
					onclick="javascript:location.href='<%=cp%>/ceomain/ceomain.do'">
			</div>
		</div>

	</div>





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