<%-- 
    Document   : add
    Created on : 12/12/2018, 08:57:06 PM
    Author     : Genaro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Platillo</title>
    </head>
    <body>
        <h1>Agregar Platillo</h1>
        <form accion="ControladorPlatillo">ID : <br>
            <input type="text" name="idPlatillo"><br>
            Nombre :<br>
             <input type="text" name="nombrePlatillo"><br>
             Descripcion :<br>
              <input type="text" name="descripcion"><br>
              Precio :<br>
               <input type="text" name="precioPlatillo"><br>
               <input type="submit" name="accion" value="Agregar">
        </form>
    </body>
</html>
