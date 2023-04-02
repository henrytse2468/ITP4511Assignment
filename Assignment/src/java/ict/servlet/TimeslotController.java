/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

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
@WebServlet(name = "TimeslotController", urlPatterns = {"/TimeslotController"})
public class TimeslotController extends HttpServlet {
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
            if ("list".equalsIgnoreCase(action)) { 
            // call the query db to get retrieve for all customer 
            ArrayList<String> tl = db.getAllTimeSlot(); 
            // set the result into the attribute 
            request.setAttribute("tl", tl); 
            // redirect the result to the listCustomers.jsp 
            RequestDispatcher rd; 
            rd = getServletContext().getRequestDispatcher("/staffFunction/listTimeslot.jsp"); 
            rd.forward(request, response);
            }else if("add".equalsIgnoreCase(action)) { 
            String timeslot = request.getParameter("timeslot");
            if(db.addTimeslot(timeslot) == false){
                PrintWriter out = response.getWriter();
                response.setContentType("text/html;charset=UTF-8");
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("Failed");
                out.println("<html><br/><a href='/Assignment/staffFunction/listTimeslot.jsp'>Back to listTimeslot</a></html>");
                }else{
                response.sendRedirect("/Assignment/staffFunction/listTimeslot.jsp");
            }
            }else if("edit".equalsIgnoreCase(action)) { 
            String editTimeslot = request.getParameter("editTimeslot");
            String orignalTimeslot = request.getParameter("orignalTimeslot");
            if(db.editTimeslot(editTimeslot, orignalTimeslot) == false){
                PrintWriter out = response.getWriter();
                response.setContentType("text/html;charset=UTF-8");
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("Failed");
                out.println("<html><br/><a href='/Assignment/staffFunction/listTimeslot.jsp'>Back to listTimeslot</a></html>");
                }else{
                response.sendRedirect("/Assignment/staffFunction/listTimeslot.jsp");
            }
            }
            else if("delete".equalsIgnoreCase(action)) { 
            String delTimeslot = request.getParameter("delTimeslot");
            if(db.delTimeslot(delTimeslot) == false){
                PrintWriter out = response.getWriter();
                response.setContentType("text/html;charset=UTF-8");
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("Failed");
                out.println("<html><br/><a href='/Assignment/staffFunction/listTimeslot.jsp'>Back to listTimeslot</a></html>");
            }
            else{
                response.sendRedirect("/Assignment/staffFunction/listTimeslot.jsp");
            }
            }
            else { 
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
