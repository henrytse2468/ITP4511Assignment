<%-- 
    Document   : listTimeslot
    Created on : 2023年3月30日, 下午05:32:01
    Author     : henry
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ict.db.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            DB db;
            String dbUser = this.getServletContext().getInitParameter("dbUser");
            String dbPassword = this.getServletContext().getInitParameter("dbPassword");
            String dbUrl = this.getServletContext().getInitParameter("dbUrl");
            db = new DB(dbUrl, dbUser, dbPassword);
            
        ArrayList<String> timeslots = (ArrayList<String> )db.getAllTimeSlot(); 
	out.println("<h1>Timeslot</h1>"); 
        out.println("<form method='get' action='/Assignment/TimeslotController'>");
	out.println("<table border='1'>"); 
	out.println("<tr>"); 
	out.println("<th>TimeSlot</th>"); 
	out.println("</tr>"); 
	// loop through the customer array to display each customer record 
	for (int i = 0; i < timeslots.size(); i++) {
	out.println("<tr>"); 
        out.println("<td>" + timeslots.get(i) + "</td>"); 
        out.println("<td><a href='staffFunction/editTimeslot.jsp?&editTimeslot=" + timeslots.get(i) + "'>Edit</a></td>");
        out.println("<td><a href='#' onclick=\"if (confirm(\'Are you sure you want to delete?"+ "ID : "+ timeslots.get(i) + "\')) {window.location.href="
                        + "\'/Assignment/TimeslotController?action=delete&delTimeslot="+ timeslots.get(i) + "\'"
                        + ";};\">Delete</a></td>");
	out.println("</tr>"); } 
            
        %>
        <tr>
        <td><input type='text' name='timeslot'></td>
        <input type='hidden' name='action' value='add'>
        <td><input type='submit' value='addTimeslot'></td>
        </tr>
        </table>
        <a href='/Assignment/staffMain.jsp'>Back to home page</a>
    </body>
</html>
