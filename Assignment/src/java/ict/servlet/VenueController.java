/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.VenueBean;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author henry
 */
@WebServlet(name = "VenueController", urlPatterns = {"/VenueController"})
public class VenueController extends HttpServlet {
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
            ArrayList<VenueBean> venues = db.getAllActiveVenue(); 
            // set the result into the attribute 
            request.setAttribute("venues", venues); 
            HttpSession session = request.getSession(true);
            session.setAttribute("venues", venues);
            // redirect the result to the listCustomers.jsp 
            RequestDispatcher rd; 
            rd = getServletContext().getRequestDispatcher("/memberFunction/listVeune.jsp"); 
            rd.forward(request, response);
            }else if("add".equalsIgnoreCase(action)) { 
                String imageListId = request.getParameter("imageListId");
                String venueName = request.getParameter("venueName");
                String venueType = request.getParameter("venueType");
                String venueCapacity = request.getParameter("venueCapacity");
                String venueLocation = request.getParameter("venueLocation");
                String venueDesc = request.getParameter("venueDesc");
                String venuePIC = request.getParameter("venuePIC");
                int venueHourlyFee = Integer.parseInt(request.getParameter("venueHourlyFee"));
                PrintWriter out = response.getWriter();
                out.println(db.addVenue(imageListId, venueName, venueType,  venueCapacity, venueLocation, venueDesc, venuePIC, venueHourlyFee));
                response.sendRedirect("/Assignment/staffFunction/staffListVenue.jsp"); 

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
