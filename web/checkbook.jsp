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
        <title>checkbook</title>
    </head>
    <body>
        <h1>. checkbook</h1>
        <%
            String uid = session.getAttribute("userName").toString();
            //String username = request.getParameter("username");
            //String password = request.getParameter("password");
        %>
        <h2>Hello <%= uid %></h2>
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
                        "SELECT chk.checkId, chk.checkDate8," + 
                        " typ.typeName, cat.categName," +
                        " chk.checkName, chk.checkAmt, chk.checkCleared" +
                        " FROM `checkbook` chk" +
                        " INNER JOIN `user` on chk.checkUser = user.userId" +
                                " AND user.userUID = 'Admin'" +
                        " INNER JOIN `category` cat" +
                                " on chk.checkCategId = cat.categId" +
                        " INNER JOIN `trantype` typ" +
                                " on chk.checkTypeId = typ.typeId");
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
        <table border="2" width="60%">
            <tbody>
                <tr>
                    <td>id</td>
                    <td>cleared</td>
                    <td>date</td>
                    <td>type</td>
                    <td>category</td>
                    <td>name</td>
                    <td>amount</td>
                    <td>balance</td>
                </tr>
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
                    <td><%= checks.getInt("checkDate8")%></td>
                    <td><%= checks.getString("typeName")%></td>
                    <td><%= checks.getString("categName")%></td>
                    <td><%= checks.getString("checkName")%></td>
                    <td><%= checks.getInt("checkAmt")%></td>
                    <td><%= balance %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

    </body>
</html>
