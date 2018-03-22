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
    </head>
    <body>
        <h1>. add transaction</h1>
        <form name="addcheck" action="addcheck.jsp" method="POST">
            <table border="0">
                <tr>
                    <td>. date</td>
                    <td><input type="date" class="date" name="checkDate" value="" size="15" /></td>
                </tr>
                <tr>
                    <td>. type</td>
                    <td>
                        <input type="radio" name="typeName" value="1"/> income
                        <input type="radio" name="typeName" value="2"/> bills
                        <input type="radio" name="typeName" value="3"/> unplanned expense
                        <input type="radio" name="typeName" value="4"/> budgeted expense
                        <input type="radio" name="typeName" value="5"/> savings
                    </td></tr>
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
                <tr>
                    <td>. description</td>
                    <td><input type="text" name="checkName" value="" size="40"/></td>
                </tr>
                <tr>
                    <td>. amount</td>
                    <td><input type="text" name="checkAmt" value="" size="15"/></td>
                </tr>
                <tr>
                    <td>. is cleared</td>
                    <td>    
                        <input type="checkbox" name="isCleared" value="true"/>
                <tr>
                    <td colspan="2"><input type="submit" value="add transaction"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
