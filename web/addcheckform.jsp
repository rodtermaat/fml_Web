<%-- 
    Document   : addcheck
    Created on : Mar 20, 2018, 9:55:57 PM
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
  
        <script>
            $(document).ready(function() {
            $("#datepicker").datepicker({ dateFormat: "yy-mm-dd" });
        });
        </script>
        <script type="text/javascript">
         <!--
        function validate() {
      
         if( document.addcheck.checkDate.value == "" )
         {
            alert( "you cannot submit without a date" );
            document.addcheck.checkDate.focus() ;
            return false;
         }

        var typeNames = document.getElementsByName("typeName");
        if (typeNames[0].checked == true) {
        } else if (typeNames[1].checked == true) {
        } else {
           // no checked
           alert( "credit vs. debit, very important field this is" );
           return false;
        }
        
        var categNames = document.getElementsByName("categName");
        if (categNames[0].checked == true) {
        } else if (categNames[1].checked == true) {
        } else if (categNames[2].checked == true) {
        } else if (categNames[3].checked == true) {
        } else if (categNames[4].checked == true) {
        } else if (categNames[5].checked == true) {
        } else if (categNames[6].checked == true) {
        } else if (categNames[7].checked == true) {
        } else if (categNames[8].checked == true) {
        } else if (categNames[9].checked == true) {
        } else if (categNames[10].checked == true) {
        } else {
           // no checked
           alert( "no category equals no addy addy" );
           return false;
        }
        
        if( document.addcheck.checkName.value === "" )
         {
            alert( "add a description, please" );
            document.addcheck.checkName.focus() ;
            return false;
         }
         if( document.addcheck.checkAmt.value === "" )
         {
            alert( "what the? add a damn amount already" );
            document.addcheck.checkAmt.focus() ;
            return false;
         }
         

         return( true );
        }
         //-->
        </script>
    </head>
    <div class="header">
        <a href="#default" class="logo"> FML. add transaction</a>
        <div class="header-right">
            <a class="active" href="viewcheckbook.jsp">cancel</a>
        </div>
    </div>
    <body>
        <h1></h1>
        <form name="addcheck" action="addcheck.jsp" method="POST"
              onsubmit="return(validate());">
            <table border="0">
                <tr>
                    <td>. date</td>
                    <td><input type="date" id="datepicker" class="date" name="checkDate" value="" size="15" /></td>
                </tr>
                <tr height = 10px></tr>
                <tr>
                    <td>. type</td>
                    <td>
                        <input type="radio" name="typeName" value="credit"/> credit
                        <input type="radio" name="typeName" value="debit"/> debit
                    </td></tr>
                <tr height = 10px></tr>
                <tr>
                    <td>. category</td>
                    <td>  
                        <input type="radio" name="categName" value="1"/> account
                        <input type="radio" name="categName" value="2"/> house
                        <input type="radio" name="categName" value="3"/> living
                        <input type="radio" name="categName" value="4"/> debt
                        <input type="radio" name="categName" value="5"/> salary
                        <input type="radio" name="categName" value="6"/> insurance
                        <input type="radio" name="categName" value="7"/> groceries
                        <input type="radio" name="categName" value="8"/> cash
                        <input type="radio" name="categName" value="9"/> savings
                        <input type="radio" name="categName" value="10"/> dining
                        <input type="radio" name="categName" value="11"/> unplanned</td></tr>
                <tr height = 10px></tr>
                <tr>
                    <td>. description</td>
                    <td><input type="text" name="checkName" value="" size="40"/></td>
                </tr>
                <tr height = 10px></tr>
                <tr>
                    <td>. amount</td>
                    <td><input type="text" name="checkAmt" value="" size="15"/></td>
                </tr>
                <tr height = 10px></tr>
                <tr>
                    <td>. is cleared</td>
                    <td>    
                        <input type="checkbox" name="isCleared" value="true"/>
                    </td></tr>
                <tr height = 10px></tr>
                <tr>
                    <td colspan="2"><input type="submit" class="butt" value="add"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
