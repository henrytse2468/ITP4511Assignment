<%-- 
    Document   : checkInOut
    Created on : 2023年3月31日, 下午12:16:43
    Author     : henry
--%>

<%@page import="ict.bean.BookingRequestBean"%>
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
        <jsp:useBean id="userInfo" class="ict.bean.loginInfo" scope="session"/>
        <% 
         DB db;
            String dbUser = this.getServletContext().getInitParameter("dbUser");
            String dbPassword = this.getServletContext().getInitParameter("dbPassword");
            String dbUrl = this.getServletContext().getInitParameter("dbUrl");
            db = new DB(dbUrl, dbUser, dbPassword);

            ArrayList<BookingRequestBean> brb = db.getBookRequestByStaffId(userInfo.getUsername());
	out.println("<h1>Your Booking Record</h1>"); 
	out.println("<table border='1'>"); 
	out.println("<tr>"); 
	out.println("<th>BookingRequestId</th><th>bookDate</th><th>bookVenueId</th><th>bookMemberId</th><th>bookStartTime</th><th>BookEndTime</th><th>BookingStatus</th>"
                + "<th>BookRequestTime</th><th>BookPaymentReceipt</th><th>BookGuestListId</th><th>CheckIn/CheckOut</th><th>Time</th><th>Remark</th>"); 
	out.println("</tr>"); 
	// loop through the customer array to display each customer record 
	for (int i = 0; i < brb.size(); i++) {
	BookingRequestBean c = brb.get(i); 
        if(request.getParameter("bookingRequestId") != null && request.getParameter("bookingRequestId").equals(c.getBookingRequestId())){
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
        out.println("<td><form method='get' action='/Assignment/CheckInOutController'>");
        out.println("<input type='hidden' name='action' value='add'>");
        out.println("<input type='hidden' name='bookingRequestId' value='"+c.getBookingRequestId() +"'>");
        out.println("<input type='hidden' name='memberId' value='"+ c.getBookMemberId() +"'>");
        out.println("<select name='checkInOutType'><option value='0'>Check In</option><option value='1'>Check Out</option></select></td>");
        out.println("<td><input type='time' name='checkInOutTime'></td>");
        out.println("<td><input type='type' name='checkInOutRemark'></td>");
        out.println("<td><input type='submit' value='Add Record'></td></form>");
	out.println("</tr>"); 
        }else{    
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
        out.println("<td></td><td></td><td></td>"); 
        out.println("<td><a href='/Assignment/staffFunction/checkInOut.jsp?bookingRequestId="+  c.getBookingRequestId() + "'>Add Check In</a></td>");
        out.println("<td><a href='/Assignment/CheckInOutController?action=list&bookingRequestId="+  c.getBookingRequestId() + "'>Show Check In/Out Record</a></td>");
        //out.println("<td><a href='/Assignment/BookRequestController?action=cancel&bookingRequestId="+  c.getBookingRequestId() + "'>Cancel Booking</a></td>");
	out.println("</tr>"); 
        } 
        }
        out.println("</table>");
        %>
        <a href='/Assignment/staffMain.jsp'>Back to home page</a>
    </body>
</html>
