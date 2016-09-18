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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>배달의 나라</title>
<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/res/jquery/js/jquery-1.12.3.min.js"></script>


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

<table>
   <col width="50" />
   <col width="" />
    <tr> 
       <td>Q</td>
        <td>
            <a href='javascript:viewContent(3)'>사이트의 이름은 무엇인가요?</a>
        </td>
    </tr>
   <tr style="display:none" id="content3">
      <td colspan=2>
         <div style="float:left;width:33px;text-align:center;">A</div>
         <div style="float:left;margin-left:10px;width:660px;">
         <span style="background: rgb(255, 255, 255); font-size: 11pt; mso-fareast-font-family: 함초롬바탕">배달의 나라입니다.</span><br>
         <span style="background: rgb(255, 255, 255); font-size: 11pt; mso-fareast-font-family: 함초롬바탕">배달해요.</span>
         </div>
         <div class="clear"></div>
      </td>
   </tr>
    
    <tr> 
        <td>Q</td>
        <td>
            <a href='javascript:viewContent(2)'>무엇을하는 사이트인가요?</a>
        </td>
    </tr>
    
   <tr style="display:none" id="content2">
      <td colspan=2 class="content">
         <div style="float:left;width:33px;text-align:center;">A</div>
         <div style="float:left;margin-left:10px;width:660px;">
         <span style="background: rgb(255, 255, 255); font-size: 11pt; mso-fareast-font-family: 함초롬바탕">인터넷배달주문 사이트입니다.</span>
         </div>
         <div class="clear"></div>
      </td>
   </tr>
   
    <tr> 
        <td>Q</td>
        <td>
            <a href='javascript:viewContent(1)'>앞으로 고쳐질건가요?</a>        
        </td>
    </tr>
    
   <tr style="display:none" id="content1">
      <td colspan=2 class="content">
         <div style="float:left;width:33px;text-align:center;">A</div>
         <div style="float:left;margin-left:10px;width:660px;">
         <span style="background: rgb(255, 255, 255); font-size: 11pt; mso-fareast-font-family: 함초롬바탕">계속 고칠겁니다.</span>
         </div>
         <div class="clear"></div>
      </td>
   </tr>        
    </table>
    
   <script>
   var pnum = "";
   function viewContent(id){
      var v = document.getElementById("content"+id);
      var p = document.getElementById("content"+pnum);
      
   
      if(pnum == ""){
         v.style.display = "";
         pnum = id;
      }else if(pnum == id){
         v.style.display = "none";
         pnum = "";
      }else{
         p.style.display = "none";
         v.style.display = "";
         pnum = id;
      }
   }
   </script>



<div>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

</div>



</body>
</html>