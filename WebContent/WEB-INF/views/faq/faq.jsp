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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>배달의 나라</title>
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


</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div class="container">

		<ul class="nav nav-tabs nav-justified">
			<li><a href="<%=cp%>/notice/notice.do">공지사항</a></li>
			<li><a href="<%=cp%>/freeboard/freeboard.do">자유게시판</a></li>
			<li><a href="<%=cp%>/qna/qna.do">질문과답변</a></li>
			<li class="active"><a href="<%=cp%>/faq/faq.do">자주묻는질문</a></li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane active" id="faq">
				<div class="bodyFrame col-sm-10"
					style="float: none; margin: 30px auto;">
					<div class="body-title">
						<h3>
							<span class="glyphicon glyphicon-book"></span>자주묻는 질문 (FAQ)
						</h3>
					</div>
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h3 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne" aria-expanded="true"
										aria-controls="collapseOne"> 아이디 비밀번호를 잊어버렸어요. </a>
								</h3>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body" style="padding: 30px  30px">
									배달의민족 회원정보에 대한 모든 걸 알려드립니다!<br>
									<br> [닉네임, 프로필 사진 변경 방법]<br> 기타>회원정보 수정 에서 변경하실 수
									있어요.<br> 닉네임을 설정하지 않으면, 아이디가 닉네임으로 사용됩니다.<br>
									<br> [아이디/비밀번호 찾는 방법]<br> 기타>로그인 박스 [비밀번호찾기] 메뉴에서
									아이디를 입력하시면 가입하실 때 등록하신 이메일로 임시번호를 발급해 드립니다.<br> 만약 아이디가
									생각나지 않으시는 분들도 [문의하기] 메뉴로 문의해주세요.<br>
									<br> [아이디 변경]<br> 아이디 변경은 불가합니다.<br> 그래도 꼭 변경이
									필요하다면, 탈퇴 처리 후에 새로운 아이디로 가입하셔야 합니다.<br>
									<br> [회원 탈퇴]<br> 7.1.2 버전부터는 어플리케이션 내 내정보수정에서 회원탈퇴
									기능을 지원합니다.<br> 6.9.1 이하 버전 사용자라면 업데이트 후 회원탈퇴가 가능합니다.
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo"> 회원탈퇴를
										하고 싶어요. 어떻게 해야하나요? </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body" style="padding: 30px  30px">
									회원 탈퇴는 <br> 배달의 나라 로그인 후 우측 상단 정보수정클릭 > 비밀번호 입력 > 화면 아래쪽에
									회원탈퇴 버튼이 있습니다.<br>
									<br> 탈퇴한 아이디계정으로는 재가입이 안되며 주문내역 등 모든 정보가 사라집니다..ㅠㅠ<br>
									<br> 신중하게 결정하여 탈퇴부탁드립니다.
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree"> 게시글
										수정/삭제는 어떻게 하나요? </a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body" style="padding: 30px  30px">
									리뷰 작성한 계정으로 로그인하시면 리뷰를 수정 삭제하실 수 있습니다.<br>
									<br> 작성한 글을 간단하게 확인하는 방법!<br> 자유게시판 클릭 > 하단에 자신의 이름으로
									작성자 검색하시면 보다 빠르게 자신의 글을 확인할 수 있습니다.<br>
									<br> [수정 / 삭제 방법]<br>
									<br> 자신의 글 클릭 > 하단에 수정 / 삭제 버튼을 클릭하시면<br> 수정 / 삭제가
									가능합니다. <br><br>
									자신의 게시글을 삭제하시면 댓글 및 답글도 같이 삭제됩니다.
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFour">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapseFour"
										aria-expanded="false" aria-controls="collapseFour"> 장바구니 사용 방법을 알려주세요! </a>
								</h4>
							</div>
							<div id="collapseFour" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingFour">
								<div class="panel-body" style="padding: 30px  30px">장바구니는 주문할 메뉴들을 임시로 보관하는 기능입니다.<br><br>
								배달업소에서 보여주는 메뉴 목록화면에서 우측에 장바구니화면이 있어 메뉴를 누르게되면 장바구니에
								보관할 수 있습니다.<br>
								장바구니에는 한 업소에서 고른 메뉴들만 보관할 수 있습니다.
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>


</body>
</html>