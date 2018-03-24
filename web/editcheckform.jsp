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
<link href="resources/css/mystyle.css" type="text/css" rel="stylesheet" />
</head>  
    <div class="header">
        <a href="#default" class="logo"> FML. edit transaction</a>
        <div class="header-right">
            <a class="active" href="viewcheckbook.jsp">cancel</a>
        </div>
    </div>
<body>  
<%@page import="com.termaat.dao.CheckDao,com.termaat.bean.ViewCheck"%>  
  
<%  
String id=request.getParameter("id");  
ViewCheck v_chk=CheckDao.getRecordById(Integer.parseInt(id));  
%>  
  
<h1></h1> 
<%
System.out.println(v_chk.getCheckId());
System.out.println(v_chk.getCheckDate());
System.out.println(v_chk.getTypeName());
System.out.println(v_chk.getCategName());
System.out.println(v_chk.getCheckName());
System.out.println(v_chk.getCheckAmt());
System.out.println(v_chk.getIsCleared());
%>
<form action="editcheck.jsp" method="post">  
<input type="hidden" name="checkId" value="<%=v_chk.getCheckId() %>"/>  
<table>  
<tr><td>. date:</td><td>
<input type="date" class="date"  name="checkDate" value="<%= v_chk.getCheckDate()%>" size="15"/></td></tr>  
<tr height = 10px></tr>
<tr><td>. type:</td><td>
<% if(v_chk.getTypeName().toString().equals("income")) {%>
    <input type="radio" name="typeName" value="1" checked="checked"/> income
<%} else { %>
    <input type="radio" name="typeName" value="1"/> income
<% } %>

<% if(v_chk.getTypeName().toString().equals("bills")) {%>
    <input type="radio" name="typeName" value="2" checked="checked"/> bills
<%} else { %>
    <input type="radio" name="typeName" value="2"/> bills
<% } %>

<% if(v_chk.getTypeName().toString().equals("unplanned expense")) {%>
    <input type="radio" name="typeName" value="3" checked="checked"/> unplanned expense
<%} else { %>
    <input type="radio" name="typeName" value="3"/> unplanned expense
<% } %>

<% if(v_chk.getTypeName().toString().equals("budget")) {%>
    <input type="radio" name="typeName" value="4" checked="checked"/> budgeted expense
<%} else { %>
    <input type="radio" name="typeName" value="4"/> budgeted expense
<% } %>

<% if(v_chk.getTypeName().toString().equals("savings")) {%>
    <input type="radio" name="typeName" value="5" checked="checked"/> savings</td></tr>  
<%} else { %>
    <input type="radio" name="typeName" value="5"/> savings</td></tr>
<% } %>
<tr height = 10px></tr>
<tr><td>. category:</td><td>  
<% if(v_chk.getCategName().toString().equals("account")) {%>
    <input type="radio" name="categName" value="1" checked="checked"/> account
<% } else { %>
    <input type="radio" name="categName" value="1"/> account
<% } %>

<% if(v_chk.getCategName().toString().equals("house")) {%>
    <input type="radio" name="categName" value="2" checked="checked"/> house
<% } else { %>
    <input type="radio" name="categName" value="2"/> house
<% } %>

<% if(v_chk.getCategName().toString().equals("living")) {%>
    <input type="radio" name="categName" value="3" checked="checked"/> living
<% } else { %>
    <input type="radio" name="categName" value="3"/> living
<% } %>

<% if(v_chk.getCategName().toString().equals("debt")) {%>
    <input type="radio" name="categName" value="4" checked="checked"/> debt
<% } else { %>
    <input type="radio" name="categName" value="4"/> debt
<% } %>

<% if(v_chk.getCategName().toString().equals("salary")) {%>
    <input type="radio" name="categName" value="5" checked="checked"/> salary
<% } else { %>
    <input type="radio" name="categName" value="5"/> salary
<% } %>

<% if(v_chk.getCategName().toString().equals("insurance")) {%>
    <input type="radio" name="categName" value="6" checked="checked"/> insurance
<% } else { %>
    <input type="radio" name="categName" value="6"/> insurance
<% } %>

<% if(v_chk.getCategName().toString().equals("groceries")) {%>
    <input type="radio" name="categName" value="7" checked="checked"/> groceries
<% } else { %>
    <input type="radio" name="categName" value="7"/> groceries
<% }%>    

<% if(v_chk.getCategName().toString().equals("cash")) {%>
    <input type="radio" name="categName" value="8" checked="checked"/> cash
<% } else { %>
    <input type="radio" name="categName" value="8"/> cash
<% } %>

<% if(v_chk.getCategName().toString().equals("savings")) {%>
    <input type="radio" name="categName" value="9" checked="checked"/> savings
<% } else { %>
    <input type="radio" name="categName" value="9"/> savings
<% } %>

<% if(v_chk.getCategName().toString().equals("dining")) {%>
    <input type="radio" name="categName" value="10" checked="checked"/> dining
<% } else { %>
    <input type="radio" name="categName" value="10"/> dining
<% } %>

<% if(v_chk.getCategName().toString().equals("unplanned")) {%>
    <input type="radio" name="categName" value="11" checked="checked"/> unplanned</td></tr>  
<% } else { %>
    <input type="radio" name="categName" value="11"/> unplanned</td></tr> 
<% } %>
<tr height = 10px></tr>
<tr><td>. description:</td><td>  
<input type="text" name="checkName" value="<%= v_chk.getCheckName()%>"/></td></tr>   
<tr height = 10px></tr>
<tr><td>. amount:</td><td>  
<input type="text" name="checkAmt" value="<%= v_chk.getCheckAmt()%>"/></td></tr>   
<tr height = 10px></tr>
<tr><td>. is cleared:</td><td>  
<% if (v_chk.getIsCleared()) { %>
    <input type="checkbox" name="isCleared" value="true" checked="checked" />
<% } else {%>
    <input type="checkbox" name="isCleared" value="true"/>
<% } %> 
<tr height = 10px></tr>
<tr><td colspan="2"><input type="submit" class="butt" value="update"/></td></tr>  
</table>  
</form>  
  
</body>  
</html>  
