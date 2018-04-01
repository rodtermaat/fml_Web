<%-- 
    Document   : addcateg
    Created on : Mar 30, 2018, 10:00:41 PM
    Author     : termaat
--%>

<%@page import="com.termaat.dao.CheckDao, java.sql.Date"%>  
<jsp:useBean id="a_cat" class="com.termaat.bean.ManageCateg"></jsp:useBean>  
<%--<jsp:setProperty property="*" name="a_cat"/>--%>
<%
String s_userId = session.getAttribute("userId").toString();
int userId = Integer.valueOf(s_userId);
String _categName = request.getParameter("categName");
String _categBudgFrq = request.getParameter("categBudgFrq");
String s_categBudgFrq = _categBudgFrq.toUpperCase();
int _categBudgAmt = Integer.parseInt(request.getParameter("categBudgAmt"));

if (_categBudgAmt < 0){
    _categBudgAmt = _categBudgAmt*-1;
}

System.out.println(_categName);
System.out.println(_categBudgAmt);
System.out.println(_categBudgFrq);

a_cat.setCategName(_categName);
a_cat.setCategBudgAmt(_categBudgAmt);
a_cat.setCategBudgFrq(s_categBudgFrq);

int i=CheckDao.addCateg(a_cat, userId);  
response.sendRedirect("viewcategories.jsp");

%>
