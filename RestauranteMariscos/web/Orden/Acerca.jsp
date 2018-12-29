
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
        <title>Acerca de</title>
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
        <link rel="stylesheet" href="css/main.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->


        <div class="navbar navbar-expand-md navbar-dark bg-dark mb-4" role="navigation">
            <a class="navbar-brand" href="#">Mariscos Don Roque</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item "> 
                    <li class="nav-item ">
                        <a class="nav-link" href="ControladorUsuario?accion=Orden" onclick="areYouSure()"> Pedido <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="ControladorUsuario?accion=Acerca" onclick="areYouSure()" >Acerca de <span class="sr-only">(current)</span></a>
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
            <link rel="stylesheet" href="css/style.css"> 
            <!-- Crea un componente que permite resaltar un texto  -->



            <h1>
                &emsp; 
                &emsp; &emsp; &emsp; &emsp;&emsp; &emsp; &emsp; &emsp;Mariscos Don roque	
            </h1>
            <br>  <br>
            <p>&emsp; &emsp; &emsp;  &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;  &emsp; 
                &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; Restaurant de mariscos</p>

            <p>&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 
                &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                Ubicada en ....</p>
            <p>   &emsp; &emsp; &emsp;  &emsp; &emsp; &emsp; 
                &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                Telefono ....</p>

        </div>
        <br><br><br>
        <br><br><br>
        <br><br><br>
        <br><br><br>
        <br><br><br> 
        <br><br><br>
        <br><br><br>
        <br><br><br>
        <br><br><br> 
        <br>
    </div>
</body>
</html> 
