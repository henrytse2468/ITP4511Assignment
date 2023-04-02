<%-- 
    Document   : listCheckRecordbyId
    Created on : 2023年3月31日, 下午03:51:42
    Author     : henry
--%>

<%@page import="ict.bean.checkRecord"%>
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
        ArrayList<checkRecord> crs = (ArrayList<checkRecord> )
	request.getAttribute("crs"); 
	out.println("<h1>The Check In Out Record of : "+ crs.get(1).getBookingRequestId()+"</h1>"); 
	out.println("<table border='1'>"); 
	out.println("<tr>"); 
	out.println("<th>checkInOutRecordId</th><th>bookingRequestId</th><th>memberId </th><th>checkInOutType</th><th>checkInOutTime</th><th>checkInOutRemark</th>"); 
	out.println("</tr>"); 
	// loop through the customer array to display each customer record 
	for (int i = 0; i < crs.size(); i++) {
	checkRecord c = crs.get(i); 
	out.println("<tr>"); 
        out.println("<td>" + c.getCheckInOutRecord() + "</td>");
        out.println("<td>" + c.getBookingRequestId() + "</td>"); 
        out.println("<td>" + c.getMemberId() + "</td>"); 
        out.println("<td>" + c.getCheckInOutType() + "</td>"); 
        out.println("<td>" + c.getCheckInOutTime() + "</td>"); 
        out.println("<td>" + c.getCheckInOutRemark() + "</td>"); 
        out.println("<td><a href='CheckInOutController?action=edit&checkInOutRecord="+ c.getCheckInOutRecord() + "&bookingRequestId="+ c.getBookingRequestId() +"'>Edit</a></td>");
        out.println("<td><a href='#' onclick=\"if (confirm(\'Are you sure you want to delete?"+ "ID : "+ c.getCheckInOutRecord() + "\')) {window.location.href="
                        + "\'/Assignment/CheckInOutController?action=delete&checkInOutRecord="+ c.getCheckInOutRecord() + "&bookingRequestId="+ c.getBookingRequestId() + "\'"
                        + ";};\">Delete</a></td>");
	out.println("</tr>"); } 
        out.println("</table>");
            
        %>
        <a href='/Assignment/staffMain.jsp'>Back to home page</a>
    </body>
</html>
