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
<title>${title}</title>

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
function check(){
	var f = document.menuForm;
	
	var str = f.cate.value;
	if(!str){
		f.subject.focus();
		return false;
	}
	
	str = f.name.value;
	if(!str) {
        f.name.focus();
        return false;
    }
	
	str = f.price.value;
	if(!str) {
        f.price.focus();
        return false;
    }
	if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel.focus();
        return;
    }
	
	str = f.content.value;
	if(!str) {
        f.content.focus();
        return false;
    }
	
	var mode="${mode}";
	  if(mode=="created"||mode=="update" && f.upload.value!="") {
		if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
			alert('이미지 파일만 가능합니다. !!!');
			f.upload.focus();
			return false;
		}
	  }
    
	  if(mode=="created")
		f.action="<%=cp%>/storeMenu/menuCreated_ok.do";
	  else if(mode=="update")
		f.action="<%=cp%>/storeMenu/update_ok.do";

		return true;
	}
</script>
</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp"></jsp:include>
	</div>

	<div class="container" role="main">
		<div class="bodyFrame col-sm-10"
			style="float: none; margin-left: auto; margin-right: auto;">
			<ul class="nav nav-tabs nav-justified">
				<li class="active"><a href="<%=cp%>/storeMenu/menu.do">메뉴관리</a></li>
				<li><a href="<%=cp%>/ceomember/storeInfo.do">점포정보</a></li>
			</ul>
			<div class="body-title">
				<h3 align="left"><span class="glyphicon glyphicon-th"></span> 메뉴관리</h3>
			</div>
			<hr>

			<div class="tab-content">
				<div class="tab-pane active" id="notice">
					<div class="bodyFrame col-sm-10"
						style="float: none; margin: 30px auto;">
						<div class="body-title">
							<h2>${dto.name}</h2>
						</div>

						<form name="menuForm" method="post" onsubmit="return check();"
							enctype="multipart/form-data">
							<div class="bs-write">
								<table class="table">
									<tbody>

										<tr>
											<td class="td1">음식카테고리</td>
											<td><select name="cate" required="required">
													<option value="set" selected>세트</option>
													<option value="main">주 메뉴</option>
													<option value="side">부 메뉴</option>
											</select></td>
										</tr>


										<tr>
											<td class="td1">메뉴이름</td>
											<td colspan="3" class="td3"><input type="text"
												name="name" class="form-control input-sm"
												value="${dto.name}" required="required"></td>
										</tr>

										<tr>
											<td class="td2">메뉴가격</td>
											<td colspan="3" class="td3"><input type="text"
												name="price" class="form-control input-sm"
												value="${dto.price}" required="required"></td>
										</tr>

										<tr>
											<td class="td1" colspan="4" style="padding-bottom: 0px;">메뉴소개</td>
										</tr>
										<tr>
											<td colspan="4" class="td4"><textarea name="content"
													class="form-control" rows="7" required="required">${dto.content}</textarea>
											</td>
										</tr>

										<tr>
											<td class="td1">메뉴사진</td>
											<td colspan="3" class="td3"><input type="file"
												name="upload" class="form-control input-sm"></td>
										</tr>

										<c:if test="${mode=='update'}">
											<tr>
												<td class="td1">등록이미지</td>
												<td colspan="3" class="td3"><img
													src="<%=cp%>/uploads/${dto.ceoId}/menu/${dto.imageFilename}"
													width="30" height="30" border="0"
													onclick="imageViewer('<%=cp%>/uploads/${dto.ceoId}/menu/${dto.imageFilename}');"
													style="cursor: pointer;"></td>
											</tr>
										</c:if>

									</tbody>
									<tfoot>
										<tr>
											<td colspan="4"
												style="text-align: center; padding-top: 15px;">
												<button type="submit" class="btn btn-primary">
													<span class="glyphicon glyphicon-ok"> 확인</span>
												</button> &nbsp;&nbsp;&nbsp;
												<button type="button" class="btn btn-danger"
													onclick="javascript:location.href='<%=cp%>/storeMenu/menu.do';">
													<span class="glyphicon glyphicon-remove"> 취소</span>
												</button> <c:if test="${mode=='update'}">
													<input type="hidden" name="num" value="${dto.num}">
													<input type="hidden" name="ceoId" value="${dto.ceoId}">
													<input type="hidden" name="imageFilename"
														value="${dto.imageFilename}">
													<input type="hidden" name="page" value="${page}">
												</c:if>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>


						</form>
					</div>
				</div>
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