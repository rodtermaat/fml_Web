<%-- 
    Document   : index
    Created on : Mar 17, 2018, 1:10:34 PM
    Author     : termaat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    <body>
        <h1>. login</h1>
        <form name="loginForm" action="validateuser.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>user name: </td>
                        <td><input type="text" name="username" value="" size="40"
                                   required/></td>
                    </tr>
                    <tr>
                        <td>password: </td>
                        <td><input type="password" name="password" value="" 
                                   size="40"  required/></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value=". reset" name="reset" />
            <input type="submit" value=". submit" name="submit" />
            <a href="newuser.jsp">register</a>
            <a href="passreset.jsp">reset password</a>
            
            
        </form>
    </body>
</html>
