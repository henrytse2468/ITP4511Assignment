<%-- 
    Document   : addVenue
    Created on : 2023年3月30日, 下午04:09:21
    Author     : henry
--%>

<%@page import="ict.bean.imageListBean"%>
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
        <jsp:useBean id="userInfo" class="ict.bean.loginInfo" scope="session"/>
    <body>
        <%
            DB db;
            String dbUser = this.getServletContext().getInitParameter("dbUser");
            String dbPassword = this.getServletContext().getInitParameter("dbPassword");
            String dbUrl = this.getServletContext().getInitParameter("dbUrl");
            db = new DB(dbUrl, dbUser, dbPassword);
            
            //String type = request.getParameter("bookingRequestId") != null ? "edit" : "add";             
            //String selectedVenue = request.getParameter("venueId");
            //ArrayList<VenueBean> venues = db.getAllVenue();
            //ArrayList listId = new ArrayList();
            //out.println("<h1>"+ selectedVenue + "</h1>");
            //out.println("<h1>"+db.getLatestId("bookingRequest", "bookingRequestId")+ "</h1>");
            ArrayList<imageListBean> ImageLists = db.getAllImageList();
            ArrayList staffList = db.getAllStaff();
        %>
        <h4>Add New Venue</h4>
        <form method="get" action="/Assignment/VenueController">
           <input type="hidden" name="action" value="add">
           venueImageList : 
           <select name="imageListId">
               <%
                   for(int i=0; i<ImageLists.size(); i++){
                       out.println("<option value='" + ImageLists.get(i).getImageListId() + "'>" + ImageLists.get(i).getImageListName() + "</option>");
                   }           
               %>
           </select>
           <br/>
           venueName : <input type="text" name="venueName"><br/>
           venueType : <input type="text" name="venueType"><br/>
           venueCapacity : <input type="text" name="venueCapacity"><br/>
           venueLocation : <input type="text" name="venueLocation"><br/>
           venueDescription : <input type="text" name="venueDesc"><br/>
           venuePersonInCharge : 
           <select name="venuePIC">
               <%
               for(int i=0; i<staffList.size(); i++){
                       out.println("<option value='" + staffList.get(i) + "'>" + staffList.get(i) + "</option>");
                   }
                              %>
           </select><br/>
           venueHourlyFee : <input type="number" name="venueHourlyFee"><br/>
           <input type="submit" value="submit">
             
       </form>
             <a href='/Assignment/staffMain.jsp'>Back to home page</a>
    </body>
</html>
