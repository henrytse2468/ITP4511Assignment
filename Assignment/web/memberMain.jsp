<%-- 
    Document   : customerMain.jsp
    Created on : 2023年3月28日, 上午01:31:40
    Author     : henry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="userInfo" class="ict.bean.loginInfo" scope="session"/>
        <h1>Welcome,  <jsp:getProperty name="userInfo" property="username"/><jsp:getProperty name="userInfo" property="id"/></h1>
        <%
            
            String id = userInfo.getId();
        %>
        <a href='VenueController?action=list'>Venue Booking</a><br/>
        <a href='GuestListController?action=list&memberId=<%=id%>'>Guest List Management</a><br/>
        <a href='BookRequestController?action=list&memberId=<%=id%>'>Check Personal Booking Records</a>
    </body>
</html>
