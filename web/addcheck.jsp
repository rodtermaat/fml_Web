<%-- 
    Document   : editcheck
    Created on : Mar 19, 2018, 12:23:57 PM
    Author     : termaat
--%>

<%@page import="com.termaat.dao.CheckDao, java.sql.Date"%>  
<jsp:useBean id="a_chk" class="com.termaat.bean.AddCheck"></jsp:useBean>  
<%--<jsp:setProperty property="*" name="chk"/>--%>
<%
String s_userId = session.getAttribute("userId").toString();
int userId = Integer.valueOf(s_userId);
java.sql.Date _checkDate = java.sql.Date.valueOf(request.getParameter("checkDate"));
String _checkType = request.getParameter("typeName");
int _checkCategId = Integer.parseInt(request.getParameter("categName"));
String _checkName = request.getParameter("checkName");
int _checkAmt = Integer.parseInt(request.getParameter("checkAmt"));
boolean _checkCleared = false;

if (Boolean.parseBoolean(request.getParameter("isCleared"))){
    _checkCleared = true;
}

if (_checkType.equals("credit") && _checkAmt < 0){
    _checkAmt = _checkAmt*-1;
}
if (_checkType.equals("debit")&& _checkAmt > 0){
    _checkAmt = _checkAmt*-1;
}

System.out.println("add Check");
System.out.println(_checkDate);
System.out.println(_checkType);
System.out.println(_checkCategId);
System.out.println(_checkName);
System.out.println(_checkAmt);
System.out.println(_checkCleared);

a_chk.setCheckDate(_checkDate);
a_chk.setCheckType(_checkType);
a_chk.setCheckCategId(_checkCategId);
a_chk.setCheckName(_checkName);
a_chk.setCheckAmt(_checkAmt);
a_chk.setIsCleared(_checkCleared);

int i=CheckDao.addCheck(a_chk, userId);  
response.sendRedirect("viewcheckbook.jsp");  
%>
