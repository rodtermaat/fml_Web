<%-- 
    Document   : checkbook
    Created on : Mar 17, 2018, 1:24:32 PM
    Author     : termaat
--%>
<%@page import="java.sql.*"%>
<%  Class.forName("com.mysql.jdbc.Driver"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            //String uid = session.getAttribute("userName").toString();
        %>
        <%!
            public class Checkbook {
                String url = "jdbc:mysql://localhost:3306/fuckmylife";
                String mysql_user = "root";
                String mysql_pass = "wordpass";
                
                Connection connection = null;
                PreparedStatement selectCheckbook = null;
                ResultSet resultSet = null;

                public Checkbook(){

                try{
                    connection = DriverManager.getConnection(url, mysql_user, 
                                mysql_pass);
                    selectCheckbook = connection.prepareStatement(
                        "SELECT chk.checkId, chk.checkDate," + 
                        " typ.typeName, cat.categName," +
                        " chk.checkName, chk.checkAmt, chk.checkCleared" +
                        " FROM `checkbook` chk" +
                        " INNER JOIN `user` on chk.checkUser = user.userId" +
                                " AND user.userUID = 'Admin'" +
                        " INNER JOIN `category` cat" +
                                " on chk.checkCategId = cat.categId" +
                        " INNER JOIN `trantype` typ" +
                                " on chk.checkTypeId = typ.typeId" +
                        " ORDER BY chk.checkDate");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                
                }
                public ResultSet getChecks(){
                try{
                    resultSet = selectCheckbook.executeQuery();
                } catch (SQLException e){
                    e.printStackTrace();
                }
                return resultSet;
            }

            }
        %>
        <%
            Checkbook checkbook = new Checkbook();
            ResultSet checks = checkbook.getChecks();
            int balance = 0;
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
            <tbody>
                <% while (checks.next()) { 
                        balance = balance + checks.getInt("checkAmt");
                %>
                <tr>
                    <td><%= checks.getInt("checkId")%></td>
                    <% if(checks.getBoolean("checkCleared")) { %>
                    <td>yep</td>
                    <%} else { %>
                    <td>nope</td>
                    <% } %>
                    <td><%= checks.getDate("checkDate")%></td>
                    <td><%= checks.getString("typeName")%></td>
                    <td><%= checks.getString("categName")%></td>
                    <td><%= checks.getString("checkName")%></td>
                    <td><%= checks.getInt("checkAmt")%></td>
                    <td><%= balance %></td>
                </tr>
                <% } %>
            </tbody>
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
