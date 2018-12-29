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


                <div class="row"  >
                    <link rel="stylesheet" href="css/main.css">
                    <div class="col-sm-8" >
                        <div class="card">
                            <div class="card bg-dark text-white">
                                <h2>Carta</h2>
                            </div>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th><th>Platillo</th>
                                        <th>Categoria</th><th>Precio</th>
                                        <th>Operaciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  ProductoDAO dao = new ProductoDAO();
                                        List<Producto> list2 = dao.listar();
                                        Iterator<Producto> iterador = list2.iterator();
                                        Producto producto = null;
                                        while (iterador.hasNext()) {
                                            producto = iterador.next();

                                    %>
                                    <tr>

                                        <td>0<%= producto.getIdProducto()%></td>
                                        <td><%= producto.getNombreProducto()%> <br><small><%= producto.getDescripcionProducto()%></small></td>
                                        <td><%= producto.getCategoria()%></td>
                                        <td>$<%= producto.getPrecioProducto()%></td>
                                        <td>                            
                                            <a href="ControladorProducto?accion=editar&idProducto=<%= producto.getIdProducto()%>" onclick="areYouSure()"> <img src="images/modifica.png" alt="x" /> </a>       
                                            <a href="ControladorProducto?accion=eliminar&idProducto=<%= producto.getIdProducto()%>" onclick="areYouSure()"> <img src="images/elimina.png" alt="x" /> </a>       
                                        </td>
                                    </tr>
                                    <%}%>

                                </tbody>
                            </table>
                        </div></div>
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card bg-dark text-white">

                                <h2>Platillos</h2>
                            </div>   
                            <div class="card-body">     
                                <div class="container">
                                    <link rel="stylesheet" href="css/main.css">
                                    <form  accion="ControladorProducto" >       
                                        <div class="form-group">
                                            <label for="text">Nombre producto:</label>
                                            <input type="text" class="form-control form-rounded" name="nombreProducto" placeholder="Nombre del platillo" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="text">Descripción:</label>
                                            <input type="text" class="form-control form-rounded" name="descripcion" placeholder="Descripcion" >
                                        </div>
                                        <div class="form-group">  
                                            <label for="text">Precio:</label>
                                            <input min='0' type="number" step="0.50" class="form-control form-rounded" name="precioProducto" placeholder="Precio" required>
                                        </div>
                                        <input type="hidden" class="form-control form-rounded" name="tipo" value="Platillo">
                                        <div class="form-group">
                                            <label for="text">Categoria:</label>
                                            <select name="categoria" placeholder="categoria" required> <option value="Entrada">Entrada</option>  <option value="Empanada">Empanada</option> 
                                                <option value="Tostada">Tostada</option> <option value="Coctel">Coctel</option>  <option value="Caldo, cazuelas y sopas">Caldo, cazuelas y sopas</option>  
                                                <option value="Camarones">Camarones</option> <option value="Especialidades">Especialidades</option>  <option value="Mojarra">Mojarra</option>  
                                                <option value="Ostiones y almejas">Ostiones y almejas</option> <option value="Pulpo">Pulpo</option>  <option value="Filete">Filete</option>   <option value="Otro">Otro</option>  
                                            </select>
                                        </div>
                                        <div class="form-group form-check">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" required> Confirmar informacion </input>
                                            </label>
                                        </div> 
                                        <center>  <button type="submit" name="accion" value="Agregar" onclick="areYouSure()"><img src="images/agrega.png" alt="x" /> </button> </center>   </form> 
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



