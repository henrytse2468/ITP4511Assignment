<%-- 
    Document   : addBooking
    Created on : 2023年3月29日, 上午02:13:24
    Author     : henry
--%>

<%@page import="ict.bean.GuestListBean"%>
<%@page import="ict.bean.VenueBean"%>
<%@page import="ict.db.DB"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:useBean id="userInfo" class="ict.bean.loginInfo" scope="session"/>
    <body>
        <%
            DB db;
            String dbUser = this.getServletContext().getInitParameter("dbUser");
            String dbPassword = this.getServletContext().getInitParameter("dbPassword");
            String dbUrl = this.getServletContext().getInitParameter("dbUrl");
            db = new DB(dbUrl, dbUser, dbPassword);
            
            String type = request.getParameter("bookingRequestId") != null ? "edit" : "add";             
            String selectedVenue = request.getParameter("venueId");
            ArrayList<VenueBean> venues = db.getAllVenue();
            ArrayList listId = new ArrayList();
            ArrayList listName = new ArrayList();
            for(int i=0; i<venues.size(); i++){
                listId.add(venues.get(i).getVenueId());
                listName.add(venues.get(i).getVenueName());
            }
            ArrayList dates = db.getAllDate();
            ArrayList timeSlots = db.getAllTimeSlot();
            
            ArrayList<GuestListBean> guestLists = db.getGuestListByMemberId(userInfo.getId());
            //out.println("<h1>"+ selectedVenue + "</h1>");
            //out.println("<h1>"+db.getLatestId("bookingRequest", "bookingRequestId")+ "</h1>");
        %>
       <form method="get" action="/Assignment/BookRequestController">
           <input type="hidden" name="action" value="<%=type%>">
           <input type="hidden" name="memberId" value="<%=userInfo.getId()%>">
           <%
           if (request.getParameter("bookingRequestId") != null){
                       out.println("<h4>Update Booking Request</h4>");
                       out.println("<p>BookingRequestId: "+request.getParameter("bookingRequestId")+"</p>");
                       out.println("<input type='hidden' name='bookingRequestId' value='"+request.getParameter("bookingRequestId")+"'>" );
                   }else{
               out.println("<h4>Add Booking Request<h4>");
           }     
           
           %>
           Select Venue:
           <select name="selectVenue">
               <%
                   
                   for(int i=0; i<venues.size(); i++){
                       
                       if((listId.get(i)).equals(selectedVenue)){
                       out.println("<option value='" + listId.get(i) + "' selected>" + listName.get(i) + "</option>");
                       }else{
                       out.println("<option value='" + listId.get(i) + "'>" + listName.get(i) + "</option>");
                       }
                   }
               %>
             </select><br/>
             Select Date:
           <select name="selectDate">  
            <%
               for(int i =0; i<dates.size(); i++){
                    out.println("<option value='" + dates.get(i) + "'>" +  dates.get(i) + "</option>");
                    
               }
            %>
             </select><br/>
             Select Start Time:
           <select name="selectStartTime">  
            <%
               for(int i =0; i<timeSlots.size(); i++){
                    out.println("<option value='" + timeSlots.get(i) + "'>" +  timeSlots.get(i) + "</option>");
               }
            %>
             </select><br/>
             Select End Time:
            <select name="selectEndTime">  
            <%
               for(int i =0; i<timeSlots.size(); i++){
                    out.println("<option value='" + timeSlots.get(i) + "'>" +  timeSlots.get(i) + "</option>");
               }
            %>
             </select><br/>
            Select Guest List:
            <select name="selectGuestList">  
            <%
               for(int i =0; i<guestLists.size(); i++){
                    out.println("<option value='" + guestLists.get(i).getGuestListId() + "'>" +  guestLists.get(i).getGuestListId() + "</option>");
               }
            %>
             </select><br/>
             <input type="submit" value="submit">
             
       </form>
             <a href='/Assignment/memberMain.jsp'>Back to home page</a>
    </body>
</html>
