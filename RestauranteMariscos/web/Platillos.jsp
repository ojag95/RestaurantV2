<%-- 
    Document   : index
    Created on : 10/12/2018, 06:02:50 PM
    Author     : oscar
--%>

<%@page import="java.sql.ResultSet"%>
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
    <script src="js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    

    <title>Platilos</title>
  </head>
  <body>
  <div style="background-image:url(images/fondo.jpg)">

  <style type="text/css">
    button {
		font-size: 10px;
		line-height: 10px;
		min-width: 10px;
        font-weight: bold;
		background: #ffffff;
		border: none;		
    }
    button:hover, button:focus{
		background: #dfe3e4;
        outline: none !important;
	}

  </style>
  <div class="navbar navbar-expand-md navbar-dark bg-dark mb-4" role="navigation">
        <a class="navbar-brand" href="#">Mariscos Don Roque</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Menu.html">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item "> 
                    
                    <a class="nav-link" href="Platillos.html" >Platillos <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="Usuarios.html" >Usuarios <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="dropdown1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Cuentas</a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown1">
                        <li class="dropdown-item" href="#"><a>Action 1</a></li>
                        <li class="dropdown-item dropdown">
                            <a class="dropdown-toggle" id="dropdown1-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Dropdown1.1</a>
                            <ul class="dropdown-menu" aria-labelledby="dropdown1-1">
                                    <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                            <div class="dropdown-menu">
                                              <a class="dropdown-item active" href="#">Action</a>
                                              <a class="dropdown-item" href="#">Another action</a>
                                              <a class="dropdown-item" href="#">Something else here</a>
                                              <div class="dropdown-divider"></div>
                                              <a class="dropdown-item" href="#">Separated link</a>
                                            </div> <ul class="dropdown-menu" aria-labelledby="dropdown1-1-1">
                                        <li class="dropdown-item" href="#"><a>Action 1.1.1</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                        <a class="nav-link" href="Acerca.html" >Acerca de <span class="sr-only">(current)</span></a>
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
            
            ConexionesDB conector =new ConexionesDB();
            ResultSet resultado=null;

            try{
            System.out.println(conector.probarConexion());
            resultado=conector.consulta("select * from Platillos;");
            }catch(Exception e)
            {
                System.out.println(e);
            }
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
                            <th>Patillo</th>
                            <th>Precio</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                            while(resultado.next()){
                        %>
                          <tr>
                           <td> <%= resultado.getString("nombrePlatillo")  %> <br><small><%= resultado.getString("descripcion") %></small></td>
                            <td>$<%= resultado.getString("precioPlatillo")  %></td>
                          </tr>
                          <%}%>
                          
                        </tbody>
                      </table>
          </div></div>
          <div class="col-sm-4">
          <div class="card">
          <div class="card bg-dark text-white">
            <h2>Menú Platillos</h2>
          </div>   
          <div class="card-body">     
                <div class="container">
                        <link rel="stylesheet" type="text/css" href="css/main.css">
                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
                        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
                        <form action="/action_page.php">       
                      <div class="form-group">
                            <label for="text">Nombre platillo:</label>
                            <input type="text" class="form-control form-rounded" placeholder="Nombre del platillo" required>
                      </div>
                      <div class="form-group">
                            <label for="text">Descripción:</label>
                            <input type="text" class="form-control form-rounded" placeholder="Descripcion" required>
               </div>
                      <div class="form-group">  
                            <label for="text">Precio:</label>
                            <input min='0' type="number" step="0.50" class="form-control form-rounded" placeholder="Precio" required>
                                </script>
                        </div>
                      <!---
                        <div class="inputWithIcon">
                            <input type="text" placeholder="Your name">
                            <i class="fas fa-bolt"></i>
                          </div>
                        -->
                        <br>
                        <center> 
                           <button type="submit"><img src="images/agrega.png" alt="x" /></button>
                           <button type="submit"><img src="images/modifica.png" alt="x" /></button>
                           <button type="submit"><img src="images/elimina.png" alt="x" /></button></div> 
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
</body>
</html> 


