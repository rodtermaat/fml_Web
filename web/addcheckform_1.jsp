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
        
        var categNames, cLen, i;
        var aok = "N";
        categNames = document.getElementsByName("categName");
        cLen = categNames.length;
        for(i=0; i<cLen; i++){
            if(categNames[i].checked == true){
                aok = "Y";
            }
        }
        if(aok == "N"){
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
        <%@page import="com.termaat.dao.CheckDao,com.termaat.bean.*,java.util.*"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <h1></h1>
        <%
        String s_userId = session.getAttribute("userId").toString();
        int userId = Integer.valueOf(s_userId);
        List<ManageCateg> list = CheckDao.getCategories(userId);
        request.setAttribute("list", list);
        %>  
        <h2>you are user number <%= userId%> </h2>
                
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
                       <c:forEach items="${list}" var="v_cat">
                            <input type="radio" name="categName" value="${v_cat.getCategId()}" /> ${v_cat.getCategName()} |                            
                       </c:forEach>
                    </td>
                </tr>
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
