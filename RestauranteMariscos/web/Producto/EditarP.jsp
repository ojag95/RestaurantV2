<%-- 
    Document   : index
    Created on : 10/12/2018, 06:02:50 PM
    Author     : oscar & genaro
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import =" java.net.*" %>
<%@page import="CodeHelpers.ConexionesDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="js/bootstrap.min.js"></script>
        <title>Platillos</title>
    </head>
    
        <%
            ProductoDAO dao = new ProductoDAO();
            int idProducto = Integer.parseInt((String) request.getAttribute("idProducto"));
            Producto producto = (Producto) dao.listar(idProducto);
        %>

    <div style="background-image:url(images/fondo.jpg)">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <br>
    <div class="container-fluid" style="margin-top:35px" class="carousel-inner" style="background-image:url(images/fondo.jpg) no-repeat left center; background-size: cover;">


            <div class="row"  >
                <div class="col-sm-4" >
                    <div class="card">

                        <div class="card bg-dark text-white">
                            <h2>Editar Platillo</h2>
                        </div>   
                        <div class="card-body">     
                            <div class="container">
                                <link rel="stylesheet" href="css/style.css">
                                <link rel="stylesheet" href="css/main.css">
                                <form  accion="ControladorProducto">
                                          <input type="hidden" class="form-control form-rounded" name="idProducto"  value="<%= producto.getIdProducto()%>" required>
                                       
                                    <div class="form-group">
                                            <label for="text">Nombre producto:</label>
                                            <input type="text" class="form-control form-rounded" name="nombreProducto" placeholder="Nombre del platillo" value="<%= producto.getNombreProducto()%>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="text">Descripción:</label>
                                            <input type="text" class="form-control form-rounded" name="descripcion" placeholder="Descripcion" value="<%= producto.getDescripcionProducto()%>" >
                                        </div>
                                        <div class="form-group">  
                                            <label for="text">Precio:</label>
                                            <input min='0' type="number" step="0.50" class="form-control form-rounded" name="precioProducto" placeholder="Precio" value="<%= producto.getPrecioProducto()%>" required>
                                        </div>
                                        <input type="hidden" class="form-control form-rounded" name="tipo" value="Platillo" >
                                        <div class="form-group">
                                            <label for="text">Categoria:</label>
                                            <select name="categoria" placeholder="categoria" required> <option ><%= producto.getCategoria()%> </option> <option value="Entrada">Entrada</option>  <option value="Empanada">Empanada</option> 
                                                <option value="Tostada">Tostada</option> <option value="Coctel">Coctel</option>  <option value="Caldo, cazuelas y sopas">Caldo, cazuelas y sopas</option>  
                                                <option value="Camarones">Camarones</option> <option value="Especialidades">Especialidades</option>  <option value="Mojarra">Mojarra</option>  
                                                <option value="Ostiones y almejas">Ostiones y almejas</option> <option value="Pulpo">Pulpo</option>  <option value="Filete">Filete</option>  
                                            </select>
                                        </div>
                                    <div class="form-group form-check">
                                         <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" required> Confirmar informacion </input>
                                            </label>
                                    </div> 
                                    <center>  <button type="submit" name="accion" value="Actualizar"><img src="images/ok.png" alt="x" /> </button> </center>
                                    <a href="ControladorProducto?accion=Platillo"> <img src="images/atras.png" alt="x" /> </a>       
                                </form> 
                                <br>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <br><br> 
    </div>
</body>
</html> 
