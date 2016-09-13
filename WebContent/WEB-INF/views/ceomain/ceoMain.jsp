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
<title>사장님 사이트</title>
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

<script type="text/javascript">

var urlArray01 = new Array(); // 배너를 클릭했을때 옮겨질 주소
var imgArray01 = new Array(); // 배너의 갯수
function retImage01(src){
    imgRet = new Image();
    imgRet.src = src;
    return imgRet;
}

//각 배너에 대한 링크를 설정 : 여기에 추가/삭제만 하시면 됩니다
urlArray01[0] = "#";
imgArray01[0] = retImage01("<%=cp%>/res/images/banner1.PNG");
urlArray01[1] = "#";
imgArray01[1] = retImage01("<%=cp%>/res/images/banner2.PNG");

var gCounter01 = 0;
function rotateBanner01(){ // 배너 로테이트 함수
    gCounter01++;
    if(gCounter01 >= urlArray01.length)
        gCounter01 = 0;

    document.idBanner01.src = imgArray01[gCounter01].src; // 새 배너 이미지
    // 링크 바꿔주기
    document.idBanner01.onclick = function(){location.replace(urlArray01[gCounter01]);};
}

var timer = window.setInterval("rotateBanner01()", 2500); //3000-5초 시간마다 바꾸기꾸기
</script> 

</head>
<body>

<div>
<dl style="height: 150px">
    <dd>
      <jsp:include page="/WEB-INF/views/ceolayout/ceoTop.jsp"/>
    </dd>
  </dl>
</div>

       <div style="width: 300px">
              
        </div>

<div id="mainbox">
  <div>
    <dl class=bannerMain>
      <dd style="width:450px; height : 220px;">
         <%-- <img width="450" src="<%=cp%>/res/images/banner1.PNG" name="idBanner01" onClick="location.replace(urlArray01[gCounter01]);" style="cursor:pointer;" />   --%>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="<%=cp%>/res/images/banner1.PNG" style="width: 460px; height: 210px;" alt="Welcome">
    </div>
    <div class="item">
      <img src="<%=cp%>/res/images/banner2.PNG" style="width: 460px; height: 210px;"alt="Open">
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div> 
      </dd>
        
      <dd style="width:250px; ">
      <a href="<%=cp%>/ceomember/join.do">
		  <input type="image" src="<%=cp%>/res/images/ceomemberjoin.PNG" width="200" height="100"/>	 	  
	  </a>
	  <br>
	  <br>
        &emsp; &emsp; id : <input type="text" style="font-size:10pt; height: 35px; border-radius: 3px;outline-color: SlateGray; border: 1px solid silver; "> <br><br>
        &emsp;  pwd : <input type="password" style="font-size:10pt; height: 35px; border-radius: 3px;outline-color: SlateGray; border: 1px solid silver; ">
      </dd> 
      <dd>
        
        
	  <ul class="nav nav-pills">
	    <li role="presentation" class="active" style="font-size: 55pt; font-family: 'Nanum Pen Script', serif;">&nbsp;</li>
        <li role="presentation" class="navbar navbar-default navbar-fixed-top" style="font-size: 45pt; font-family: 'Nanum Pen Script', serif;"><a href="#">가게 관리</a></li>
        <li role="presentation" class="active" style="font-size: 55pt; font-family: 'Nanum Pen Script', serif;">&nbsp;</li>
        <li role="presentation" class="navbar navbar-default navbar-fixed-top" style="font-size: 45pt; font-family: 'Nanum Pen Script', serif;" ><a href="#">정산 확인</a></li> 
        <li role="presentation"  style="font-size: 45pt; font-family: 'Nanum Pen Script', serif;">&emsp;&emsp;&ensp;</li>
        <li role="presentation"  style="font-size: 35pt; font-family: 'Nanum Pen Script', serif;"><a href="#">로그인</a></li>  
      </ul>

      </dd>       
    </dl>     
  </div>   
</div>


<div align="center">
<dl style="height: 140px">
    <dd>
      <jsp:include page="/WEB-INF/views/ceolayout/ceoBottom.jsp"/>
    </dd>
  </dl>
</div>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="<%=cp%>/res/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
