/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Producto;
import ModeloDAO.ProductoDAO;
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
@WebServlet(name = "ControladorProducto", urlPatterns = {"/ControladorProducto"})
public class ControladorProducto extends HttpServlet {
    Producto producto =new Producto();
    ProductoDAO productoDao = new ProductoDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String urlPlatillos="Producto/Platillos.jsp";
    String urlEditP="Producto/EditarP.jsp";
    String urlBebidas="Bebida/Bebida.jsp";
    String urlEditB="Bebida/EditarBebida.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorProducto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorProducto at " + request.getContextPath() + "</h1>");
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
        }else if (action.equalsIgnoreCase("Bebida")) {
          acceso=urlBebidas;
        }else if (action.equalsIgnoreCase("Agregar")) {
            String nombreProducto=request.getParameter("nombreProducto");
            String descripcion= request.getParameter("descripcion");
            float precioProducto=Float.parseFloat(request.getParameter("precioProducto"));
            String tipo= request.getParameter("tipo");
            String categoria= request.getParameter("categoria");
            producto.setNombreProducto(nombreProducto);
            producto.setDescripcionProducto(descripcion);
            producto.setPrecioProducto(precioProducto);
            producto.setTipo(tipo);
            producto.setCategoria(categoria);
            productoDao.Producto(producto);
            acceso=urlPlatillos;
        }else if (action.equalsIgnoreCase("Agregar2")) {
            String nombreProducto=request.getParameter("nombreProducto");
            String descripcion= request.getParameter("descripcion");
            float precioProducto=Float.parseFloat(request.getParameter("precioProducto"));
            String tipo= request.getParameter("tipo");
            String categoria= request.getParameter("categoria");
            producto.setNombreProducto(nombreProducto);
            producto.setDescripcionProducto(descripcion);
            producto.setPrecioProducto(precioProducto);
            producto.setTipo(tipo);
            producto.setCategoria(categoria);
            productoDao.Producto(producto);
            acceso=urlBebidas;
        }else if (action.equalsIgnoreCase("eliminar")) {
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            producto.setIdProducto(idProducto);
            productoDao.eliminar(idProducto);
            acceso=urlPlatillos;
        }else if (action.equalsIgnoreCase("eliminar2")) {
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            producto.setIdProducto(idProducto);
            productoDao.eliminar(idProducto);
            acceso=urlBebidas;
        }else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idProducto",request.getParameter("idProducto"));
            acceso=urlEditP;     
        } else if (action.equalsIgnoreCase("editar2")) {
            request.setAttribute("idProducto",request.getParameter("idProducto"));
            acceso=urlEditB;  
            
        }else if(action.equalsIgnoreCase("Actualizar")){
            int idProducto=Integer.parseInt(request.getParameter("idProducto"));
            String nombreProducto=request.getParameter("nombreProducto");
            String descripcion= request.getParameter("descripcion");
            float precioProducto=Float.parseFloat(request.getParameter("precioProducto"));
            String tipo= request.getParameter("tipo");
            String categoria= request.getParameter("categoria");
             producto.setIdProducto(idProducto);
             producto.setNombreProducto(nombreProducto);
             producto.setDescripcionProducto(descripcion);
             producto.setPrecioProducto(precioProducto);
             producto.setTipo(tipo);
             producto.setCategoria(categoria);
             productoDao.editar(producto);
            if(tipo=="Platillo"){acceso=urlPlatillos;}
            else{acceso=urlBebidas;}
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
