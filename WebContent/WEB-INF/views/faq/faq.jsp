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
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne" aria-expanded="true"
										aria-controls="collapseOne"> 아이디 비밀번호를 잊어버렸어요. </a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">배달의민족 회원정보에 대한 모든 걸 알려드립니다!<br>
								[닉네임, 프로필 사진 변경 방법]<br>
								기타>회원정보 수정 에서 변경하실 수 있어요.<br>
								닉네임을 설정하지 않으면, 아이디가 닉네임으로 사용됩니다.<br><br>
								
								[아이디/비밀번호 찾는 방법]<br>
								기타>로그인 박스 [비밀번호찾기] 메뉴에서 아이디를 입력하시면 가입하실 때 등록하신 이메일로 임시번호를 발급해 드립니다.<br>
								만약 아이디가 생각나지 않으시는 분들도 [문의하기] 메뉴로 문의해주세요.<br><br>
								
								[아이디 변경]<br>
								아이디 변경은 불가합니다.<br>
								그래도 꼭 변경이 필요하다면, 탈퇴 처리 후에 새로운 아이디로 가입하셔야 합니다.<br><br>
								
								[회원 탈퇴]<br>
								7.1.2 버전부터는 어플리케이션 내 내정보수정에서 회원탈퇴 기능을 지원합니다.<br>
								6.9.1 이하 버전 사용자라면 업데이트 후 회원탈퇴가 가능합니다. VHS.</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										Collapsible Group Item #2 </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven't heard of
									them accusamus labore sustainable VHS.</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										Collapsible Group Item #3 </a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven't heard of
									them accusamus labore sustainable VHS.</div>
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

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>


</body>
</html>