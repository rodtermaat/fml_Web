<%-- 
    Document   : editcategform
    Created on : Mar 30, 2018, 6:02:53 AM
    Author     : termaat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>edit transaction</title>  
<link href="resources/css/mystyle.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

   
<script type="text/javascript">
         <!--
        function validate() {
        if( document.editcheck.checkDate.value == "" )
         {
            alert( "you cannot submit without a date" );
            document.editcheck.checkDate.focus() ;
            return false;
         }
        
        if( document.editcheck.checkName.value === "" )
         {
            alert( "add a description, please" );
            document.editcheck.checkName.focus() ;
            return false;
         }
         
         if( document.editcheck.checkAmt.value === "" )
         {
            alert( "what the? add a damn amount already" );
            document.editcheck.checkAmt.focus() ;
            return false;
         }
         

         return( true );
        }
         //-->
        </script>

</head>  
    <div class="header">
        <a href="#default" class="logo"> FML. edit category</a>
        <div class="header-right">
            <a class="active" href="viewcategories.jsp">cancel</a>
        </div>
    </div>
<body>  
<%@page import="com.termaat.dao.CheckDao,com.termaat.bean.ManageCateg"%>  
  
<%  
String id=request.getParameter("id");  
ManageCateg e_cat=CheckDao.getCategById(Integer.parseInt(id));  
%>  
  
<h1></h1> 
<%
//System.out.println(e_cat.getCategId());
//System.out.println(e_cat.getCategName());
//System.out.println(e_cat.getCategBudgAmt());
//System.out.println(e_cat.getCategBudgFrq());
%>
<form name="editcateg" action="editcateg.jsp" method="post"
      onsubmit="return(validate());">  
<input type="hidden" name="checkId" value="<%=e_cat.getCategId() %>"/>  
<table>  
<tr><td>. category:</td><td>
<input type="text" name="category" value="<%= e_cat.getCategName()%>" size="35"/></td></tr>  
<tr height = 10px></tr>
<tr><td>. budgeted amount:</td><td>  
<input type="text" name="categBudgAmt" value="<%= e_cat.getCategBudgAmt()%>"/></td></tr>   
<tr height = 10px></tr>
<tr><td>. budget frequency:</td><td>  
<input type="text" name="categBudgFrq" value="<%= e_cat.getCategBudgFrq()%>"/></td></tr>   
<tr height = 10px></tr> 
<tr height = 10px></tr>
<tr><td colspan="2"><input type="submit" class="butt" value="update"/></td></tr>  
</table>  
</form>  
  
</body>  
</html>  

