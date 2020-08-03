<!DOCTYPE html>
<html>
    <head>
    <title>Login</title>    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
      <li class="nav-item active">
        <a class="nav-link" href="#">Inicio<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/list">Ver Productos</a>
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/carrito">Ver Carrito</a>
      </li>
    <!--  <li class="dropdown">
 	 <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   	 Dropdown button
  	</button>
  	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Action</a>
    <a class="dropdown-item" href="#">Another action</a>
    <a class="dropdown-item" href="#">Something else here</a>
 	 </div>
	</li>-->
    </ul>
    </div>
      
</nav>
        
        <div class="modal-dialog text-center">
           <div class="col-sm-8 main-section">
                <div class="modal-content">
                    <div class="col-12 user-img" >
                         <img src="">
                    </div>    
                <form class="col-12">
                    <div class="form-group" id="user-group">
                        <input type="text" class="form-control" placeholder="Nombre de usuario"/>
                    </div>
                    <div class="form-group" id="contraseña-group">
                        <input type="password" class="form-control" placeholder="Contraseña"/>
                    </div>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i>  Ingresar</button>
                </form>
                <div class="col-12 forgot">
                    <a href="#">Recordar contraseña</a>
                </div> 
                </div>
            </div>
        </div>
    </body>
</html>