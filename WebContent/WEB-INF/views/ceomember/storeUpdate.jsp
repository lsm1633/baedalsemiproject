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
<title>점포정보 수정</title>
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
	function chkceoCodeNum() {
		var f = document.storeUpdateForm;
		var str;
		
		str = f.ceoCodeNum.value;
		
		f.action = "<%=cp%>/ceomember/update_numchk.do";
		
		f.submit();
	}
	
	function ceomemberok() {
		var f = document.storeUpdateForm;
		var str;
				
	    str = f.storeName.value;
	    if(!str) {
	        alert("가게이름을 입력하세요. ");
	        f.storeName.focus();
	        return;
	    }
	    
	    str = f.ceoCodeNum.value;
	    if(!str) {
	        alert("사업자등록번호를 입력하세요. ");
	        f.ceoCodeNum.focus();
	        return;
	    }
	    
	    str = f.storeAddr.value;
	    if(!str) {
	        alert("가게주소를 입력하세요. ");
	        f.storeAddr.focus();
	        return;
	    }
	   	    
	    str = f.storeTel.value;
	    if(!str) {
	        alert("가게 전화번호를 입력하세요. ");
	        f.storeTel.focus();
	        return;
	    }
	    
	    str = f.storeType.value;
	    if(!str) {
	        alert("가게 종류를 선택하세요. ");
	        f.storeType.focus();
	        return;
	    }  
	    	  
	    var mode="${mode}";
	    if(mode=="storeUpdate") {
	    	f.action = "<%=cp%>/ceomember/storeUpdate_ok.do";
		}

		f.submit();

	}
</script>

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
	height: 50px;
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
	height: 25px;
	padding: 0px 0px 0px 5px;
	border-radius: 3px;
	outline-color: SlateGray;
}

select {
	border-radius: 3px;
}
</style>

</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp"></jsp:include>
	</div>

	<div class="container" role="main">
		<div class="bodyFrame col-sm-10"
			style="float: none; margin-left: auto; margin-right: auto;">
			<ul class="nav nav-tabs nav-justified">
				<li><a href="<%=cp%>/storeMenu/menu.do">메뉴관리</a></li>
				<li class="active"><a href="<%=cp%>/ceomember/storeInfo.do">점포정보</a></li>
			</ul>

			<div class="body-title">
				<h3 align="left">점포정보수정</h3>
			</div>
			<hr>
		

		<div>
			<form name="storeUpdateForm" method="post"
				enctype="multipart/form-data">
				<div id=formbody>
					<div id=item>
						<%
							/*항목 컬럼 레이아웃 */
						%>
						<dl class=row01 style="border-top: 3px solid DarkSlateGrey;">

							<dd>점포명</dd>
							<dd>사업자 등록번호</dd>
							<dd>점포 주소</dd>
							<dd>점포 전화번호</dd>
							<dd>카테고리</dd>
							<dd style="border-bottom: 1px solid silver;">점포사진</dd>

						</dl>
					</div>


					<div id=input>
						<%
							/* 입력란 레이아웃 */
						%>
						<dl class=row02 style="border-top: 3px solid DarkSlateGrey;">

							<dd>
								<%
									/* 업소명 */
								%>
								<input type="text" name="storeName" value="${dto.storeName}"
									size="40">&nbsp;
							</dd>

							<dd>
								<%
									/* 사업자등록번호 */
								%>
								<input type="text" name="ceoCodeNum" size="40"
									value="${dto.ceoCodeNum}">&nbsp; <input type="button"
									name="check_bNum" class="chBtn" value="중복확인 "
									onclick="chkceoCodeNum();"><span style="color: blue;">${message1}</span>

							</dd>

							<dd>
								<%
									/* 점포 주소 */
								%>
								<select name="region">
									<option value="" selected="selected">선택&nbsp;&nbsp;</option>
									<option value="Seoul">서울</option>
									<option value="Gyeonggi">경기</option>
									<option value="Incheon">인천</option>
								</select> <input type="text" name="storeAddr" value="${dto.storeAddr}"
									size="40">
							</dd>

							<dd>
								<%
									/* 점포 전화번호 */
								%>
								<input type="text" name="storeTel" value="${dto.storeTel}"
									size="40">&nbsp;
							</dd>

							<dd>
								<%
									/* 카테고리 */
								%>
								<select name="storeType">
									<option value="" selected="selected">선택&nbsp;&nbsp;</option>
									<option value="chinese">중식</option>
									<option value="chicken">치킨</option>
									<option value="bunsik">분식</option>
									<option value="pizza">피자</option>
									<option value="jokbal">족발,보쌈</option>
									<option value="hansik">한식</option>
								</select>
							</dd>

							<dd style="border-bottom: 1px solid silver;">
								<%
									/* 가게사진등록  */
								%>
								<input type="file" name="storePhoto"
									style="height: 35px; border: 0px solid silver; line-height: 50px; padding: 0px 0px 0px 0px;">
							</dd>

						</dl>
					</div>


					<div id=footer>
						<input type="button" name="complete_btn" class="cbtn" style="height:30px;"
							value="수정완료 " onclick="ceomemberok();"> &nbsp;<input
							type="reset" class="cbtn" style="height:30px;" value="다시하기 "> &nbsp;<input
							type="button" name="complete_btn" class="cbtn" style="height:30px;" value="수정취소 "
							onclick="javascript:location.href='<%=cp%>/ceomember/storeInfo.do';">
						<input type="hidden" name="ceoId" value="${dto.ceoId}">
					</div>
				</div>
			</form>
		</div>
	</div>
	</div>




	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp"></jsp:include>
	</div>

	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>