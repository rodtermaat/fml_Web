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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>view checkbook</title>
        <link href="resources/css/mystyle.css" type="text/css" rel="stylesheet" />
    </head> 
    <div class="header">
        <a href="#default" class="logo"> FML. checkbook</a>
        <div class="header-right">
            <a class="active" href="index.jsp">logout</a>
        </div>
    </div>
    <body>  
        <%@page import="com.termaat.dao.CheckDao,com.termaat.bean.*,java.util.*"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <div class="row"><br></div>
        <div class="row">
            <div class="column left">
                <%
                    int viewBalance = 0;
                    int amt = 0;
                    //List<ViewCheck> list = CheckDao.getAllRecords();
                    List<ViewCheck> list = CheckDao.getCheckbook();
                    request.setAttribute("list", list);
                %>  
                <table class="greyGridTable">  
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>cleared</th>
                            <th>date</th>
                            <th>type</th>  
                            <th>category</th>
                            <th>description</th>
                            <th>amount</th>
                            <th>balance</th>
                            <th></th>
                            <th></th>
                        </tr>  
                    </thead>
                    <tfoot>
                        <tr>
                            <td>id</td>
                            <td>cleared</td>
                            <td>date</td>
                            <td>type</td>  
                            <td>category</td>
                            <td>name</td>
                            <td>amount</td>
                            <td>balance</td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tfoot>
                    <c:set var="balance" value="${0}"/>
                    <c:forEach items="${list}" var="v_chk">
                        <c:set var="balance" value="${balance + 1}"/> 
                        <tr>
                            <td>${v_chk.getCheckId()}</td>
                            <td>${v_chk.getIsCleared()}</td>
                            <td>${v_chk.getCheckDate()}</td>  
                            <td>${v_chk.getTypeName()}</td>
                            <td>${v_chk.getCategName()}</td>
                            <td>${v_chk.getCheckName()}</td>
                            <td>${v_chk.getCheckAmt()}</td>
                            <td>${v_chk.getCheckBal()}</td>
                            <td><a href="editcheckform.jsp?id=${v_chk.getCheckId()}">edit</a></td>  
                            <td><a href="deletecheck.jsp?checkId=${v_chk.getCheckId()}">delete</a></td></tr>  
                        </c:forEach>  
                </table>
                <h2></h2>
                <form name="addcheck" action="addcheckform.jsp" method="POST">
                    <input class="butt" type="submit" value="new" name="btnAdd" />
                </form>
            </div>
            <div class="column right" style="background-color:#bbb;">
                <h2>some test text to see if the columns work</h2>         
            </div>
        </div>
    </body>  
</html>  
