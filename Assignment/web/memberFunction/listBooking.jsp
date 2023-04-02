<%-- 
    Document   : listBooking
    Created on : 2023年3月29日, 上午01:50:13
    Author     : henry
--%>
<%@page import="ict.db.DB"%>
<%@page import="ict.bean.BookingRequestBean"%>
<%@page import="java.util.ArrayList"%>
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
            
            
        ArrayList<BookingRequestBean> brb = db.getBookRequestByMemberId(userInfo.getId());
	out.println("<h1>Your Booking Record</h1>"); 
	out.println("<table border='1'>"); 
	out.println("<tr>"); 
	out.println("<th>BookingRequestId</th><th>bookDate</th><th>bookVenueId</th><th>bookMemberId</th><th>bookStartTime</th><th>BookEndTime</th><th>BookingStatus</th>"
                + "<th>BookRequestTime</th><th>BookPaymentReceipt</th><th>BookGuestListId</th>"); 
	out.println("</tr>"); 
	// loop through the customer array to display each customer record 
	for (int i = 0; i < brb.size(); i++) {
	BookingRequestBean c = brb.get(i); 
	out.println("<tr>"); 
        out.println("<td>" + c.getBookingRequestId() + "</td>"); 
        out.println("<td>" + c.getBookDate() + "</td>");
        out.println("<td>" + c.getBookVenueId() + "</td>"); 
        out.println("<td>" + c.getBookMemberId() + "</td>"); 
        out.println("<td>" + c.getBookStartTime() + "</td>"); 
        out.println("<td>" + c.getBookEndTime() + "</td>"); 
        out.println("<td>" + c.getBookStatus() + "</td>"); 
        out.println("<td>" + c.getBookRequestTime() + "</td>"); 
        out.println("<td>" + c.getBookPaymentReceipt() + "</td>"); 
        out.println("<td>" + c.getBookGuestListId() + "</td>"); 
        out.println("<td><a href='/Assignment/memberFunction/addBooking.jsp?action=edit&bookingRequestId="+  c.getBookingRequestId() + "'>Edit</a></td>");
        //out.println("<td><a href='/Assignment/BookRequestController?action=cancel&bookingRequestId="+  c.getBookingRequestId() + "'>Cancel Booking</a></td>");
        out.println("<td><a href='#' onclick=\"if (confirm(\'Are you sure you want to cancel booking?"+ "ID : "+ c.getBookingRequestId()
                + "\')) {window.location.href="
                        + "\'/Assignment/BookRequestController?action=cancel&bookingRequestId="+ c.getBookingRequestId() + "\'"
                        + ";};\">Cancel Booking</a></td>");
	out.println("</tr>"); } 
        out.println("</table>");
        %>
        <a href='/Assignment/memberMain.jsp'>Back to home page</a>
    </body>
</html>
