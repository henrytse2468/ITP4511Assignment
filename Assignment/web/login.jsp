<%-- 
    Document   : login
    Created on : Mar 15, 2023, 10:03:11 AM
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
        <form method ="post" action="main">
            <input type="hidden" name="action" value="authenticate"/>
            <table border="0">
                <tr><td><p align="right"><b>login:</b></td>
                    <td><p><input type="text" name="username" maxLenght="10" size="15">
                </tr>
                <tr>
                    <td><p align="right"><b>password:</b></td>
                    <td><p><input type="password" name="password" maxLength="10" size="15">
                            </tr>
                            <tr>
                                <td colspan="2"><p align="center"><input type="submit" value="Login"></p></td>
                               </tr>
                               </table>
            </form>
                                    
    </body>
</html>
