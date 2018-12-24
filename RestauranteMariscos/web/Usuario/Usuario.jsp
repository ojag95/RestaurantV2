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

    <div style="background-image:url(images/fondo.jpg)">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <div style="background-image:url(images/fondo.jpg)">
            <div class="navbar navbar-expand-md navbar-dark bg-dark mb-4" role="navigation">
                <a class="navbar-brand" href="#">Mariscos Don Roque</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item "> 

                            <a class="nav-link"  href="ControladorProducto?accion=Platillo" >Platillos <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="ControladorUsuario?accion=Usuario" >Usuarios <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="ControladorProducto?accion=Bebida" >Bebidas<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="Acerca.jsp" >Acerca de <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <form class="form-inline mt-2 mt-md-0">
                        <input class="form-control mr-sm-2" type="text" placeholder="Buscar" aria-label="Buscar">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                    </form>
                </div>
            </div>




            <div class="container-fluid" style="margin-top:35px" class="carousel-inner" style="background-image:url(images/fondo.jpg) no-repeat left center; background-size: cover;">

                <!-- Crea un componente que permite resaltar un texto  -->
                <%

                    //ConexionesDB conector;
                    //conector=new ConexionesDB();
                    //ResultSet resultado=null;
                    //try{
                    //System.out.println(conector.probarConexion());
                    //resultado=conector.consulta("select * from Platillos;");
                    //}catch(Exception e)
                    //{
                    //    System.out.println(e);
                    //}
                %>        
                <div class="row"  >
                    <link rel="stylesheet" href="css/main.css">
                    <div class="col-sm-8" >
                        <div class="card">
                            <div class="card bg-dark text-white">
                                <h2>Usuarios</h2>
                            </div>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Usuario</th>
                                        <th>Puesto</th>
                                        <th>Domicilio</th>
                                        <th>Operaciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  UsuarioDAO dao = new UsuarioDAO();
                                        List<Usuario> list = dao.listar();
                                        Iterator<Usuario> iterador = list.iterator();
                                        Usuario usuario = null;
                                        while (iterador.hasNext()) {
                                            usuario = iterador.next();
                                    %>
                                    <tr>
                                        <td><%= usuario.getUsuario()%><br><small><%= usuario.getApellido()%></small> </td>
                                        <td><%= usuario.getPuesto()%></td>
                                        <td><%= usuario.getDomicilio()%></td>
                                        <td>                            
                                            <a href="ControladorUsuario?accion=editar&usuario=<%= usuario.getUsuario()%>"> <img src="images/modifica.png" alt="x" /> </a>       
                                            <a href="ControladorUsuario?accion=eliminar&usuario=<%= usuario.getUsuario()%>"> <img src="images/elimina.png" alt="x" /> </a>       
                                        </td>
                                    </tr>
                                    <%}%>

                                </tbody>
                            </table>
                        </div></div>
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card bg-dark text-white">
                                <h2>Registro Usuario</h2>
                            </div>   
                            <div class="card-body">     
                                <div class="container">
                                    <link rel="stylesheet" href="css/main.css">
                                    <form  action="ControladorUsuario?accion=Agregar" method="post">        
                                        <div class="form-group">
                                            <label for="text">Nombre Usuario:</label>
                                            <input type="text" class="form-control form-rounded" name="usuario" placeholder="Nombre del Usuario" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="text">Apellido:</label>
                                            <input type="text" class="form-control form-rounded" name="apellido" placeholder="Apellidos" >
                                        </div>
                                         <div class="form-group">
                                     <label for="text">Puesto:</label>
                                            <select name="puesto" placeholder="puesto" required> <option value="Mesero">Mesero</option>  <option value="Admin">Admin</option> 
                                                <option value="Contador">Contador</option>
                                            </select></div>
                                        <div class="form-group">  
                                            <label for="text">Edad:</label>
                                            <input min='1' type="number" step="1" class="form-control form-rounded" name="edad" placeholder="edad" required>

                                        </div>  
                                        <div class="form-group">
                                            <label for="text">Domicilio:</label>
                                            <input type="text" class="form-control form-rounded" name="domicilio" placeholder="domicilio" >
                                        </div> 
                                        <div class="form-group">
                                            <label for="text">Contraseña:</label>
                                            <input type="password" class="form-control form-rounded" name="contrasenia" placeholder="Contraseña"  required>
                                        </div>

                                        <div class="form-group form-check">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" required> Confirmar informacion </input>
                                            </label>
                                        </div> 
                                        <center>  <button type="submit" ><img src="images/agrega.png" alt="x" /> </button> </center>   </form> 
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
    </div>
</body>
</html> 



