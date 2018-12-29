/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import CodeHelpers.ConexionesDB;
import Modelo.Usuario;
import ModeloDAO.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import javax.websocket.Session;

/**
 *
 * @author oscar
 */
@WebServlet(name = "ControladorUsuario", urlPatterns = {"/ControladorUsuario"})
public class ControladorUsuario extends HttpServlet {

    Usuario u = new Usuario();
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
    String urlUsuarios = "Usuario/Usuario.jsp";
    String urlEditU = "Usuario/EditarUsuario.jsp";
    String urlBebidas = "Bebida/Bebida.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorUsuario at " + request.getContextPath() + "</h1>");
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
            acceso = urlUsuarios;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("noEmpleado", request.getParameter("noEmpleado"));
            acceso = urlEditU;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            int noEmpleado = Integer.parseInt(request.getParameter("noEmpleado"));
            String usuario = request.getParameter("usuario");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String domicilio = request.getParameter("domicilio");
            String contra = request.getParameter("contra");
            u.setnoEmpleado(noEmpleado);
            u.setUsuario(usuario);
            u.setEdad(edad);
            u.setDomicilio(domicilio);
            u.setContra(contra);
            usuarioDao.editar(u);
            acceso = urlUsuarios;
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

        String acceso = "";
        String action = request.getParameter("accion");
        System.out.println(action);
        if (action.equalsIgnoreCase("Usuario")) {
            acceso = urlUsuarios;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String usuario = request.getParameter("usuario");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String domicilio = request.getParameter("domicilio");
            String contra = request.getParameter("contra");

            u.setUsuario(usuario);
            u.setEdad(edad);
            u.setDomicilio(domicilio);
            u.setContra(contra);
            usuarioDao.Usuario(u);
            acceso = urlUsuarios;
        } else if (action.equalsIgnoreCase("Login")) {
            ConexionesDB conector = new ConexionesDB();
            Usuario p = new Usuario();
            ResultSet resultadoConsulta = null;
            String password = request.getParameter("password").toString();
            int user = Integer.parseInt(request.getParameter("user"));
            int nivel = 0;
            try {
                resultadoConsulta = conector.consulta("select * from Usuario where noEmpleado=" + user + " and contra='" + password + "'");
                while (resultadoConsulta.next()) {
                    System.out.println("imprime");
                    nivel = (resultadoConsulta.getInt("nivel"));
                    System.out.println("nivel : " + (resultadoConsulta.getInt("nivel")));
                }
                    if (nivel == 1) {
                        System.out.println("Dentro 1");
                        acceso = urlUsuarios;
                        RequestDispatcher vista = request.getRequestDispatcher(acceso);
                        vista.forward(request, response);
                    } else if (nivel == 2) {
                        System.out.println("Dentro 2");
                        acceso = urlUsuarios;
                        RequestDispatcher vista = request.getRequestDispatcher(acceso);
                        vista.forward(request, response);
                    } else if (nivel == 3) {
                        System.out.println("Dentro 3");
                        acceso = urlUsuarios;
                        RequestDispatcher vista = request.getRequestDispatcher(acceso);
                        vista.forward(request, response);
                    } else {
                        acceso = "index.jsp";
                        RequestDispatcher vista = request.getRequestDispatcher(acceso);
                        vista.forward(request, response);
                    }

                // RequestDispatcher vista = request.getRequestDispatcher(acceso);
                // vista.forward(request, response);
            } catch (IOException | ClassNotFoundException | SQLException e) {
                System.out.println(e);
            }

        }

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
