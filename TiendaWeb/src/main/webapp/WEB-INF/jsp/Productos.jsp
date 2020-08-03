<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Tienda Web</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/css/main.css">
    </head>

    <body>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrap.com/bootstrap/4.1.3/js/bootstrap.min,js" crossorigin="anonymous"></script>
        <script src="/js/main.js"></script>
        <script type="text/javascript"></script>  			 <!-- Revisar esto -->
        
             
             
             
                       <!--Inicio de la navegacion-->    
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
     
     <li class="nav-item active">
        <a class="nav-link" href="#">Ver Productos<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/list">Ver Carrito</a>
      </li>
      
    </ul>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
      	
      	<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
      
      	
      	<ul class= "navbar-nav">
      		<li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          		Iniciar Sesión
          		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          			<a class="dropdown-item" href="#">Action</a>
          			<a class="dropdown-item" href="#">Another action</a>
          			<div class="dropdown-divider"></div>
          			<a class="dropdown-item" href="#">Something else here</a>
        		</div>
        		</a>
        		
      		</li>
      		
      	</ul>
      </div>
      
      
  </div>
</nav>
           
    <!--Fin de la navegacion   -->   
        
        
        
        
        	<div>
        		<div class = "container mt-4">
        			<div class = "row">
        				<c:forEach var="p" items="${products}">
        				
        				<div class = "col-sm-4">
        					<div class= "card">
        						<div class = "card-header">
        							<h4>${p.getNombre()}</h4>
        						</div>
        						
        						<div class="card-body">			
        							<i>$1,050.00</i>
        							<img src="" width="200" height="180">
        						</div>
        						
        						<div class = "card-footer text-center">
        							<label>Descripción Producto</label>
        							<br>
        							<label>Disponible:</label>
        							<label>2</label>
        							<div>
        							<a href="" class="btn btn-outline-info">Agregar a Carrito</a>
        							<a href="" class ="btn btn-danger">Comprar</a>
        							</div>
        						</div>
        						
        					</div>
        				</div>
        				
        				</c:forEach>
        				
        			
        			</div>
        		</div>	
        	</div>
        	
        	
        	
        	
    </body>
   
  </html>