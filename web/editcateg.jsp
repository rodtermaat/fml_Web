<%-- 
    Document   : editcateg
    Created on : Mar 30, 2018, 3:46:59 PM
    Author     : termaat
--%>

<%@page import="com.termaat.dao.CheckDao, java.sql.Date"%>  
<jsp:useBean id="e_cat" class="com.termaat.bean.ManageCateg"></jsp:useBean>  
<%--<jsp:setProperty property="*" name="e_cat"/>--%>
<%
int _categId= Integer.parseInt(request.getParameter("categId"));
String _categName = request.getParameter("categName");
String _categBudgFrq = request.getParameter("categBudgFrq");
String s_categBudgFrq = _categBudgFrq.toUpperCase();
int _categBudgAmt = Integer.parseInt(request.getParameter("categBudgAmt"));

if (_categBudgAmt < 0){
    _categBudgAmt = _categBudgAmt*-1;
}

System.out.println(_categId);
System.out.println(_categName);
System.out.println(_categBudgAmt);
System.out.println(_categBudgFrq);

e_cat.setCategId(_categId);
e_cat.setCategName(_categName);
e_cat.setCategBudgAmt(_categBudgAmt);
e_cat.setCategBudgFrq(s_categBudgFrq);

int i=CheckDao.updateCategory(e_cat);  
response.sendRedirect("viewcategories.jsp");  
%>
