<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
    <title>Login</title>    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>

    <!--FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <!-- Los iconos tipo Solid de Fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
    <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

    <link rel="stylesheet" type="text/css" href="/css/login.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    
    <script src="/js/main.js"></script>
     
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
        <a class="nav-link" href="/TiendaWeb/">Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/list">Productos</a>
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/list?accion=OpenCarrito">Carrito</a>
      </li>
      
       </ul>
       
       <ul class= "navbar-nav" id="down">
      		<li class="nav-item dropdown" >

        				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">        		
          				Iniciar Sesión
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
           <div class="col-sm-8 main-section">
                <div class="modal-content">
                    
                    <div class="col-12 user-img" >
                         <img src="../images/user.png">
                    </div>    
                		
                		<form method="get" class="col-12" action="/TiendaWeb/login-user">
                    		
                    		
					
                    		<div class="form-sign" id="user-group">
                        		<input type="text" name="correo" class="form-control" placeholder="Correo"/>
                    		</div>
                    		
                    		<div class="form-group" id="contra-group">
                        		<input type="password" name="contrasena" class="form-control" placeholder="Contraseña"/>
                    			</div>
                    				<input type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> 
                		</form>
               				<div class="col-12 forgot">
                    			<a href="#">Recordar contraseña</a>
                			</div> 
                </div>
            </div>
            				<c:if test="${not empty error}">			
								<div class= "alert alert-danger">
								<c:out value="${error}"></c:out>
								</div>
							</c:if>
        </div>
        
        
    </body>
</html>