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
<title>배달의 나라</title>
<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css" />

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/res/js/util.js"></script>
<script type="text/javascript">
    function check() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

    	var mode="${mode}";
    	if(mode=="created")
    		f.action="<%=cp%>/notice/created_ok.do";
    	else if(mode=="update")
    		f.action="<%=cp%>/notice/update_ok.do";

    	// image 버튼, submit은 submit() 메소드 호출하면 두번전송
        return true;
    }
<c:if test="${mode='update'}" >
	function deleteFile(num) {
		var url="<%=cp%>/notice/deleteFile.do?num="+num+"&page=${page}";
		location.href=url;
	}
</c:if>
</script>
</head>
<body>

	<div class="layoutHeader">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
	
<div class="layoutMain">
	<div class="container" role = "main">
		<ul class="nav nav-tabs nav-justified">
			<li class="active"><a href="<%=cp%>/notice/notice.do"
				data-toggle="tab">공지사항</a></li>
			<li><a href="<%=cp%>/freeboard/freeboard.do" data-toggle="tab">자유게시판</a></li>
			<li><a href="<%=cp%>/qna/qna.do" data-toggle="tab">질문과답변</a></li>
			<li><a href="<%=cp%>/faq/faq.do" data-toggle="tab">자주묻는질문</a></li>
		</ul>
		
		<div class="tab-content">
			<div class="tab-pane active" id="notice">
				<div class="bodyFrame col-sm-10" style="float: none; margin: 30px auto;">
					
					<div class="body-title">
						<h3><span class="glyphicon glyphicon-book"></span>공지사항</h3>
					</div>
					
					<div class="alert alert-info">
						<i class="glyphicon glyphicon-pencil"> 배달의 나라의 중요한 이벤트와 공지사항을 확인 하세요!!</i>
					</div>
	
	<div class="layoutBody">
		<div style="min-height: 450px;">
				<div style="width:100%;	height: 40px; line-height:40px;clear: both; border-top: 1px solid #DAD9FF;border-bottom: 1px solid #DAD9FF;">
				    <div style="width:600px; height:30px; line-height:30px; margin:5px auto;">
				        <img src="<%=cp%>/res/images/arrow.gif" alt="" style="padding-left: 5px; padding-right: 5px;">
				        <span style="font-weight: bold;font-size:13pt;font-family: 나눔고딕, 맑은 고딕, 굴림;">공지사항</span>
				    </div>
				</div>
			
				<div style="margin: 10px auto; margin-top: 20px; width:600px; min-height: 400px;">
		
					<form name="boardForm" method="post" onsubmit="return check();" enctype="multipart/form-data">
					  <table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
					  <tr><td colspan="2" height="3" bgcolor="#507CD1"></td></tr>
					
					  <tr align="left" height="40"> 
					      <td width="100" bgcolor="#EEEEEE" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					      <td width="500" style="padding-left:10px;"> 
					        <input type="text" name="subject" size="75" maxlength="100" class="boxTF" value="${dto.subject}">
					      </td>
					  </tr>
					  <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>
					  
					  <tr align="left" height="40" style="border-bottom: 1px solid #ccc"> 
					      <td width="100" bgcolor="#EEEEEE" style="text-align: center;">작 성 자</td>
					      <td width="300" style="padding-left:10px;"> 
					      ${sessionScope.member.userName}
					      </td>
					  </tr>
					  <tr align="left" height="40">
					      <td width="100" bgcolor="#EEEEEE" style="text-align: center;">공지여부</td>
					      <td width="100" style="padding-left: 10px">
					      	<div>
					      		<label>
					      			<input type="checkbox" name="notice" value="1" ${dto.notice==1 ? "checked='checked' ":"" }> 공지
					      		</label>
					      	</div>
					      </td>
					  </tr>
				      <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>
				      
					  <tr align="left"> 
					      <td width="100" bgcolor="#EEEEEE" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					      <td width="500" valign="top" style="padding:5px 0px 5px 10px;"> 
					        <textarea name="content" cols="75" rows="12" class="boxTA">${dto.content}</textarea>
					      </td>
					  </tr>
				      <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>
					  <tr align="left" height="35px" style="line-height: 35px">
					      <td bgcolor="#EEEEEE" style="text-align: center;">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
					      <td style="padding-left:10px;"> 
		                      <input type="file" name="upload" class="boxTF" size="61" style="height: 35px;">			           
					       </td>
					  </tr> 
					  
					  <c:if test="${mode=='update'}">
		                    <tr> 
		                        <td class="td1">첨부된파일</td>
		                        <td colspan="3" class="td3"> 
		                            <c:if test="${not empty dto.saveFilename}">
		                                ${dto.originalFilename}
		                                | <a href="javascript:deleteFile('${dto.num}');">삭제</a>
		                            </c:if>	        
		                        </td>
		                    </tr>
		         	 </c:if>	
		         	 
		         	  <tfoot>
	                        <tr>
	                            <td colspan="4" style="text-align: center; padding-top: 15px;">
	                                  <button type="submit" class="btn btn-primary"> 확인 <span class="glyphicon glyphicon-ok"></span></button>
	                                  <button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/notice/notice.do';"> 취소 </button>
	                                  
	                                  <c:if test="${mode=='update'}">
	                                      <input type="hidden" name="num" value="${dto.num}">
	                                      <input type="hidden" name="filesize" value="${dto.filesize}">
	                                      <input type="hidden" name="saveFilename" value="${dto.saveFilename}">
	                                      <input type="hidden" name="originalFilename" value="${dto.originalFilename}">
	                                      <input type="hidden" name="page" value="${page}">
	                                  </c:if>
	                            </td>
	                        </tr>
	                    </tfoot>	

					  <tr><td colspan="2" height="3" bgcolor="#507CD1"></td></tr>
					  </table>
					</form>
				</div>
			</div>
			</div>
		</div>
		</div>
	</div>
 </div>
	
	<div class="layoutFooter">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>
</div>

</body>
</html>