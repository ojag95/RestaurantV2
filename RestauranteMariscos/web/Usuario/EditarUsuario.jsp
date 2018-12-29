<%-- 
    Document   : index
    Created on : 10/12/2018, 06:02:50 PM
    Author     : oscar
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Usuario"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
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
        <title>Usuarios</title>
    </head>

     <%
            UsuarioDAO dao = new UsuarioDAO();
            int noEmpleado = Integer.parseInt((String) request.getAttribute("noEmpleado"));
            Usuario u = (Usuario) dao.listar(noEmpleado);
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
                            <h2>Editar Usuario</h2>
                        </div>   
                        <div class="card-body">     
                            <div class="container">
                                <link rel="stylesheet" href="css/style.css">
                                <link rel="stylesheet" href="css/main.css">
                                <form  accion="ControladorUsuario">
                                    <input type="hidden" class="form-control form-rounded" name="noEmpleado" value="<%= u.getnoEmpleado()%>" requiered>

                                    <div class="form-group">
                                        <label for="text">Nombre del usuario:</label>
                                        <input type="text" class="form-control form-rounded" name="usuario" value="<%= u.getUsuario()%>" placeholder="Nuevo nombre" >
                                    </div>
                                    <div class="form-group">  
                                        <label for="text">Edad:</label>
                                        <input min='1' type="number" step="1" class="form-control form-rounded" name="edad" value="<%= u.getEdad()%>" placeholder="edad" required>

                                    </div>  
                                    <div class="form-group">
                                        <label for="text">Domicilio:</label>
                                        <input type="text" class="form-control form-rounded" name="domicilio" value="<%= u.getDomicilio()%>" placeholder="domicilio" >
                                    </div> 
                                    <div class="form-group">
                                        <label for="text">Contraseña:</label>
                                        <input type="password" class="form-control form-rounded" name="contra" value="<%= u.getContra()%>" placeholder="Contraseña"  required>
                                    </div>
                                    <div class="form-group form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="checkbox" required> Confirmar datos </input>
                                        </label>
                                    </div> 
                                    <center>  <button type="submit" name="accion" value="Actualizar"><img src="images/ok.png" alt="x" /> </button> </center>
                                    <a href="ControladorUsuario?accion=Usuario"> <img src="images/atras.png" alt="x" /> </a>       
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
