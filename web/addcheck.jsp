<%-- 
    Document   : editcheck
    Created on : Mar 19, 2018, 12:23:57 PM
    Author     : termaat
--%>

<%@page import="com.termaat.dao.CheckDao, java.sql.Date"%>  
<jsp:useBean id="a_chk" class="com.termaat.bean.AddCheck"></jsp:useBean>  
<%--<jsp:setProperty property="*" name="chk"/>--%>
<%
java.sql.Date _checkDate = java.sql.Date.valueOf(request.getParameter("checkDate"));
int _checkTypeId = Integer.parseInt(request.getParameter("typeName"));
int _checkCategId = Integer.parseInt(request.getParameter("categName"));
String _checkName = request.getParameter("checkName");
int _checkAmt = Integer.parseInt(request.getParameter("checkAmt"));
boolean _checkCleared = false;

if (Boolean.parseBoolean(request.getParameter("isCleared"))){
    _checkCleared = true;
}

System.out.println("add Check");
System.out.println(_checkDate);
System.out.println(_checkTypeId);
System.out.println(_checkCategId);
System.out.println(_checkName);
System.out.println(_checkAmt);
System.out.println(_checkCleared);

a_chk.setCheckDate(_checkDate);
a_chk.setCheckTypeId(_checkTypeId);
a_chk.setCheckCategId(_checkCategId);
a_chk.setCheckName(_checkName);
a_chk.setCheckAmt(_checkAmt);
a_chk.setIsCleared(_checkCleared);

int i=CheckDao.addCheck(a_chk);  
response.sendRedirect("viewcheckbook.jsp");  
%>
