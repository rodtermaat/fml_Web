<%-- 
    Document   : viewcheckbook
    Created on : Mar 19, 2018, 11:20:28 AM
    Author     : termaat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
        <title>view checkbook</title>  
    </head>  
    <body>  

        <%@page import="com.termaat.dao.CheckDao,com.termaat.bean.*,java.util.*"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

        <h1>. checkbook</h1>  

        <%
            List<Check> list = CheckDao.getAllRecords();
            request.setAttribute("list", list);
        %>  

        <table border="1" width="90%">  
            <tr>
                <th>id</th>
                <th>cleared</th>
                <th>date</th>
                <th>type</th>  
                <th>category</th>
                <th>name</th>
                <th>amount</th>
                <th>balance</th>
                <th></th>
                <th></th>
            </tr>  
            <c:forEach items="${list}" var="chk">  
                <tr>
                    <td>${chk.getCheckId()}</td>
                    <td>${chk.getIsCleared()}</td>
                    <td>${chk.getCheckDate()}</td>  
                    <td>${chk.getTypeName()}</td>
                    <td>${chk.getCategName()}</td>
                    <td>${chk.getCheckName()}</td>
                    <td>${chk.getCheckAmt()}</td>
                    <td>$1250</td>
                    <td><a href="editcheckform.jsp?id=${chk.getCheckId()}">edit</a></td>  
                    <td><a href="deletecheck.jsp?checkId=${chk.getCheckId()}">delete</a></td></tr>  
            </c:forEach>  
        </table>  
        <br/><a href="addcheck.jsp">. add new transaction</a>  

    </body>  
</html>  
