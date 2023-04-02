/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.GuestListBean;
import ict.bean.VenueBean;
import ict.db.DB;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
@WebServlet(name = "GuestListController", urlPatterns = {"/GuestListController"})
public class GuestListController extends HttpServlet {
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
            ArrayList<GuestListBean> glb = db.getGuestListByMemberId(memberId); 
            // set the result into the attribute 
            request.setAttribute("glb", glb); 
            // redirect the result to the listCustomers.jsp 
            RequestDispatcher rd; 
            rd = getServletContext().getRequestDispatcher("/memberFunction/listGuestList.jsp"); 
            rd.forward(request, response);
            }else if("add".equalsIgnoreCase(action) && memberId != null){
            PrintWriter out = response.getWriter();
            out.println(db.addGuestList(memberId));
            request.setAttribute("GuestListId", db.getCurrentId("guestList", "guestListId"));
            RequestDispatcher rd; 
            rd = getServletContext().getRequestDispatcher("/memberFunction/listGuest.jsp"); 
            rd.forward(request, response);
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
