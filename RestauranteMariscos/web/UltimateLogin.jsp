<%-- 
    Document   : demo
    Created on : 10/12/2018, 08:36:35 PM
    Author     : oscar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<LINK REL=StyleSheet HREF="estilo.css" TYPE="text/css" MEDIA=screen>
<link rel="stylesheet" href="css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
	body {
		color: #4e4e4e;
		height: 100%;
		width: 100%;
        background-repeat: no-repeat;
		background-image: url(https://cdn.pixabay.com/photo/2016/06/17/11/46/morocco-1463212_960_720.jpg); 
		font-family: 'Police serif', sans-serif;
		background-size: 100%;
	}
    .form-control {
		background: #42e5eb;
        font-size: 16px;
		border-color: transparent;
		box-shadow: none !important;
	}
	.form-control:focus {
		border-color: #91c7d5;
        background: #e9f5ee;
	}
    .form-control, .btn {        
        border-radius: 2px;
    }
	.login-form {
		width: 380px;
		margin: 0 auto;
        color: #ffffff;
	}
    .login-form form {
		color: #7a7a7a;
		border-radius: 4px;
    	margin-bottom: 20px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 40px;		
    }
    .login-form .btn {
		font-size: 16px;
		line-height: 26px;
		min-width: 120px;
        font-weight: bold;
		background: #6bcccf;
		border: none;		
    }
	.login-form .btn:hover, .login-form .btn:focus{
		background: #24f3fa;
        outline: none !important;
	}
	.checkbox-inline {
		margin-top: 14px;
	}
	.checkbox-inline input {
		margin-top: 3px;
	}
    .login-form a {
		color: #6bcccf;
	}	
	.login-form a:hover {
		text-decoration: underline;
	}
	.hint-text {
		color: #999;
        text-align: center;
		padding-bottom: 15px;
	}
    .form-control {
		min-height: 41px;
		background: #fff;
        border-color: #e3e3e3;
		box-shadow: none !important;
		border-radius: 4px;
	}   
	.form-control:focus {
		border-color: #6bcccf;
	}
	.login-form {
		width: 310px;
		margin: 0 auto;
		padding: 100px 0 30px;		
	}
    .login-form form {
		color: #999;
		border-radius: 10px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;	
		position: relative;	
    }
	.login-form h2 {		
		font-size: 24px;
		color: #454959;
        margin: 45px 0 25px;
		font-family: 'Francois One', sans-serif;
    }
	.login-form .avatar {
		position: absolute;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: -50px;
		width: 95px;
		height: 95px;
		border-radius: 50%;
		z-index: 9;
		background: #6bcccf;
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.login-form .avatar img {
		width: 100%;
	}
	.login-form a {
		color: #fff;
		text-decoration: underline;
	}
	.login-form form a {
		color: #999;
		text-decoration: none;
	}	
	.login-form a:hover, .login-form form a:hover {
		text-decoration: none;
	}
	.login-form form a:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
	<!--	<center><titul>Marisqueria "El puerto de Don Roque"</titul></center>  -->
<div class="login-form">
<form action="Menu.html" method="post">    
<div class="avatar"> <img src="images/avatar.png" alt="Avatar"> </div>   
<h2 class="text-center"><strong>Inicio de sesión</strong></h2>    
        <div class="form-group">
        	<input type="text" class="form-control input-lg" name="username" placeholder="Usuario" required="required">	
        </div>
		<div class="form-group">
            <input type="password" class="form-control input-lg" name="password" placeholder="Contraseña" required="required">
        </div>        
        <div class="form-group clearfix">
			<label class="pull-left checkbox-inline"><input type="checkbox"> Recordar </label>
            <button type="submit" class="btn btn-primary btn-lg pull-right">Acceder</button>
        </div>		
    </form>
</div>
</body>
</html>                                                 