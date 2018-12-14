/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Usuario;
import ModeloDAO.UsuarioDAO;
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
@WebServlet(name = "ControladorUsuario", urlPatterns = {"/ControladorUsuario"})
public class ControladorUsuario extends HttpServlet {

    Usuario usuario = new Usuario();
    UsuarioDAO usuarioDao = new UsuarioDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String urlUsuario = "Usuario/Usuario.jsp";
    String urlEditU = "Usuario/EditarUsuario.jsp";

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
        String acceso = "";
        String action = request.getParameter("accion");
        System.out.println(action);

        if (action.equalsIgnoreCase("Usuario")) {
            acceso = urlUsuario;

        } else if (action.equalsIgnoreCase("Agregar")) {
            String nombre = request.getParameter("nombre");
            String puesto = request.getParameter("puesto");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String domicilio = request.getParameter("domicilio");
            String usr = request.getParameter("usr");
            String contrasenia = request.getParameter("contrasenia");

            usuario.setnombre(nombre);
            usuario.setpuesto(puesto);
            usuario.setedad(edad);
            usuario.setdomicilio(domicilio);
            usuario.setusr(usr);
            usuario.setcontrasenia(contrasenia);
            usuarioDao.Usuario(usuario);

            acceso = urlUsuario;

        } else if (action.equalsIgnoreCase("eliminar")) {
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            usuario.setidUsuario(idUsuario);
            usuarioDao.eliminar(idUsuario);
            acceso = urlUsuario;

        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idUsuario", request.getParameter("idUsuario"));
            acceso = urlEditU;

        } else if (action.equalsIgnoreCase("Actualizar")) {
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

            String nombre = request.getParameter("nombre");
            String puesto = request.getParameter("puesto");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String domicilio = request.getParameter("domicilio");
            String usr = request.getParameter("usr");
            String contrasenia = request.getParameter("contrasenia");
            usuario.setidUsuario(idUsuario);
            usuario.setnombre(nombre);
            usuario.setpuesto(puesto);
            usuario.setedad(edad);
            usuario.setdomicilio(domicilio);
            usuario.setusr(usr);
            usuario.setcontrasenia(contrasenia);

            acceso = urlUsuario;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
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
