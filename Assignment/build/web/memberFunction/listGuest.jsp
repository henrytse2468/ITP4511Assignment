<%-- 
    Document   : listGuest
    Created on : 2023年3月28日, 下午11:37:47
    Author     : henry
--%>

<%@page import="ict.db.DB"%>
<%@page import="ict.bean.GuestBean"%>
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
            
        ArrayList<GuestBean> gl = (ArrayList<GuestBean> )db.getGuestByGuestListId(request.getParameter("GuestListId")); 
	out.println("<h1>Your Guest in GuestList : " + request.getParameter("GuestListId") + "</h1>");
        out.println("<form method='get' action='GuestController'>");
	out.println("<table border='1'>"); 
	out.println("<tr>"); 
	out.println("<th>GuestId</th><th>GuestName</th><th>GuestEmail</th>"); 
	out.println("</tr>"); 
	// loop through the customer array to display each customer record 
	for (int i = 0; i < gl.size(); i++) {
	GuestBean c = gl.get(i); 
	out.println("<tr>"); 
        out.println("<td>" + c.getGuestId() + "</td>");
        out.println("<td>" + c.getGuestName() + "</td>");
        out.println("<td>" + c.getGuestEmail() + "</td>");
        //out.println("<td>" + c.getGuestListId() + "</td>");
        out.println("<td><a href='/Assignment/memberFunction/editGuest.jsp?guestId=" + c.getGuestId() + "&GuestListId=" + request.getParameter("GuestListId")+ "'>Edit</a></td>");
        out.println("<td><a href='#' onclick=\"if (confirm(\'Are you sure you want to delete?"+ "ID : "+ c.getGuestId() + "Name : " + c.getGuestName()
                + "\')) {window.location.href="
                        + "\'/Assignment/GuestController?action=delete&guestId="+ c.getGuestId() + "&GuestListId="+ c.getGuestListId() + "\'"
                        + ";};\">Delete</a></td>");
	out.println("</tr>");
        }
        %>
        <tr>
        <td><input type='text' name='guestId' value='<%=db.getLatestId("guest", "guestId")%>' readonly></td>
        <td><input type='text' name='guestName'></td>
        <td><input type='text' name='guestEmail'></td>
        <input type='hidden' name='action' value='add'>
        <input type='hidden' name='GuestListId' value='<%=request.getParameter("GuestListId")%>'>
        <td><input type='submit' value='addGuest'></td>
        </tr>
        </table>
        <a href='/Assignment/memberMain.jsp'>Back to home page</a>
        
	
        
    </body>
</html>
