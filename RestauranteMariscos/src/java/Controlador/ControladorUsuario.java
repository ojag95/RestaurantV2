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
        } else if (action.equalsIgnoreCase("eliminar")) {
            String usuario = request.getParameter("usuario");
            u.setUsuario(usuario);
            usuarioDao.eliminar(usuario);
            acceso = urlUsuarios;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("usuario", request.getParameter("usuario"));
            acceso = urlEditU;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            String usuario = request.getParameter("usuario");
            String apellido = request.getParameter("apellido");
            String puesto = request.getParameter("puesto");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String domicilio = request.getParameter("domicilio");
            String contrasenia = request.getParameter("contrasenia");
            u.setUsuario(usuario);
            u.setApellido(apellido);
            u.setPuesto(puesto);
            u.setEdad(edad);
            u.setDomicilio(domicilio);
            u.setContrasenia(contrasenia);
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
            String apellido = request.getParameter("apellido");
            String puesto = request.getParameter("puesto");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String domicilio = request.getParameter("domicilio");
            String contrasenia = request.getParameter("contrasenia");
            
            u.setUsuario(usuario);
            u.setApellido(apellido);
            u.setPuesto(puesto);
            u.setEdad(edad);
            u.setDomicilio(domicilio);
            u.setContrasenia(contrasenia);
            usuarioDao.Usuario(u);
            acceso = urlUsuarios;
        }else if (action.equalsIgnoreCase("Login")) {
            ConexionesDB conector = new ConexionesDB();
            Usuario p = new Usuario();
            ResultSet resultadoConsulta = null;
            String password = request.getParameter("password").toString();
            String user = request.getParameter("user");
            Boolean status=false;
            try {
                resultadoConsulta = conector.consulta("select * from Usuario where usuario='" + user + "' and contrasenia='" + password + "'");
                while (resultadoConsulta.next()) {
                    System.out.println("imprime");
                    status=true;
                }
                if (status)
                {
                    System.out.println("Dentro");
                    acceso = "Acerca.jsp";
                }
                else{
                    acceso = "index.jsp";
                }
                RequestDispatcher vista = request.getRequestDispatcher(acceso);
                vista.forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }

        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
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
