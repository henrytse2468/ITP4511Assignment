<%-- 
    Document   : welcome
    Created on : Mar 15, 2023, 10:03:32 AM
    Author     : user
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
        <b>Hello, <jsp:getProperty name="userInfo" property="username"/>
            </b>
            <p>Welcome to the ICT</p>
            <form method="post" action="main">
                <input type="hidden" name="action" value="logout">
                <input type="submit" value="logout" name="logoutButton">
             </form>
            <hr/>
            <a href="brandController?action=list">getAllBrands</a><br/>
    </body>
</html>
