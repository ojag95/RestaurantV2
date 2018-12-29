<%-- 
    Document   : index
    Created on : 10/12/2018, 06:02:50 PM
    Author     : oscar y genaro
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
        <title>Usuarios</title>
    </head>
    <script type="text/javascript">
        var areYouReallySure = false;
        function areYouSure() {
            if (salir) {
                if (!areYouReallySure && true) {
                    areYouReallySure = true;
                    var confMessage = "***************************************nn E S P E R A !!! nnAntes de abandonar nuestra web, síguenos en nuestras redes sociales como Facebook, Twitter o Instagram.nnnYA PUEDES HACER CLIC EN EL BOTÓN CANCELAR SI QUIERES...nn***************************************";
                    return confMessage;
                }
            } else {
                salir = true;
            }
        }

        var salir = true;
        window.onbeforeunload = areYouSure;
    </script>
    <body>
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

                            <a class="nav-link"  href="ControladorProducto?accion=Platillo" onclick="areYouSure()">Platillos <span class="sr-only">(current)</span></a>
                        </li>     
                        <li class="nav-item ">
                            <a class="nav-link" href="ControladorProducto?accion=Bebida" onclick="areYouSure()">Bebidas<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="ControladorUsuario?accion=Usuario" onclick="areYouSure()">Usuarios <span class="sr-only">(current)</span></a>
                        </li>
                        &emsp; &emsp; &emsp;  &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;  &emsp; &emsp; &emsp;
                        &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;
                        &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;
                        &emsp; &emsp; &emsp; &emsp;&emsp; &emsp;
                        <form class="form-inline mt-2 mt-md-0" action ="index.jsp">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" >Cerrar Sesion</button>

                        </form>
                    </ul>
                </div>
            </div>




            <div class="container-fluid" style="margin-top:35px" class="carousel-inner" style="background-image:url(images/fondo.jpg) no-repeat left center; background-size: cover;">

                <!-- Crea un componente que permite resaltar un texto  -->     
                <div class="row"  >
                    <link rel="stylesheet" href="css/main.css">
                    <div class="col-sm-12" >
                        <div class="card">
                            <div class="card bg-dark text-white">
                                <h2>Usuarios</h2>
                            </div>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Usuario</th>
                                        <th>Edad</th>
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
                                            System.out.println(usuario.getnoEmpleado());
                                    %>
                                    <tr>
                                        <td><%= usuario.getUsuario()%></td>
                                        <td> &emsp;  <%= usuario.getEdad()%></td>
                                        <td><%= usuario.getDomicilio()%></td>
                                        <td>                            
                                            &emsp; <a href="ControladorUsuario?accion=editar&noEmpleado=<%= usuario.getnoEmpleado()%>" onclick="areYouSure()"> <img src="images/modifica.png" alt="x" /> </a>       
                                        </td>
                                    </tr>
                                    <%}%>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> 
                <br><br><br><br><br><br>
            </div>
        </div>
    </div>
</body>
</html> 



