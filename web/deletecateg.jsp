<%-- 
    Document   : deletecateg
    Created on : Mar 30, 2018, 9:45:38 PM
    Author     : termaat
--%>

<%@page import="com.termaat.dao.CheckDao"%>  
<jsp:useBean id="d_cat" class="com.termaat.bean.ManageCateg"></jsp:useBean>  
<jsp:setProperty property="*" name="d_cat"/>  
<%  
System.out.println(d_cat.getCategId());
CheckDao.deleteCateg(d_cat);  
response.sendRedirect("viewcategories.jsp");  
%>
