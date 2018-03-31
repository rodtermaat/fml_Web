<%-- 
    Document   : addcategform
    Created on : Mar 30, 2018, 9:50:14 PM
    Author     : termaat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add transaction</title>
        <link href="resources/css/mystyle.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
        <script type="text/javascript">
         <!--
        function validate() {
      
         if( document.addcateg.categName.value == "" )
         {
            alert( "you must have a category description - tool!" );
            document.addcateg.categName.focus() ;
            return false;
         }

        var frq = document.addcateg.categBudgFrq.value
        var xfrq = frq.toUpperCase();
        
        if( xfrq == "M" || xfrq == "W" || xfrq == "")
         { }
         else
         {
         alert( "frequency can be blank, M or W only. meaning Monthly or Weekly budget frequency, please correct" );
            document.addcateg.categBudgFrq.focus() ;
            return false;
         }
         
         var amt = document.addcateg.categBudgAmt.value
         if (isNaN(amt))
         {
            alert( "if you are going to add an amount at least make it numeric" );
            document.addcateg.categBudgAmt.focus() ;
            return false;
         }
          
         return( true );

        }
         //-->
        </script>
    </head>
    <div class="header">
        <a href="#default" class="logo"> FML. add category</a>
        <div class="header-right">
            <a class="active" href="viewcategory.jsp">cancel</a>
        </div>
    </div>
    <body>
        <h1></h1>
        <form name="addcateg" action="addcateg.jsp" method="POST"
              onsubmit="return(validate());">
            <table border="0">
                <tr>
                    <td>. category</td>
                    <td><input type="text" name="categName" value="" size="35" /></td>
                </tr>
                <tr height = 10px></tr>
                <tr>
                    <td>. budgeted amount</td>
                    <td><input type="text" name="categBudgAmt" value="" size="15"/></td>
                </tr>
                <tr height = 10px></tr>
                <tr>
                    <td>. budget frequency</td>
                    <td><input type="text" name="categBudgFrq" value="" size="10"/></td>
                </tr>
                <tr height = 10px></tr>
                <tr>
                    <td colspan="2"><input type="submit" class="butt" value="add"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>

