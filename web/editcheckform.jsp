<%-- 
    Document   : editcheckform
    Created on : Mar 19, 2018, 8:49:13 PM
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


        <script>
            $(document).ready(function () {
                $("#datepicker").datepicker({dateFormat: "yy-mm-dd"});
            });
        </script>
        <script type="text/javascript">
            <!--
                function validate() {
                if (document.editcheck.checkDate.value == "")
                {
                    alert("you cannot submit without a date");
                    document.editcheck.checkDate.focus();
                    return false;
        }

                if (document.editcheck.checkName.value === "")
                {
                    alert("add a description, please");
                    document.editcheck.checkName.focus();
                    return false;
        }

                if (document.editcheck.checkAmt.value === "")
                {
                    alert("what the? add a damn amount already");
                    document.editcheck.checkAmt.focus();
                    return false;
                }


                return(true);
            }
            //-->
        </script>

    </head>  
    <div class="header">
        <a href="#default" class="logo"> FML. edit transaction</a>
        <div class="header-right">
            <a class="active" href="viewcheckbook.jsp">cancel</a>
        </div>
    </div>
    <body>  
        <%@page import="com.termaat.dao.CheckDao,com.termaat.bean.*,java.util.*"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%
            String id = request.getParameter("id");
            ViewCheck v_chk = CheckDao.getCheckById(Integer.parseInt(id));
            String s_userId = session.getAttribute("userId").toString();
            int userId = Integer.valueOf(s_userId);
            List<ManageCateg> list = CheckDao.getCategories(userId);
            request.setAttribute("list", list);
            String checkCategName = v_chk.getCategName();
            request.setAttribute("catName", checkCategName);
            //System.out.println("check categ name " + checkCategName);
        %>  

        <h1></h1> 
        <form name="editcheck" action="editcheck.jsp" method="post"
              onsubmit="return(validate());">  
            <input type="hidden" name="checkId" value="<%=v_chk.getCheckId()%>"/>  
            <table>  
                <tr>
                    <td>. date:</td>
                    <td>
                        <input type="date" class="date"  id="datepicker" name="checkDate" value="<%= v_chk.getCheckDate()%>" size="15"/>
                    </td>
                </tr>  
                <tr height = 10px></tr>

                <tr>
                    <td>. type:</td>
                    <td>
                        <% if (v_chk.getTypeName().toString().equals("credit")) {%>
                        <input type="radio" name="typeName" value="credit" checked="checked"/> credit
                        <%} else { %>
                        <input type="radio" name="typeName" value="credit"/> credit
                        <% } %>

                        <% if (v_chk.getTypeName().toString().equals("debit")) {%>
                        <input type="radio" name="typeName" value="debit" checked="checked"/> debit
                        <%} else { %>
                        <input type="radio" name="typeName" value="debit"/> debit
                        <% }%>
                    </td>
                </tr>
                <tr height = 10px></tr>

                <tr>
                    <td>. category:</td>
                    <td>
    <c:forEach items="${list}" var="v_cat">
    <input type="radio" 
           name="categName" 
           value="${v_cat.getCategId()}"
           <c:if test="${v_cat.getCategName() eq catName}">checked</c:if>
           > ${v_cat.getCategName()} |
    </c:forEach>
                    </td>
                </tr>
                <tr height = 10px></tr>

                <tr>
                    <td>. description:</td>
                    <td>  
                        <input type="text" name="checkName" value="<%= v_chk.getCheckName()%>"/>
                    </td>
                </tr>   
                <tr height = 10px></tr>

                <tr>
                    <td>. amount:</td>
                    <td>  
                        <input type="text" name="checkAmt" value="<%= v_chk.getCheckAmt()%>"/>
                    </td>
                </tr>   
                <tr height = 10px></tr>

                <tr>
                    <td>. is cleared:</td>
                    <td>  
                        <% if (v_chk.getIsCleared()) { %>
                        <input type="checkbox" name="isCleared" value="true" checked="checked" />
                        <% } else {%>
                        <input type="checkbox" name="isCleared" value="true"/>
                        <% }%>
                    </td>
                </tr>
                <tr height = 10px></tr>

                <tr>
                    <td colspan="2"><input type="submit" class="butt" value="update"/></td>
                </tr>  
            </table>  
        </form>  

    </body>  
</html>  
