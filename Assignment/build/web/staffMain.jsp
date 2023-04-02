<%-- 
    Document   : staffMain
    Created on : 2023年3月28日, 上午01:31:56
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
        <h1>Welcome,  <jsp:getProperty name="userInfo" property="username"/></h1>
        <a href='staffFunction/staffListVenue.jsp'>Venue Management</a><br/>
        <a href='TimeslotController?action=list'>TimeSlot Management</a><br/>
        <a href='staffFunction/approveBooking.jsp'>Booking Management</a><br/>
        <a href='staffFunction/checkInOut.jsp'>CheckIn/CheckOut</a>
    </body>
</html>
