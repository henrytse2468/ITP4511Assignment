/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.GuestBean;
import ict.bean.checkRecord;
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
@WebServlet(name = "CheckInOutController", urlPatterns = {"/CheckInOutController"})
public class CheckInOutController extends HttpServlet {
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
            String bookingRequestId = request.getParameter("bookingRequestId"); 
            if("list".equalsIgnoreCase(action) && bookingRequestId != null) { 
            // call the query db to get retrieve for all customer 
            ArrayList<checkRecord> crs = db.getCheckRecordById(bookingRequestId); 
            // set the result into the attribute 
            request.setAttribute("crs", crs); 
            // redirect the result to the listCustomers.jsp 
            RequestDispatcher rd; 
            rd = getServletContext().getRequestDispatcher("/staffFunction/listCheckRecordbyId.jsp"); 
            rd.forward(request, response);
            }else if("add".equalsIgnoreCase(action)) { 
               
                String memberId = request.getParameter("memberId");
                String checkInOutType = request.getParameter("checkInOutType");
                String checkInOutTime = request.getParameter("checkInOutTime")+":00";
                String checkInOutRemark = request.getParameter("checkInOutRemark");
                if(db.addCheckInOutRecord(bookingRequestId, memberId, checkInOutType, checkInOutTime, checkInOutRemark) == false){
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html;charset=UTF-8");
                    /* TODO output your page here. You may use following sample code. */
                    out.println("<!DOCTYPE html>");
                    out.println("Failed");
                    out.println("<html><br/><a href='/Assignment/staffFunction/checkInOut.jsp'>Back to CheckInOut</a></html>");
                    }else{
                        response.sendRedirect("/Assignment/staffFunction/checkInOut.jsp");
                    }
            }
            else if("edit".equalsIgnoreCase(action)) { 
               
                String checkInOutRecordId = request.getParameter("checkInOutRecord");
                bookingRequestId = request.getParameter("bookingRequestId");
                if(bookingRequestId != null & checkInOutRecordId != null) { 
                ArrayList<checkRecord> crs = db.getCheckRecordById(bookingRequestId); 
                    // set the result into the attribute 
                request.setAttribute("crs", crs);
                request.setAttribute("editCIOR", checkInOutRecordId); 
                    // redirect the result to the listCustomers.jsp 
                RequestDispatcher rd; 
                rd = getServletContext().getRequestDispatcher("/staffFunction/editCheckInOutRecord.jsp"); 
                rd.forward(request, response);
                }else{
                PrintWriter out = response.getWriter();
                    response.setContentType("text/html;charset=UTF-8");
                    /* TODO output your page here. You may use following sample code. */
                    out.println("<!DOCTYPE html>");
                    out.println("Failed");
                    out.println("<html><br/><a href='/Assignment/staffFunction/checkInOut.jsp'>Back to CheckInOut</a></html>");}
            }
            else if("editConfirm".equalsIgnoreCase(action)) { 
               
                String checkInOutRecordId = request.getParameter("checkInOutRecordId");
                String checkInOutType = request.getParameter("checkInOutType");
                String checkInOutTime = request.getParameter("checkInOutTime");
                String checkInOutRemark = request.getParameter("checkInOutRemark");
                if(db.editCheckInOutRecord(checkInOutRecordId, checkInOutType, checkInOutTime, checkInOutRemark) == false){
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html;charset=UTF-8");
                    /* TODO output your page here. You may use following sample code. */
                    out.println("<!DOCTYPE html>");
                    out.println("Failed");
                    out.println("<html><br/><a href='/Assignment/staffFunction/checkInOut.jsp'>Back to CheckInOut</a></html>");
                    }else{
                    ArrayList<checkRecord> crs = db.getCheckRecordById(bookingRequestId); 
                    // set the result into the attribute 
                    request.setAttribute("crs", crs);
                    // redirect the result to the listCustomers.jsp 
                    RequestDispatcher rd; 
                    rd = getServletContext().getRequestDispatcher("/staffFunction/listCheckRecordbyId.jsp"); 
                    rd.forward(request, response);
            }
            }else if("delete".equalsIgnoreCase(action)) { 
               
                String checkInOutRecordId = request.getParameter("checkInOutRecord");

                if(db.delCheckInOutRecord(checkInOutRecordId) == false){
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html;charset=UTF-8");
                    /* TODO output your page here. You may use following sample code. */
                    out.println("<!DOCTYPE html>");
                    out.println("Failed");
                    out.println("<html><br/><a href='/Assignment/staffFunction/checkInOut.jsp'>Back to CheckInOut</a></html>");
                    }else{
                    ArrayList<checkRecord> crs = db.getCheckRecordById(bookingRequestId); 
                    // set the result into the attribute 
                    request.setAttribute("crs", crs);
                    // redirect the result to the listCustomers.jsp 
                    RequestDispatcher rd; 
                    rd = getServletContext().getRequestDispatcher("/staffFunction/listCheckRecordbyId.jsp"); 
                    rd.forward(request, response);
            }    
                
            }else{
                PrintWriter out = response.getWriter(); out.println("No such action!!!");
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
