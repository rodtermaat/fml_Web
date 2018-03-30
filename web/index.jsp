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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>. login</title>
        <link href="resources/css/mystyle.css" type="text/css"
      rel="stylesheet" />
        
        <script type="text/javascript">
         <!--
        function validate() {
      
         if( document.loginForm.username.value === "" )
         {
            alert( "Enter user name jackass!" );
            document.loginForm.username.focus() ;
            return false;
         }
         if( document.loginForm.password.value === "" )
         {
            alert( "A password is required, pretty please." );
            document.loginForm.password.focus() ;
            return false;
         }
         
         return( true );
        }
         //-->
        </script>
    </head>
    <div class="header">
        <a href="#default" class="logo"> FML. login</a>
        <div class="header-right">
            <a class="active" href="newuser.jsp">register</a>
            <a href="passreset.jsp">reset password</a>
            <a href="#about">about</a>
        </div>
    </div>
    <body>
        <h1></h1>
        <form name="loginForm" action="validateuser.jsp" method="POST" 
              onsubmit="return(validate());">
            <table border="0">
                <tbody>
                    <tr>
                        <td>user name: </td>
                        <td><input type="text" name="username" 
                                   value="" size="25"/></td>
                    </tr>
                    <tr>
                        <td>password: </td>
                        <td><input type="password" name="password" value="" 
                                   size="25"/></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <input class="butt" type="submit" value="submit" name="submit" />
        </form>
    </body>
</html>
