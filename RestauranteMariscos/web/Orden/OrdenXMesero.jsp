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
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/main.css">
        <script src="../js/bootstrap.min.js"></script>
        <title>Registrar Orden</title>
    </head>
    <style>

    </style>
    <div style="background-image:url(../images/fondo.jpg)">
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
                            <a class="nav-link" href="ControladorPlatillo?accion=Platillo" >Platillos <span class="sr-only">(current)</span></a>
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
                    <form class="form-inline mt-2 mt-md-0">
                        <input class="form-control mr-sm-2" type="text" placeholder="Buscar" aria-label="Buscar">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                    </form>
                </div>
            </div>




            <div class="container-fluid" style="margin-top:35px" class="carousel-inner" style="background-image:url(../images/fondo.jpg) no-repeat left center; background-size: cover;">

     
                <div class="row"  >
                    <link rel="stylesheet" href="css/main.css">
                    <div class="col-sm-2" >
                        <div class="card">
                            <div class="card bg-dark text-white">
                                <h2>Ordenes</h2>
                            </div>
                        <div class="container">         
                          <table class="table table-hover" id="tablaOrdenes">
                            <thead>
                              <tr>
                                <th>Informacion</th>
                              </tr>
                            </thead>
                            <tbody>

                            </tbody>
                          </table>
                        </div>
                            
                        </div></div>
                    <div class="col-sm-6" >
                        <div class="card">
                            <div class="card bg-dark text-white">
                                <h2>Informacion de la Orden</h2>
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
                                                <input type="hidden" id="contadorPlatillosNuevos" name="contadorPlatillosNuevos" value="0"> 

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
        obtenerOrdenes();        
        //obtenerTipos();
        obtenerCategorias();
        //obtenerProductoXCategorias();
        };
        
//Funcion que agrega una fila a la tabla con la informacion del producto 
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
    btnConfirmar.innerText = 'Confirmar cambios';
    btnConfirmar.onclick=function () {
        var tablacontenedor = document.getElementById("tablaproducto");
        var tablacontenedor = document.getElementById("tablaproducto");
        var cantidadFilas= tablacontenedor.rows.length;
        console.log(cantidadFilas);
        obtenerDatosTabla(cantidadFilas);
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
    var contadorPlatillos= document.getElementById("contadorPlatillosNuevos");
    var cantidadPlatillosnuevos= contadorPlatillos.value ++;
    
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
      url: '/CodeHelpers/Orden/ObtenerTipos.jsp',
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
      url: '/CodeHelpers/Orden/ObtenerCategorias.jsp',
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
      url: '/CodeHelpers/Orden/ObtenerProductoXCategorias.jsp',
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

//Funcion que crea ub JSON con la el contenido de la tabla 
function obtenerDatosTabla(cantidadFilas)
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

//Funcion que envia el JSON de la funcion anterior junto con ciertos parametros
function  enviarOrden(data){
 //  fetch('https://jsonplaceholder.typicode.com/todos/1')
 // .then(response => response.json())
 // .then(json => console.log(json))
    console.log(document.getElementById("contadorPlatillosNuevos").value);
    var thiscantidadNueva=document.getElementById("contadorPlatillosNuevos").value;
    var thisorden= data;
    var thisempleado=1;//Hardcoded Cambiar por implementacion de sesion
    var thisoperacion="actualizar";
    var thisidorden=document.getElementById("btn_agregar").value;

    console.log(thisorden);

    $.ajax({
      type: "POST",
      url: '/CodeHelpers/Orden/ActualizarOrden.jsp',
      data: {
          cantidadNueva: thiscantidadNueva,
          orden: thisorden,
          empleado: thisempleado,
          operacion:thisoperacion,
          idOrden:thisidorden,
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

//Funcon que obtine las ordenes abiertas de un empleado en particular
function  obtenerOrdenes(){
    thisempleado=1;//Hardcoded


    $.ajax({
      type: "POST",
      url: '/CodeHelpers/Orden/ObtenerOrdenXMesero.jsp',
      data: {
          empleado: thisempleado,
      },
      success: function(data) {
        if(data!=null){
        console.log("Ordenes");
        console.log(data);
            for(i=0;i<data.length;i++)
            {
            var btnOrden = document.createElement('button');
            btnOrden.type = 'button';
            btnOrden.className="btn btn-link";
            btnOrden.innerText = 'Orden #'+[i+1]+" (ID: "+data[i].idOrden+")";
            btnOrden.value=data[i].idOrden;
            btnOrden.onclick=function () {
                cargarOrden(this.value);
            };
            var tablacontenedor = document.getElementById("tablaOrdenes");
            var cantidadFilas= tablacontenedor.rows.length;
            var row = tablacontenedor.insertRow(cantidadFilas);
            //y por ultimo agreamos el componente creado al padre
            var cell1 = row.insertCell(0);
            
            cell1.appendChild(btnOrden);
            }
            var btnAgregar=document.getElementById("");
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

//Funcion que carga los datos de la orden seleccionada
function cargarOrden(idOrden)
{   
    var contadorPlatillos= document.getElementById("contadorPlatillosNuevos");
    console.log(contadorPlatillos.value);
    var cantidadPlatillosnuevos= contadorPlatillos.value =0;
    console.log(contadorPlatillos.value);
    var btnAgregar=document.getElementById("btn_agregar");
    btnAgregar.value=idOrden;
    eliminaFilas("tablaproducto");
    $.ajax({
      type: "POST",
      url: '/CodeHelpers/Orden/ObtenerProductosOrden.jsp',
      data: {
          idOrden: idOrden,
      },
      success: function(data) {
        if(data!=null){
        console.log("Ordenes");
        console.log(data);
            for(i=0;i<data.length;i++)
            {
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
                btnConfirmar.innerText = 'Confirmar Cambios';
                btnConfirmar.value=idOrden;
                btnConfirmar.disabled=true;
                btnConfirmar.onclick=function () {
                    //obtenerDatosTabla();
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
                cell1.innerHTML = data[i].idProducto;
                cell2.innerHTML = data[i].categoria;
                cell3.innerHTML = data[i].nombreProducto;
                cell4.innerHTML = data[i].cantidad;
                cell5.appendChild(btnEliminar);

                    //Fila con boton de Confirmar
                var rowConfirmar = tablacontenedor.insertRow(cantidadFilas+1);
                var celldaBoton = rowConfirmar.insertCell(0);
                celldaBoton.colSpan = "5";
                celldaBoton.appendChild(btnConfirmar);
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
    
    
    //Boton Eliminar

 };
function eliminaFilas(tabla)
{
    //$("#tablaOrdenes tr").remove(); 
    var myTable = document.getElementById(tabla); 
    var rowCount = myTable.rows.length; 
    for (var x=rowCount-1; x>0; x--) { 
    myTable.deleteRow(x); 
    }
};

</script>
        

</html> 



