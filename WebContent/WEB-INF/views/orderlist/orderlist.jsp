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
<link rel="stylesheet" href="<%=cp%>/res/jquery/css/smoothness/jquery-ui.min.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/bootstrap/css/bootstrap-theme.min.css" type="text/css" />

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css" />

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
                  <h3><span class="glyphicon glyphicon-book"></span>나의 주문내역</h3>
               </div>
               
               <div>
                  <div style="clear: both; height: 25px; line-height: 25px">
                     <div style="float: left;">${dataCount}개(${page}/${total_page} 페이지)</div>                     
                  </div>
                  
                  <div class="table-responsive" style="clear: both;">
                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th class="text-center" style="width: 50px;">주문번호</th>
                                    <th class="text-center" style="width: 70px;">주문날짜</th>
                                    <th class="text-center" style="width: 70px;">점포명</th>
                                      <th class="text-center" style="width: 100px;">메뉴</th>
                                      <th class="text-center" style="width: 70px;">가격</th> 
                              <th class="text-center" style="width: 50px;">결제방식</th>                              
                           </tr>
                        </thead>
                        <tbody>
               
               <c:forEach var="dto" items="${list}">
                  <tr>
                     <td class="text-center">${dto.listNum}</td>
                     <td class="text-center">${dto.created}</td>
                     <td class="text-center">${dto.storeName}</td>
                     <td>
                        <a href='${articleUrl}&num=${dto.orderNum}'>${dto.menuName}</a>                     
                     </td>
                     <td class="text-center">${dto.price}원</td>
                     <td class="text-center">${dto.payment}</td>                     
                  </tr>
               </c:forEach>
                        </tbody>
                     </table>
                  </div>
                  
                  <div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
                     <c:if test="${dataCount==0 }">
                               등록된 게시물이 없습니다.
                       </c:if>
                         <c:if test="${dataCount!=0 }">
                           ${paging}
                       </c:if>
                  </div>
                  <c:if test="${admin==1}"> 
                   <div style="clear: both;">
                       <div style="float: left; width: 20%; min-width: 85px;">
                              <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/orderlist/orderlistadmin.do';">새로고침</button>
                       </div>                       
                    </div>
                    </c:if>
                    <c:if test="${admin!=1}"> 
                   <div style="clear: both;">
                       <div style="float: left; width: 20%; min-width: 85px;">
                              <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/orderlist/orderlist.do';">새로고침</button>
                       </div>                       
                    </div>
                    </c:if>
               </div>
            </div>
         </div>
      </div>

      <div>
         <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
      </div>
   </div>



</body>
</html>