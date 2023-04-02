<%-- 
    Document   : editTimeslot
    Created on : 2023年3月31日, 上午11:37:37
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
            
        ArrayList<String> tl = (ArrayList<String> )db.getAllTimeSlot(); 
	out.println("<h1>Edit Timeslot :</h1>");
        out.println("<form method='get' action='/Assignment/TimeslotController'>");
	out.println("<table border='1'>"); 
	out.println("<tr>"); 
	out.println("<th>Timeslot</th>"); 
	out.println("</tr>"); 
	// loop through the customer array to display each customer record 
	for (int i = 0; i < tl.size(); i++) {
        if(request.getParameter("editTimeslot").equals(tl.get(i))){
        out.println("<tr>");
        out.println("<input type='hidden' name='action' value='edit'>");
        out.println("<input type='hidden' name='orignalTimeslot' value='"+ tl.get(i) +"'>");
        out.println("<td><input type='text' name='editTimeslot' value='"+ tl.get(i)+"'></td>");
        out.println("<td><input type='submit' value='confirm edit info'></td>");
        out.println("</tr>");
        }else{
        out.println("<tr>"); 
        out.println("<td>" + tl.get(i) + "</td>");
        //out.println("<td>" + c.getGuestListId() + "</td>");
        out.println("<td><a href='/Assignment/staffFunction/editTimeslot.jsp?editTimeslot=" + tl.get(i) + "'>Edit</a></td>");
        out.println("<td><a href='#' onclick=\"if (confirm(\'Are you sure you want to delete?"+ "Timeslot : "+ tl.get(i) 
                + "\')) {window.location.href="
                        + "\'/Assignment/TimeslotController?action=delete&delTimeslot="+ tl.get(i) + "\'"
                        + ";};\">Delete</a></td>");
        out.println("</tr>");
        }
        }
        out.println("</table>");
        
        %>
        <a href='/Assignment/staffMain.jsp'>Back to home page</a>
    </body>
</html>
