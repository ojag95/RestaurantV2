/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Platillo;
import ModeloDAO.PlatilloDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author oscar
 */
@WebServlet(name = "ControladorPlatillo", urlPatterns = {"/ControladorPlatillo"})
public class ControladorPlatillo extends HttpServlet {
    Platillo platillo =new Platillo();
    PlatilloDAO platilloDao = new PlatilloDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String urlPlatillos="Platillo/Platillos.jsp";
    String urlEditP="Platillo/EditarPlatillo.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorPlatillo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorPlatillo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
      //  processRequest(request, response);
        String acceso="";
        String action=request.getParameter("accion");
        System.out.println(action);
        if (action.equalsIgnoreCase("Platillo")){
          acceso=urlPlatillos;   
        }else if (action.equalsIgnoreCase("Agregar")) {
            String nombrePlatillo=request.getParameter("nombrePlatillo");
            String descripcion= request.getParameter("descripcion");
            float precioPlatillo=Float.parseFloat(request.getParameter("precioPlatillo"));
            platillo.setNombrePlatillo(nombrePlatillo);
            platillo.setDescripcionPlatillo(descripcion);
            platillo.setPrecioPlatillo(precioPlatillo);
            platilloDao.Platillo(platillo);
            acceso=urlPlatillos; 
        }else if (action.equalsIgnoreCase("eliminar")) {
            int idPlatillo = Integer.parseInt(request.getParameter("idPlatillo"));
            platillo.setIdPlatillo(idPlatillo);
            platilloDao.eliminar(idPlatillo);
            acceso=urlPlatillos;
        }else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idPlatillo",request.getParameter("idPlatillo"));
            acceso=urlEditP;     
        }else if(action.equalsIgnoreCase("Actualizar")){
            int idPlatillo=Integer.parseInt(request.getParameter("idPlatillo"));
            String nombrePlatillo=request.getParameter("nombrePlatillo");
            String descripcion= request.getParameter("descripcion");
            float precioPlatillo=Float.parseFloat(request.getParameter("precioPlatillo"));
            platillo.setIdPlatillo(idPlatillo);
            platillo.setNombrePlatillo(nombrePlatillo);
            platillo.setDescripcionPlatillo(descripcion);
            platillo.setPrecioPlatillo(precioPlatillo);
            platilloDao.editar(platillo);
            acceso=urlPlatillos;
        }
        RequestDispatcher vista =request.getRequestDispatcher(acceso);
        vista.forward(request, response);
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
