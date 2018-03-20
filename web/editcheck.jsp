<%-- 
    Document   : editcheck
    Created on : Mar 19, 2018, 12:23:57 PM
    Author     : termaat
--%>

<%@page import="com.termaat.dao.CheckDao"%>  
<jsp:useBean id="chk" class="com.termaat.bean.Check"></jsp:useBean>  
<jsp:setProperty property="*" name="chk"/>  
<%  
int i=CheckDao.update(chk);  
response.sendRedirect("viewcheckbook.jsp");  
%>
