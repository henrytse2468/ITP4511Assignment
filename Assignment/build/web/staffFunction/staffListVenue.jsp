<%-- 
    Document   : venueBooking
    Created on : 2023年3月28日, 上午01:53:48
    Author     : henry
--%>

<%@page import="ict.db.DB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.VenueBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="userInfo" class="ict.bean.loginInfo" scope="session"/>
        <h1><jsp:getProperty name="userInfo" property="username"/></h1>
        <% 
        DB db;
            String dbUser = this.getServletContext().getInitParameter("dbUser");
            String dbPassword = this.getServletContext().getInitParameter("dbPassword");
            String dbUrl = this.getServletContext().getInitParameter("dbUrl");
            db = new DB(dbUrl, dbUser, dbPassword);
            
        ArrayList<VenueBean> venues = (ArrayList<VenueBean> )db.getAllVenue(); 
	out.println("<h1>Venue</h1>"); 
	out.println("<table border='1'>"); 
	out.println("<tr>"); 
	out.println("<th>VenueId</th>  <th>ImageListId</th><th>VenueName</th><th>VenueType</th><th>VenueCapacity</th><th>VenueLocation</th><th>VenueDesc</th><th>VenuePIC</th><th>VenueHourlyFee</th><th>VenueStatus</th>"); 
	out.println("</tr>"); 
	// loop through the customer array to display each customer record 
	for (int i = 0; i < venues.size(); i++) {
	VenueBean c = venues.get(i); 
	out.println("<tr>"); out.println("<td>" + c.getVenueId() + "</td>"); 
	out.println("<td>" + c.getImageListId() + "</td>"); 
	out.println("<td>" + c.getVenueName() + "</td>"); 
	out.println("<td>" + c.getVenueType() + "</td>"); 
        out.println("<td>" + c.getVenueCapacity() + "</td>");
        out.println("<td>" + c.getVenueLocation() + "</td>");
        out.println("<td>" + c.getVenueDesc() + "</td>");
        out.println("<td>" + c.getVenuePIC() + "</td>");
        out.println("<td>" + c.getVenueHourlyFee() + "</td>");
        out.println("<td>" + c.getVenueStatus() + "</td>");
        out.println("<td><a href='?&" + c.getVenueId()  + "'>Edit</a></td>");
	out.println("</tr>"); } 
        out.println("</table>");
        
	%>
        <a href='addVenue.jsp'>Add New Venue</a><br/>
        <a href='/Assignment/staffMain.jsp'>Back to home page</a>
    </body>
</html>
