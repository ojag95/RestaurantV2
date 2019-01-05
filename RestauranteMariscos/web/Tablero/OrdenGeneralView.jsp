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
        <script src="js/bootstrap.min.js"></script>
        <title>Tablero de ordenes</title>
    </head>
        <script type="text/javascript">
            var areYouReallySure = false;
            function areYouSure() {
                if (salir) {
                    if (!areYouReallySure && true) {
                        areYouReallySure = true;
                        var confMessage = "*************************************************************";
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
                            <a class="nav-link" href="ControladorUsuario?accion=Tablero" onclick="areYouSure()">Home <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                        &emsp; &emsp; &emsp;  &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;  &emsp; &emsp; &emsp;
                        &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;
                        &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;
                        &emsp; &emsp; &emsp; &emsp;&emsp; &emsp;
                        <form class="form-inline mt-2 mt-md-0" action ="index.jsp">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" >Cerrar Sesion</button>

                        </form>
                </div>
            </div>




            <div class="container-fluid" style="margin-top:35px" class="carousel-inner" style="background-image:url(images/fondo.jpg) no-repeat left center; background-size: cover;">

     
                <div class="row"  >
                    <link rel="stylesheet" href="css/main.css">
                    <div class="col-sm-2" >
                        <div class="card">
                            <div class="card bg-dark text-white">
                                <h2>Meseros</h2>
                            </div>
                        <div class="container">         
                          <table class="table table-hover" id="tablaMeseros">
                            <thead>
                              <tr>
                                <th>Informacion</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="1" onclick="obtenerOrdenes(1)" onclick="areYouSure()">Mesero 1</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="2" onclick="obtenerOrdenes(2)" onclick="areYouSure()">Mesero 2</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="3" onclick="obtenerOrdenes(3)" onclick="areYouSure()">Mesero 3</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="4" onclick="obtenerOrdenes(4)" onclick="areYouSure()">Mesero 4</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="5" onclick="obtenerOrdenes(5)" onclick="areYouSure()">Mesero 5</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="6" onclick="obtenerOrdenes(6)" onclick="areYouSure()">Mesero 6</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="7" onclick="obtenerOrdenes(7)" onclick="areYouSure()">Mesero 7</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="8" onclick="obtenerOrdenes(8)" onclick="areYouSure()">Mesero 8</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="9" onclick="obtenerOrdenes(9)" onclick="areYouSure()">Mesero 9</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="10" onclick="obtenerOrdenes(10)" onclick="areYouSure()">Mesero 10</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="11" onclick="obtenerOrdenes(11)" onclick="areYouSure()">Mesero 11</button>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <button type="button" class="btn btn-link" id="btnMesero1" value="12" onclick="obtenerOrdenes(12)" onclick="areYouSure()">Mesero 12</button>
                                  </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                            
                        </div></div>
                    <div class="col-sm-4" >
                        <div class="card">
                            <div class="card bg-dark text-white">
                                <h2>Ordenes</h2>
                            </div>
                        <div class="container">         
                          <table class="table table-hover" id="tablaOrdenes">
                            <thead>
                              <tr>
                                <th>Ordenes (Solo se muestran ordenes Abiertas)</th>
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
                                <h2>Detalle de la orden</h2>
                            </div>
                            
                            <table class="table table-hover" id="tablaproducto">
                                <thead>
                                    <tr>
                                        <th> ID </th>
                                        <th> Categoria </th>
                                        <th>Producto</th>
                                        <th>cantidad</th>
                                        <th>Subtotal (Por producto)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div></div>
                </div>
            </div>
            <br><br>
            <br>  <br> 
        </div>
                                    
   

    </div>
</body>

<script>
 window.onload = function () {
        //obtenerOrdenes();        
        //obtenerTipos();
        //obtenerCategorias();
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


function  obtenerOrdenes(empleado){
    thisempleado=empleado;
    eliminaFilas("tablaOrdenes");
    eliminaFilas("tablaproducto");


    $.ajax({
      type: "POST",
      url: 'Orden/ObtenerOrdenXMesero.jsp',
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
                eliminaFilas("tablaproducto");
                cargarOrden(this.value);
            };
            var tablacontenedor = document.getElementById("tablaOrdenes");
            var cantidadFilas= tablacontenedor.rows.length;
            var row = tablacontenedor.insertRow(cantidadFilas);
            //y por ultimo agreamos el componente creado al padre
            var cell1 = row.insertCell(0);
            
            cell1.appendChild(btnOrden);
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


function cargarOrden(idOrden)
{   
    $.ajax({
      type: "POST",
      url: 'Orden/ObtenerProductosOrden.jsp',
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
                btnConfirmar.className="btn btn-danger btn-block";
                btnConfirmar.innerText = 'Cerrar Orden';
                btnConfirmar.onclick=function () {
                    var tablacontenedor = document.getElementById("tablaproducto");
                     cerrarOrden(idOrden);
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
                //var array =document.getElementById("selectProductos").value.split(".");
                //var id=array[0];
                //var name=array[1];
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
                cell5.innerHTML = data[i].subtotal;

                    //Fila con boton de Cerrar orden
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
    
   
 };
 
 
 function cerrarOrden(idOrden)
{   
    $.ajax({
      type: "POST",
      url: 'Tablero/CerrarOrden.jsp',
      data: {
          idOrden: idOrden,
      },
      success: function(data) {
        if(data!=null){
        console.log(data);
            alert(data[0].estado+"/nSubTotal: "+data[0].total+"/nTotal: "+data[0].total);


        }
        else{
            alert("No fue posible obtener la lista de Categorias, consulte a soporte");
        }
      },
      error: function(jqXHR, textStatus, errorThrow) {

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



