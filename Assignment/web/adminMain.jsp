<%-- 
    Document   : adminMain
    Created on : 2023年3月28日, 上午01:32:19
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
        <a href=''>Analytics</a><br/>
        <a href=''>Report</a><br/>
        <a href=''>User Account Management</a>
    </body>
</html>
