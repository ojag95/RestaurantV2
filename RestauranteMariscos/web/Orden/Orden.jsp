<%-- 
    Document   : index
    Created on : 10/12/2018, 06:02:50 PM
    Author     : oscar
--%>

<%@page import="Modelo.Producto"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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

                            <a class="nav-link"  href="Orden.jsp" onclick="areYouSure()">Carta <span class="sr-only">(current)</span></a>
                        </li>     
                        <li class="nav-item ">
                            <a class="nav-link" href="Acerca.jsp" onclick="areYouSure()">Acerca de<span class="sr-only">(current)</span></a>
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
                    <div class="col-sm-8" >
                        <div class="card">
                            <div class="card bg-dark text-white">
                                <h2>Registrar Orden</h2>
                            </div>
                            
                            <table class="table table-hover" id="tablaproducto">
                                <thead>
                                    <tr>
                                        <th> ID </th>
                                        <th> Categoria </th>
                                        <th>Producto</th>
                                        <th>cantidad</th>
                                        <th>Operaciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div></div>
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card bg-dark text-white">
                                <h2>Añadir Productos</h2>
                            </div>   
                            <div class="card-body">     
                                <div class="container">

                                    <form  accion="ControladorPlatillo">  
                                    <div class="form-group">
                                    <label for="selectTipo">Tipo</label>
                                    <select class="form-control" id="selectTipo" onchange="obtenerCategorias()" >
                                        <option>Bebida</option>
                                        <option>Platillo</option>
                                    </select>
                                  </div>
                                    <div class="form-group">
                                    <label for="selectCategoria">Categoria</label>
                                    <select class="form-control" id="selectCategoria" onchange="obtenerProductoXCategorias()">

                                    </select>
                                  </div>
                                    <div class="form-group">
                                    <label for="selectProductos">Productos</label>

                                    <select class="form-control" id="selectProductos" >
                                    
                                    </select>
                                  </div>
                                   <label for="cantidad">Cantidad</label>
                                  <div class="form-group" id="cantidad">
                                        <div class="row">
                                            <div class="col-8">
                                                <input type="number" class="form-control" id="txtCantidad" value="1">
                                            </div>
                                            <div class="col-2">
                                                <button type="button" class="btn btn-danger" id="btnMenos" onclick="restarCantidad()">-</button>
                                            </div>
                                            <div class="col-2">
                                                <button type="button" class="btn btn-primary" id="btnMas" onclick="sumarCantidad()">+</button>
                                            </div>
                                        </div>                                   
                                  </div>     
                                       
                                        

                                    </form> 
                                        <center>  <button id="btn_agregar" onclick="addProducto()" ><img src="../images/agrega.png" alt="x" /> </button> </center>   

                                    <br>



                                </div> 
                                  

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

<script>
    //Codigo Javascript NO tocar xD

 window.onload = function () {
        console.log("Pagina cargada");
        //obtenerTipos();
        obtenerCategorias();
        //obtenerProductoXCategorias();
        };
        
        
function addProducto()
{   
    //Boton Eliminar
    var btnEliminar = document.createElement('button');
    btnEliminar.type = 'button';
    btnEliminar.className="btn btn-danger";
    btnEliminar.innerText = 'Eliminar';
    btnEliminar.onclick=function () {
        var td = this.parentNode;
        var tr = td.parentNode;
        var table = tr.parentNode;
        table.removeChild(tr);
    };
    //Btn Confirmar
    var btnConfirmar= document.createElement('button');
    btnConfirmar.type = 'button';
    btnConfirmar.className="btn btn-success btn-block";
    btnConfirmar.innerText = 'Confirmar';
    btnConfirmar.onclick=function () {
        var tablacontenedor = document.getElementById("tablaproducto");

        obtenerDatosTabla();
    };
    
  

    var tablacontenedor = document.getElementById("tablaproducto");
    var cantidadFilas= tablacontenedor.rows.length;
    if( cantidadFilas==1)
    {
        
    }
    else
    {
        tablacontenedor.deleteRow(cantidadFilas-1);
        cantidadFilas= tablacontenedor.rows.length;
    }
    var row = tablacontenedor.insertRow(cantidadFilas);
    var array =document.getElementById("selectProductos").value.split(".");
    var id=array[0];
    var name=array[1];
    //y por ultimo agreamos el componente creado al padre
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4= row.insertCell(3);
    var cell5= row.insertCell(4);
    cell1.innerHTML = id;
    cell2.innerHTML = document.getElementById("selectCategoria").value;
    cell3.innerHTML =  name;
    cell4.innerHTML =  document.getElementById("txtCantidad").value;
    cell5.appendChild(btnEliminar);

        //Fila con boton de Confirmar
    var rowConfirmar = tablacontenedor.insertRow(cantidadFilas+1);
    var celldaBoton = rowConfirmar.insertCell(0);
    celldaBoton.colSpan = "5";
    celldaBoton.appendChild(btnConfirmar);
 };
 
 function eliminarProducto() {
    //document.getElementById("tablaproducto").deleteRow(1);
}; 

function restarCantidad()
{
     var txtCantidad=document.getElementById("txtCantidad");
     var cantidadAnterior=txtCantidad.value;
     if (cantidadAnterior>=2)
     {
        txtCantidad.value=parseInt(cantidadAnterior)-1;
     }
     else{
     }
};

function sumarCantidad()
{
     var txtCantidad= document.getElementById("txtCantidad");
     var cantidadAnterior=txtCantidad.value;
     txtCantidad.value=parseInt(cantidadAnterior)+1;

     
};


//Funcion que obtine los Tipos de Productod
function  obtenerTipos(){
    $.ajax({
      type: "POST",
      url: 'Orden/ObtenerTipos.jsp',
      success: function(data) {
        if(data!=null){
        console.log("tipos");
        console.log(data);
            var combo = document.getElementById("selectTipo");
            for(i=0;i<data.length;i++)
            {
                var option = document.createElement("option");
                option.text=data[i].nombre;
                combo.add(option);
            }
        }
        else{
            alert("No fue posible obtener la lista de Categorias, consulte a soporte");
        }
      },
      error: function(jqXHR, textStatus, errorThrow) {
        alert("error " + jqXHR.status + " textStatus " + textStatus + ' errorThrow ' + errorThrow)
        //$('#spinner').css('display', 'none');
      }
    });
  };

//Funcion que obtiene las categorias de Productos
function  obtenerCategorias(){
    var thisTipo=document.getElementById("selectTipo").value;
    console.log(thisTipo);
    removerOptionesSelect(document.getElementById("selectCategoria"));

    $.ajax({
      type: "POST",
      url: 'Orden/ObtenerCategorias.jsp',
      data: {
          tipo: thisTipo,
      },
      success: function(data) {
        if(data!=null){
            console.log(data);
            var combo = document.getElementById("selectCategoria");
            var option = document.createElement("option");
            option.text="Seleccione..";
            combo.add(option);
            for(i=0;i<data.length;i++)
            {
                var option = document.createElement("option");
                option.text=data[i].nombre;
                combo.add(option);
            }
        }
        else{
            alert("No fue posible obtener la lista de Categorias, consulte a soporte");
        }
      },
      error: function(jqXHR, textStatus, errorThrow) {
        alert("error " + jqXHR.status + " textStatus " + textStatus + ' errorThrow ' + errorThrow)
        //$('#spinner').css('display', 'none');
      }
    });
  };

function  obtenerProductoXCategorias(){
 //  fetch('https://jsonplaceholder.typicode.com/todos/1')
 // .then(response => response.json())
 // .then(json => console.log(json))
    
    var thiscategoria= document.getElementById("selectCategoria").value;
    console.log(thiscategoria);
    removerOptionesSelect(document.getElementById("selectProductos"));

    $.ajax({
      type: "POST",
      url: 'Orden/ObtenerProductoXCategorias.jsp',
      data: {
          categoria: thiscategoria,
      },
      success: function(data) {

        if(data!=null){
            var combo = document.getElementById("selectProductos");
            var option = document.createElement("option");
                option.text="Seleccione..";
                combo.add(option);
            for(i=0;i<data.length;i++)
            {
                var option = document.createElement("option");
                option.text=data[i].idProducto+". "+data[i].nombreProducto;
                combo.add(option);

            }
        }
        else{
            alert("No fue posible obtener la lista de Categorias, consulte a soporte");
        }
        //$('#spinner').css('display', 'none');
      },
      error: function(jqXHR, textStatus, errorThrow) {
        alert("error " + jqXHR.status + " textStatus " + textStatus + ' errorThrow ' + errorThrow)
        //$('#spinner').css('display', 'none');
      }
    });
  };


function removerOptionesSelect(selectbox)
{
    var i;
    for(i = selectbox.options.length - 1 ; i >= 0 ; i--)
    {
        selectbox.remove(i);
    }
}

function obtenerDatosTabla()
{

        var myRows = [];
        var headersText = [];
        var $headers = $("th");

        // Loop through grabbing everything
        var $rows = $("#tablaproducto tr").each(function(index) {
          $cells = $(this).find("td");
          myRows[index] = {};

          $cells.each(function(cellIndex) {
            // Set the header text
            if(headersText[cellIndex] === undefined) {
              headersText[cellIndex] = $($headers[cellIndex]).text();
            }
            // Update the row object with the header/cell combo
            myRows[index][headersText[cellIndex]] = $(this).text();
          });    
        });
        
        var myJSON = JSON.stringify(myRows);
        enviarOrden(myJSON);

}

function  enviarOrden(data){
 //  fetch('https://jsonplaceholder.typicode.com/todos/1')
 // .then(response => response.json())
 // .then(json => console.log(json))
    var thisorden= data;
    var thisempleado=1;//Hardcoded Cambiar por implementacion de sesion
    var thisoperacion="nueva";
    console.log(thisorden);

    $.ajax({
      type: "POST",
      url: 'Orden/ObtenerOrden.jsp',
      data: {
          orden: thisorden,
          empleado: thisempleado,
          operacion:thisoperacion,
      },
      success: function(data) {
                      alert("Orden enviada");

        if(data!=null){

        }
        else{
            alert("No fue posible obtener la lista de Categorias, consulte a soporte");
        }
      },
      error: function(jqXHR, textStatus, errorThrow) {
        //alert("error " + jqXHR.status + " textStatus " + textStatus + ' errorThrow ' + errorThrow)
      }
    });
  };



</script>
        

</html> 



