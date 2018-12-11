<%-- 
    Document   : index
    Created on : 10/12/2018, 06:02:50 PM
    Author     : oscar
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Platillo"%>
<%@page import="ModeloDAO.PlatilloDAO"%>
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
    <div style="background-image:url(images/fondo.jpg)">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <div style="background-image:url(images/fondo.jpg)">

            </style>
            <div class="navbar navbar-expand-md navbar-dark bg-dark mb-4" role="navigation">
                <a class="navbar-brand" href="#">Mariscos Don Roque</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Menu.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item "> 

                            <a class="nav-link" href="Platillos.jsp" >Platillos <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="Usuarios.jsp" >Usuarios <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="Cuentas.jsp" >Cuentas<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="Acerca.jsp" >Acerca de <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
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
  

  

      <div class="container-fluid" style="margin-top:65px" class="carousel-inner" style="background: url(https://image.freepik.com/foto-gratis/pescados-verduras-cubiertos-sobre-fondo-negro_1220-548.jpg) no-repeat left center; background-size: cover;">

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
          <div class="col-sm-8" >
                <div class="card">
              <div class="card bg-dark text-white">
                  <h2>Carta</h2>
                </div>
                        <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>Platillo</th>
                            <th>Precio</th>
                            <th>Operaciones</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                            PlatilloDAO dao = new PlatilloDAO();
                            List<Platillo>list=dao.listar();
                            Iterator<Platillo>iterador=list.iterator();
                            Platillo platillo=null;
                            while(iterador.hasNext())
                            {
                                platillo=iterador.next();
                        %>
                          <tr>
                           <td> <%= platillo.getNombrePlatillo()  %> <br><small><%= platillo.getDescripcionPlatillo() %></small></td>
                            <td>$<%= platillo.getPrecioPlatillo()  %></td>
                            <td>                            
                                <button type="submit"><img src="images/modifica.png" alt="x" /></button>
                                <button type="submit"><img src="images/elimina.png" alt="x" /></button>
                            </td>
                          </tr>
                          <%}%>
                          
                        </tbody>
                      </table>
          </div></div>
          <div class="col-sm-4">
          <div class="card">
          <div class="card bg-dark text-white">
            <h2>Registrar Platillos</h2>
          </div>   
          <div class="card-body">     
                <div class="container">

                        <form action="Platillos.jsp" method="post">       
                        <div class="form-group">
                              <label for="text">Nombre platillo:</label>
                              <input type="text" class="form-control form-rounded" name="nombrePlatillo" placeholder="Nombre del platillo" required>
                        </div>
                        <div class="form-group">
                            <label for="text">Descripción:</label>
                            <input type="text" class="form-control form-rounded" name="descripcionPlatillo" placeholder="Descripcion" required>
                        </div>
                      <div class="form-group">  
                            <label for="text">Precio:</label>
                            <input min='0' type="number" step="0.50" class="form-control form-rounded" name="precioPlatillo" placeholder="Precio" required>
                                </script>
                        </div>
                        <br>
                        <center> 
                           <input type="submit" value="Registrar" alt="x" name="Registrar" />
                           </div> 
           <br><br>
          <div class="form-group form-check">
                <label class="form-check-label">
                <input class="form-check-input" type="checkbox"> Habilitar edicion</input>
              </label>
                </div>   
              </form> 
          </div>
        </div>
        </div>
        </div>
        </div>
        <br><br>
        <br>  <br> 
            </div>

  </div>
</body>
</html> 
<% 
 //String nombre,descripcion,operacion;
 //String precio;
 //nombre=request.getParameter("nombre");
 //descripcion=request.getParameter("descripcion");
 //precio=request.getParameter("precio");
 //ProcesarDatos(nombre,descripcion,precio);

%>




<%!
//public String helloWorld(){
 //return "Hola mundo";
//}
%>

<%!
//public void ProcesarDatos(String nombre,String descripcion, String precio){
   // if (nombre!=null && descripcion!=null && precio!=null)
    //{
      //      System.out.println(nombre +" "+descripcion+" "+precio);
        //    ConexionesDB conector=new ConexionesDB();
          //  try{
          //  conector.registrar("call registroPlatillo('" + nombre + "','" + descripcion + "'," + precio + ");");
           // }catch(Exception e)
           // {
            //    System.out.println(e);
            //}


    //}

//}
%>
