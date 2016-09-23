<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String cp=request.getContextPath();
%>

<footer class="bs-docs-footer" role="contentinfo">
<hr>
    <div class="container">
        <ul class="bs-docs-footer-links text-muted">            
            <li><a href="<%=cp%>/intro/intro.do">배달의 나라 소개</a></li>
            <li>&middot;</li>                  
            <li><a href="<%=cp%>/term/term.do">이용약관</a></li>
            <li>&middot;</li>
            <li><a href="<%=cp%>/faq/faq.do">고객센터</a>
            <li>&middot;</li>
            <li><a href="#">제휴문의</a></li>
            <li>&middot;</li>
            <li><a href="#">가맹문의</a></li>
            <li>&middot;</li>
            <li>© 배달의나라 Corp.</li>
        </ul>
    </div>      
</footer>