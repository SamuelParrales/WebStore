<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
    <title>Registro</title>  
    <meta charset="utf-8"  >
    
    <!--FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <!-- Los iconos tipo Solid de Fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
    <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css">
	<link rel="stylesheet" type="text/css" href="/css/main.css">
    <link rel="stylesheet" type="text/css" href="/css/acerca.css">
     
	</head>
    <body>
    
 
     <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Tienda Web</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/"><i class="glyphicon glyphicon-home" style = "color : white; height: 20px; width: 20px;" ></i> Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/list"><i class="glyphicon glyphicon-list-alt" style = "color : white; height: 20px; width: 20px;" ></i> Productos</a>
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/list?accion=OpenCarrito"><i class="glyphicon glyphicon-shopping-cart" style = "color : white; height: 20px; width: 20px;" ></i> Carrito</a>
      </li>
       </ul>
       <ul class= "navbar-nav" id="down">
      		<li class="nav-item dropdown" >

        				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">        		
          				<i class="glyphicon glyphicon-user" style = "color : white; height: 20px; width: 20px;" ></i> Iniciar Sesión
        				</a>
        				<div class="dropdown-menu text-center" aria-labelledby="navbarDropdown">
          					<img src="../images/user.png" width="40" height="40" class= "rounded">
          					<a class="dropdown-item" href="login">Iniciar sesión</a>
          					<a class="dropdown-item" href="SignUp">Registrarse</a>
        					</div>
    			     				
    		</li>
      		
      			</ul>
    </div>
      
</nav>
        
        <div class="modal-dialog text-center">
            <h2 style="color:#3b4652;">Registro</h2>
           
           <div class="col-sm-8 main-section">
                <div class="modal-content">
                    <div class="col-12 user-img" >
                         <img src="../images/user3.png">
                    </div>    
                <form method="get"  action="/TiendaWeb/SignUp/Successful">
                    <div class="form-group" id="nombre">
                        <input type="text" name="nombre" class="form-control" placeholder="Nombre del cliente" />
                    </div>
                    <div class="form-group" id="apellido">
                        <input type="text" name="apellido" class="form-control" placeholder="Apellido del cliente" required/>
                    </div>
                    <div class="form-group" id="correo">
                        <input type="email" name="correo" class="form-control" placeholder="correo electrónico" required/>
                    </div>
                    <div class="form-group" id="contrasena">
                        <input type="password" name="contrasena" class="form-control" placeholder="Contraseña" required/>
                    </div>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> Registrarse</button>
                </form>
                <div class="col-12 forgot">
                    <a href="/TiendaWeb/login">Ya tengo cuenta</a>
                </div> 
                </div>
            </div>
        </div>
    </body>
    
    
    	<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="/js/main.js"></script>    	
</html>