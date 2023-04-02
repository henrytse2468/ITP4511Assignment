<%-- 
    Document   : loginError
    Created on : Mar 15, 2023, 10:03:23 AM
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
        <% 
            out.println("<a href='"+ request.getContextPath() + "/main'>Login again!</a>");
        %>
    </body>
</html>
