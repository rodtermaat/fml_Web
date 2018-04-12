<%-- 
    Document   : viewcheckbook
    Created on : Mar 19, 2018, 11:20:28 AM
    Author     : termaat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <script>
    $(function (){
        if($('#iscleared').val()== "true"){           
            $("input:checkbox").prop('checked',true);
        }else{
            $("input:checkbox").prop('checked', false);
        }
    });
    </script>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'spending at a glance',
                       'width':600,
                       'height':600};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>view checkbook</title>
        <link href="resources/css/mystyle.css" type="text/css" rel="stylesheet" />
    </head> 
    <div class="header">
        <%String currMon = session.getAttribute("currMon").toString();
          String currYr = session.getAttribute("currYr").toString();
        %>
        <a href="#default" class="logo"> FML. checkbook. <%= currMon %> . <%= currYr%></a>
        <div class="header-right">
            <a class="active" href="index.jsp">logout</a>
        </div>
    </div>
    <body>  
        <%@page import="com.termaat.dao.CheckDao,com.termaat.bean.*,java.util.*"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!--<div class="row"><br></div>-->
        <div class="row">
            <div class="column left">
                <%
                    String s_userId = session.getAttribute("userId").toString();
                    int userId = Integer.valueOf(s_userId);
                    //List<ViewCheck> list = CheckDao.getAllRecords();
                    List<ViewCheck> list = CheckDao.getCheckbook(userId);
                    request.setAttribute("list", list);
                    //<h2>you are user number <%= userId </h2>
                    String currBal = session.getAttribute("currBal").toString();
                %>  
                <form name="addcheck1" action="addcheckform_1.jsp" method="POST">
                    <%session.setAttribute("userId", userId);%>
                    <table border="0">
                        <tbody>
                            <tr>
                                <td><input class="butt" type="submit" value="new" name="btnAdd1"/></td>
                                <td width="10px"></td>
                                <td><a href="viewcategories.jsp">manage categories</a></td>
                                <td width="20px"></td>
                                <td>Your current balance is: </td>
                                <td><strong>$<%= currBal%></strong></td>
                                <td width="40px"</td>
                                <td><a href="viewcheckbook.jsp">go back</a></td>
                                <td width="10px"></td>
                                <td></td>
                                <td><a href="viewcheckbook.jsp">go forward</a></td>
                                
                            </tr>
                        </tbody>
                    </table>
                </form>
                    <h2></h2>
                <table class="greyGridTable">  
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>date</th>
                            <th>cleared</th> 
                            <th>category</th>
                            <th>description</th>
                            <th>amount</th>
                            <th>balance</th>
                            <th></th>
                            <th></th>
                            <th>type</th>
                        </tr>  
                    </thead>
                    <tfoot>
                        <tr>
                            <td>id</td>
                            <td>date</td>
                            <td>cleared</td>
                            <td>category</td>
                            <td>description</td>
                            <td>amount</td>
                            <td>balance</td>
                            <td></td>
                            <td></td>
                            <td>type</td>
                        </tr>
                    </tfoot>
                    <c:forEach items="${list}" var="v_chk">
                        <tr>
                            <td>${v_chk.getCheckId()}</td>
                            <td>${v_chk.getCheckDate()}</td> 
                            <c:if test="${v_chk.getIsCleared() == true}">
                                <td>&#10003;</td>
                            </c:if>
                            <c:if test="${v_chk.getIsCleared() == false}">
                                <td></td>
                            </c:if> 
                            <td>${v_chk.getCategName()}</td>
                            <td>${v_chk.getCheckName()}</td>
                            <td>${v_chk.getCheckAmt()}</td>
                            <td>${v_chk.getCheckBal()}</td>
                            <td><a href="editcheckform.jsp?id=${v_chk.getCheckId()}">edit</a></td>  
                            <td><a href="deletecheck.jsp?checkId=${v_chk.getCheckId()}">delete</a></td>
                            <td>${v_chk.getTypeName()}</td>
                        </tr>  
                        </c:forEach>  
                </table>    
            </div>
            <div class="column right">
                <!--Div that will hold the pie chart-->
                    <div id="chart_div"></div>
            </div>
        </div>
    </body>  
</html>  
