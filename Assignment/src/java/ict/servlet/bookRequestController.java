/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.BookingRequestBean;
import ict.bean.GuestBean;
import ict.db.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author henry
 */
@WebServlet(name = "bookRequestController", urlPatterns = {"/BookRequestController"})
public class bookRequestController extends HttpServlet {
    private DB db;
    @Override
     public void init(){
         String dbUser = this.getServletContext().getInitParameter("dbUser");
         String dbPassword = this.getServletContext().getInitParameter("dbPassword");
         String dbUrl = this.getServletContext().getInitParameter("dbUrl");
         db = new DB(dbUrl, dbUser, dbPassword);
         
     }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action"); 
        String memberId = request.getParameter("memberId");
            if ("list".equalsIgnoreCase(action) && memberId != null) { 
            // call the query db to get retrieve for all customer 
            ArrayList<BookingRequestBean> brb = db.getBookRequestByMemberId(memberId); 
            // set the result into the attribute 
            request.setAttribute("brb", brb); 
            // redirect the result to the listCustomers.jsp 
            RequestDispatcher rd; 
            rd = getServletContext().getRequestDispatcher("/memberFunction/listBooking.jsp"); 
            rd.forward(request, response);
            }else if("add".equalsIgnoreCase(action)){
            String selectVenue  = request.getParameter("selectVenue");
            String selectDate  = request.getParameter("selectDate");
            String selectStartTime  = request.getParameter("selectStartTime");
            String selectEndTime  = request.getParameter("selectEndTime");
            String selectGuestList  = request.getParameter("selectGuestList");
            db.addBookRequest(selectVenue, selectDate, memberId, selectStartTime, selectEndTime, selectGuestList);
            response.sendRedirect("/Assignment/memberFunction/listBooking.jsp");
            }
            else if("edit".equalsIgnoreCase(action)){
            String bookingRequestId  = request.getParameter("bookingRequestId");
            String selectVenue  = request.getParameter("selectVenue");
            String selectDate  = request.getParameter("selectDate");
            String selectStartTime  = request.getParameter("selectStartTime");
            String selectEndTime  = request.getParameter("selectEndTime");
            String selectGuestList  = request.getParameter("selectGuestList");
            PrintWriter out = response.getWriter();
            out.println("<p>"+db.editBookRequest(bookingRequestId, selectVenue, selectDate, selectStartTime, selectEndTime, selectGuestList)+"</p>");
            response.sendRedirect("/Assignment/memberFunction/listBooking.jsp");
            }else if("cancel".equalsIgnoreCase(action)){
            String bookingRequestId  = request.getParameter("bookingRequestId");
            PrintWriter out = response.getWriter();
            out.println("<p>"+db.cancelBooking(bookingRequestId)+"</p>");
            response.sendRedirect("/Assignment/memberFunction/listBooking.jsp");
            }
            else if("approve".equalsIgnoreCase(action)){
            String bookingRequestId  = request.getParameter("bookingRequestId");
            if(db.approveBookRequest(bookingRequestId) == false){
                PrintWriter out = response.getWriter();
                response.setContentType("text/html;charset=UTF-8");
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("Failed");
                out.println("<html><br/><a href='/Assignment/staffFunction/approveBooking.jsp'>Back to Booking List</a></html>");
                }else{
                response.sendRedirect("/Assignment/staffFunction/approveBooking.jsp");
            }
            }
            else if("reject".equalsIgnoreCase(action)){
            String bookingRequestId  = request.getParameter("bookingRequestId");
            if(db.rejectBookRequest(bookingRequestId) == false){
                PrintWriter out = response.getWriter();
                response.setContentType("text/html;charset=UTF-8");
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("Failed");
                out.println("<html><br/><a href='/Assignment/staffFunction/approveBooking.jsp'>Back to Booking List</a></html>");
                }else{
                response.sendRedirect("/Assignment/staffFunction/approveBooking.jsp");
            }
            }else if("cancel".equalsIgnoreCase(action)){
            String bookingRequestId  = request.getParameter("bookingRequestId");
            PrintWriter out = response.getWriter();
            out.println("<p>"+db.cancelBooking(bookingRequestId)+"</p>");
            response.sendRedirect("/Assignment/memberFunction/listBooking.jsp");
            }
            else { 
            PrintWriter out = response.getWriter(); 
            out.println("No such action!!!");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
