<%-- 
    Document   : venueBooking
    Created on : 2023年3月28日, 上午01:53:48
    Author     : henry
--%>

<%@page import="ict.bean.GuestListBean"%>
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
        ArrayList<GuestListBean> glb = (ArrayList<GuestListBean> )
	request.getAttribute("glb"); 
	out.println("<h1>Your GuestList</h1>"); 
	out.println("<table border='1'>"); 
	out.println("<tr>"); 
	out.println("<th>GuestListId</th>"); 
	out.println("</tr>"); 
	// loop through the customer array to display each customer record 
	for (int i = 0; i < glb.size(); i++) {
	GuestListBean c = glb.get(i); 
	out.println("<tr>"); out.println("<td>" + c.getGuestListId() + "</td>"); 
        out.println("<td><a href='GuestController?action=list&GuestListId="+  c.getGuestListId() + "'>Manage</a></td>");
	out.println("</tr>"); } 
        out.println("</table>");
        
	%>
        <a href='GuestListController?action=add&memberId=<%=userInfo.getId()%>'>Create New Guest List and Guest</a><br/>
        <a href='/Assignment/memberMain.jsp'>Back to home page</a>
    </body>
</html>
