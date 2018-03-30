<%-- 
    Document   : viewcategories
    Created on : Mar 28, 2018, 8:25:08 PM
    Author     : termaat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>category management</title>
        <link href="resources/css/mystyle.css" type="text/css" rel="stylesheet" />
    </head> 
    <div class="header">
        <a href="#default" class="logo"> FML. category management</a>
        <div class="header-right">
            <a class="active" href="viewcheckbook.jsp">cancel</a>
        </div>
    </div>
    <body>  
        <%@page import="com.termaat.dao.CheckDao,com.termaat.bean.*,java.util.*"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!--<div class="row"><br></div>-->
        <div class="row">
            <div class="column left">
                <%
                    String s_userId = session.getAttribute("userId").toString();
                    int userId = Integer.valueOf(s_userId);
                    //List<ViewCheck> list = CheckDao.getAllRecords();
                    List<ManageCateg> list = CheckDao.getCategories(userId);
                    request.setAttribute("list", list);
                %>  
                <h2>you are user number <%= userId%> </h2>
                <table class="categTable">  
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>category</th>
                            <th>budgeted amount</th>
                            <th></th>
                            <th>budget frequency</th>
                            <th></th>
                            <th></th>
                        </tr>  
                    </thead>
                    <tfoot>
                        <tr>
                            <td>id</td>
                            <td>category</td>
                            <td>budgeted amount</td>
                            <td></td>
                            <td>budget frequency</td>  
                            <td></td>
                            <td></td>
                        </tr>
                    </tfoot>
                    <c:forEach items="${list}" var="v_cat">
                        <tr>
                            <td>${v_cat.getCategId()}</td>
                            <td>${v_cat.getCategName()}</td>
                            <td>${v_cat.getCategBudgAmt()}</td>
                            <td>1</td>
                            <td>${v_cat.getCategBudgFrq()}</td>
                            <td><a href="editcategform.jsp?id=${v_cat.getCategId()}">edit</a></td>  
                            <td><a href="deletcateg.jsp?categId=${v_cat.getCategId()}">delete</a></td></tr>  
                        </c:forEach>  
                </table>
                <h2></h2>
                <form name="addcateg" action="addcategform.jsp" method="POST">
                    <%session.setAttribute("userId", userId);%>
                    <input class="butt" type="submit" value="new" name="btnAdd"/>
                </form>    
            </div>
            <div class="column right">
                <!--Div that will hold the pie chart-->
            </div>
        </div>
    </body>
    
</html>
