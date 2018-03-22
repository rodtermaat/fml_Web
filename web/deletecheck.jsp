<%-- 
    Document   : deletecheck
    Created on : Mar 19, 2018, 12:26:07 PM
    Author     : termaat
--%>

<%@page import="com.termaat.dao.CheckDao"%>  
<jsp:useBean id="v_chk" class="com.termaat.bean.ViewCheck"></jsp:useBean>  
<jsp:setProperty property="*" name="v_chk"/>  
<%  
System.out.println(v_chk.getCheckId());
CheckDao.deleteCheck(v_chk);  
response.sendRedirect("viewcheckbook.jsp");  
%>
