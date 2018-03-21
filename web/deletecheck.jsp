<%-- 
    Document   : deletecheck
    Created on : Mar 19, 2018, 12:26:07 PM
    Author     : termaat
--%>

<%@page import="com.termaat.dao.CheckDao"%>  
<jsp:useBean id="chk" class="com.termaat.bean.Check"></jsp:useBean>  
<jsp:setProperty property="*" name="chk"/>  
<%  
System.out.println(chk.getCheckId());
CheckDao.delete(chk);  
response.sendRedirect("viewcheckbook.jsp");  
%>
