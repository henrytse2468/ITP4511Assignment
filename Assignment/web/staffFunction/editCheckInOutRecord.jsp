<%-- 
    Document   : editCheckInOutRecord
    Created on : 2023年4月2日, 下午03:40:43
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
        DB db;
            String dbUser = this.getServletContext().getInitParameter("dbUser");
            String dbPassword = this.getServletContext().getInitParameter("dbPassword");
            String dbUrl = this.getServletContext().getInitParameter("dbUrl");
            db = new DB(dbUrl, dbUser, dbPassword);
            
        ArrayList<checkRecord> crs = (ArrayList<checkRecord> )request.getAttribute("crs");
        String editCheckInOutRecord = (String)request.getAttribute("editCIOR");
	out.println("<h1>The Check In Out Record of : "+ crs.get(1).getBookingRequestId()+"</h1>"); 
        //out.println("<h1>"+request.getAttribute("editCIOR")+"</h1>");
	out.println("<table border='1'>"); 
	out.println("<tr>");
        
	out.println("<th>checkInOutRecordId</th><th>bookingRequestId</th><th>memberId </th><th>checkInOutType</th><th>checkInOutTime</th><th>checkInOutRemark</th>"); 
	out.println("</tr>"); 
	// loop through the customer array to display each customer record 
	for (int i = 0; i < crs.size(); i++) {
	checkRecord c = crs.get(i); 
        if(c.getCheckInOutRecord().equals(editCheckInOutRecord)){
        out.println("<tr>");
        out.println("<form method='get' action='/Assignment/CheckInOutController'>");
        out.println("<input type='hidden' name='action' value='editConfirm'>");
        out.println("<td><input type='text' name='checkInOutRecordId' value='"+ c.getCheckInOutRecord()+ "' readOnly></td>");
        out.println("<td><input type='text' name='bookingRequestId' value='"+ c.getBookingRequestId()+ "' readOnly></td>");
        out.println("<td><input type='text' name='memberId' value='"+ c.getMemberId()+"' readonly></td>");
        if(c.getCheckInOutType() == "1"){
                out.println("<td><select name='checkInOutType'>"
                + "<option value='0'>Check In</option>"
                + "<option value='1' selected>Check Out</option>"
                + "</select></td>");
        }else{
            out.println("<td><select name='checkInOutType'>"
                + "<option value='0'selected>Check In</option>"
                + "<option value='1'>Check Out</option>"
                + "</select></td>");       
        
        }
        out.println("<td><input type='text' name='checkInOutTime' value='" + c.getCheckInOutTime() + "'></td>");
        out.println("<td><input type='text' name='checkInOutRemark' value='" + c.getCheckInOutRemark() + "'></td>");
        out.println("<td><input type='submit' value='confirm edit info'></td></form>");
        out.println("</tr>");
        }else{
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
	out.println("</tr>"); 
            } 
        }
        out.println("</table>");
        
        %>
        <a href='/Assignment/memberMain.jsp'>Back to home page</a>
    </body>
</html>
