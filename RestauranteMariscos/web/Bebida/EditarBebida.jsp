<%-- 
    Document   : index
    Created on : 10/12/2018, 06:02:50 PM
    Author     : oscar
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Bebida"%>
<%@page import="ModeloDAO.BebidaDAO"%>
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
            BebidaDAO dao = new BebidaDAO();
            int idBebida = Integer.parseInt((String) request.getAttribute("idBebida"));
            Bebida bebida = (Bebida) dao.listar(idBebida);
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
                            <h2>Editar Bebida</h2>
                        </div>   
                        <div class="card-body">     
                            <div class="container">
                                <link rel="stylesheet" href="css/style.css">
                                <link rel="stylesheet" href="css/main.css">
                               <form  accion="Controlador">
                                    <div class="form-group">  
                                        <input min='0' type="hidden" class="form-control form-rounded" name="idBebida" placeholder="idPlatillo" value="<%= bebida.getIdBebida()%>" required>

                                    </div>  
                                    <div class="form-group">
                                        <label for="text">Nombre de la Bebida:</label>
                                        <input type="text" class="form-control form-rounded" name="nombreBebida" placeholder="Nombre de la Bebida" value="<%= bebida.getNombreBebida()%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="text">Descripción:</label>
                                        <input type="text" class="form-control form-rounded" name="descripcion" placeholder="Descripcion" value="<%= bebida.getDescripcionBebida()%>" required>
                                    </div>
                                    <div class="form-group">  
                                        <label for="text">Precio:</label>
                                        <input min='0' type="number" step="0.50" class="form-control form-rounded" name="precioBebida" placeholder="Precio" value="<%= bebida.getPrecioBebida()%>" required>

                                    </div>
                                         <div class="form-group">
                                        <label for="text">Tipo:</label>
                                        <input type="text" class="form-control form-rounded" name="Tipo" placeholder="Tipo" value="<%= bebida.getTipo()%>" required>
                                    </div>
                                    <div class="form-group form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="checkbox" required> Confirmar datos </input>
                                        </label>
                                    </div> 
                                    <center>  <button type="submit" name="accion" value="Actualizar"><img src="images/ok.png" alt="x" /> </button> </center>
                                    <a href="ControladorBebida?accion=Bebida"> <img src="images/atras.png" alt="x" /> </a>       
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
