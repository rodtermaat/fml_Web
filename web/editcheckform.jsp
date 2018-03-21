<%-- 
    Document   : editcheckform
    Created on : Mar 19, 2018, 8:49:13 PM
    Author     : termaat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>edit transaction</title>  
</head>  
<body>  
<%@page import="com.termaat.dao.CheckDao,com.termaat.bean.Check"%>  
  
<%  
String id=request.getParameter("id");  
Check chk=CheckDao.getRecordById(Integer.parseInt(id));  
%>  
  
<h1>edit checkbook</h1> 
<%
System.out.println(chk.getCheckId());
System.out.println(chk.getCheckDate());
System.out.println(chk.getTypeName());
System.out.println(chk.getCategName());
System.out.println(chk.getCheckName());
System.out.println(chk.getCheckAmt());
System.out.println(chk.getIsCleared());
%>
<form action="editcheck.jsp" method="post">  
<input type="hidden" name="checkId" value="<%=chk.getCheckId() %>"/>  
<table>  
<tr><td>date:</td><td>
<input type="date" class="date"  name="checkDate" value="<%= chk.getCheckDate()%>"/></td></tr>  
<tr><td>type:</td><td>
<% if(chk.getTypeName().toString().equals("income")) {%>
    <input type="radio" name="typeName" value="1" checked="checked"/>income
<%} else { %>
    <input type="radio" name="typeName" value="1"/>income
<% } %>

<% if(chk.getTypeName().toString().equals("bills")) {%>
    <input type="radio" name="typeName" value="2" checked="checked"/>bills
<%} else { %>
    <input type="radio" name="typeName" value="2"/>bills
<% } %>

<% if(chk.getTypeName().toString().equals("unplanned expense")) {%>
    <input type="radio" name="typeName" value="3" checked="checked"/>unplanned expense
<%} else { %>
    <input type="radio" name="typeName" value="3"/>unplanned expense
<% } %>

<% if(chk.getTypeName().toString().equals("budget")) {%>
    <input type="radio" name="typeName" value="4" checked="checked"/>budgeted expense
<%} else { %>
    <input type="radio" name="typeName" value="4"/>budgeted expense
<% } %>

<% if(chk.getTypeName().toString().equals("savings")) {%>
    <input type="radio" name="typeName" value="5" checked="checked"/>savings</td></tr>  
<%} else { %>
    <input type="radio" name="typeName" value="5"/>savings</td></tr>
<% } %>

<tr><td>category:</td><td>  
<% if(chk.getCategName().toString().equals("account")) {%>
    <input type="radio" name="categName" value="1" checked="checked"/>account
<% } else { %>
    <input type="radio" name="categName" value="1"/>account
<% } %>

<% if(chk.getCategName().toString().equals("house")) {%>
    <input type="radio" name="categName" value="2" checked="checked"/>house
<% } else { %>
    <input type="radio" name="categName" value="2"/>house
<% } %>

<% if(chk.getCategName().toString().equals("living")) {%>
    <input type="radio" name="categName" value="3" checked="checked"/>living
<% } else { %>
    <input type="radio" name="categName" value="3"/>living
<% } %>

<% if(chk.getCategName().toString().equals("debt")) {%>
    <input type="radio" name="categName" value="4" checked="checked"/>debt
<% } else { %>
    <input type="radio" name="categName" value="4"/>debt
<% } %>

<% if(chk.getCategName().toString().equals("salary")) {%>
    <input type="radio" name="categName" value="5" checked="checked"/>salary
<% } else { %>
    <input type="radio" name="categName" value="5"/>salary
<% } %>

<% if(chk.getCategName().toString().equals("insurance")) {%>
    <input type="radio" name="categName" value="6" checked="checked"/>insurance
<% } else { %>
    <input type="radio" name="categName" value="6"/>insurance
<% } %>

<% if(chk.getCategName().toString().equals("groceries")) {%>
    <input type="radio" name="categName" value="7" checked="checked"/>groceries
<% } else { %>
    <input type="radio" name="categName" value="7"/>groceries
<% }%>    

<% if(chk.getCategName().toString().equals("cash")) {%>
    <input type="radio" name="categName" value="8" checked="checked"/>cash
<% } else { %>
    <input type="radio" name="categName" value="8"/>cash
<% } %>

<% if(chk.getCategName().toString().equals("savings")) {%>
    <input type="radio" name="categName" value="9" checked="checked"/>savings
<% } else { %>
    <input type="radio" name="categName" value="9"/>savings
<% } %>

<% if(chk.getCategName().toString().equals("dining")) {%>
    <input type="radio" name="categName" value="10" checked="checked"/>dining
<% } else { %>
    <input type="radio" name="categName" value="10"/>dining
<% } %>

<% if(chk.getCategName().toString().equals("unplanned")) {%>
    <input type="radio" name="categName" value="11" checked="checked"/>unplanned</td></tr>  
<% } else { %>
    <input type="radio" name="categName" value="11"/>unplanned</td></tr> 
<% } %>

<tr><td>description:</td><td>  
<input type="text" name="checkName" value="<%= chk.getCheckName()%>"/></td></tr>   
<tr><td>amount:</td><td>  
<input type="text" name="checkAmt" value="<%= chk.getCheckAmt()%>"/></td></tr>   
<tr><td>is cleared:</td><td>  
<% if (chk.getIsCleared()) { %>
    <input type="radio" name="isCleared" value="true" checked="checked"/>cleared
    <input type="radio" name="isCleared" value="false"/>not cleared</td></tr> 
<% } else {%>
    <input type="radio" name="isCleared" value="false"/>cleared
    <input type="radio" name="isCleared" value="true" checked="checked"/>not cleared</td></tr>
<% } %>
<tr><td colspan="2"><input type="submit" value="update transaction"/></td></tr>  
</table>  
</form>  
  
</body>  
</html>  
