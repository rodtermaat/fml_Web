<%-- 
    Document   : editcheck
    Created on : Mar 19, 2018, 12:23:57 PM
    Author     : termaat
--%>

<%@page import="com.termaat.dao.CheckDao, java.sql.Date"%>  
<jsp:useBean id="e_chk" class="com.termaat.bean.EditCheck"></jsp:useBean>  
<%--<jsp:setProperty property="*" name="chk"/>--%>
<%
int _checkId= Integer.parseInt(request.getParameter("checkId"));
java.sql.Date _checkDate = java.sql.Date.valueOf(request.getParameter("checkDate"));
int _checkTypeId = Integer.parseInt(request.getParameter("typeName"));
int _checkCategId = Integer.parseInt(request.getParameter("categName"));
String _checkName = request.getParameter("checkName");
int _checkAmt = Integer.parseInt(request.getParameter("checkAmt"));
boolean _checkCleared = false;

if (Boolean.parseBoolean(request.getParameter("isCleared"))){
    _checkCleared = true;
}

System.out.println(_checkId);
System.out.println(_checkDate);
System.out.println(_checkTypeId);
System.out.println(_checkCategId);
System.out.println(_checkName);
System.out.println(_checkAmt);
System.out.println(_checkCleared);

e_chk.setCheckId(_checkId);
e_chk.setCheckDate(_checkDate);
e_chk.setCheckTypeId(_checkTypeId);
e_chk.setCheckCategId(_checkCategId);
e_chk.setCheckName(_checkName);
e_chk.setCheckAmt(_checkAmt);
e_chk.setIsCleared(_checkCleared);

int i=CheckDao.updateCheck(e_chk);  
response.sendRedirect("viewcheckbook.jsp");  
%>
