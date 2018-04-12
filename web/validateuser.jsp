<%-- 
    Document   : validateuser
    Created on : Mar 17, 2018, 9:06:32 PM
    Author     : termaat
--%>
<%@page import="java.sql.*,com.termaat.helper.*,com.termaat.dao.*"%>
<%  Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>validate user</title>
    </head>
    <body>
        <h1>validate user</h1>
        <%!
            public class ValidUser {
                String url = "jdbc:mysql://localhost:3306/fuckmylife";
                String mysql_user = "root";
                String mysql_pass = "wordpass";
                
                Connection connection = null;
                PreparedStatement selectUsers = null;
                ResultSet resultSet = null;

                public ValidUser(){

                try{
                    connection = DriverManager.getConnection(url, mysql_user, 
                                mysql_pass);
                    selectUsers = connection.prepareStatement(
                        "SELECT userId FROM `user` WHERE" +
                        " user.userUID=? and user.userPassword=?");

                } catch (SQLException e) {
                    e.printStackTrace();
                }
                
                }
                public ResultSet getUser(String usr, String pw){
                try{
                    selectUsers.setString(1, usr);
                    selectUsers.setString(2, pw);
                    resultSet = selectUsers.executeQuery();
                } catch (SQLException e){
                    e.printStackTrace();
                }
                return resultSet;
            }

            }
        %>
        <%
            String _user = new String();
            String _pass = new String();
            
            if(request.getParameter("username") !=null){
                _user = request.getParameter("username");
            }
            else{
                response.sendRedirect("loginerror.jsp");
            }
            if(request.getParameter("password") !=null){
                _pass = request.getParameter("password");
            }
            else{
                response.sendRedirect("loginerror.jsp");
            }
            
            ValidUser userValid = new ValidUser();
            ResultSet rsUser = userValid.getUser(_user,_pass);
            
            DateHelper dtx = new DateHelper();
            CheckDao dbx = new CheckDao();
            
            //if valid
            if (rsUser.next()){
                // go to checkbook
                session.setAttribute("userId", rsUser.getInt("userId"));
                session.setAttribute("currMon", dtx.getMonthDesc(0));
                session.setAttribute("currYr", dtx.getYear(0));
                session.setAttribute("currBal", dbx.getBalance(dtx.getToday()));
                System.out.println(dbx.getBalance(dtx.getToday()));
                //session.setAttribute(currBal, value);
                //session.setAttribute("userName", _user);
                response.sendRedirect("viewcheckbook.jsp");
            } else{
               // go to login error page
               response.sendRedirect("loginerror.jsp");
            }
        %>
    </body>
</html>
