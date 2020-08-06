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
        <a class="nav-link" href="/TiendaWeb/list?accion=OpenCarrito">
        	<i class = "fas fa-cart-plus">
        		<label style="color: orange;">(${contador})</label>
        	</i> Ver Carrito
        </a>
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
        		</a>
        		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          			<a class="dropdown-item" href="#">Action</a>
          			<a class="dropdown-item" href="#">Another action</a>
          			<div class="dropdown-divider"></div>
          			<a class="dropdown-item" href="#">Something else here</a>
        		</div>
        		
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
        							<i>$ ${p.getPrecio()}</i>
        							
        							<img src="/pic/${p.image}.jpg" width="200" height="180" class= "rounded"> <!-- Aqui va la imagen -->
        						</div>
        						
        						<div class = "card-footer text-center">
        							<label>${p.getDescripcion()}</label>
        							<br>
        							<label>Disponibles: ${p.getUnidades()}</label>
        							
        							<div>
        							<a href="/TiendaWeb/list?accion=AddToCarrito&ID=${p.ID}" class="btn btn-outline-info">Agregar a Carrito</a>
        							<a href="/TiendaWeb/list?accion=Comprar&ID=${p.ID}" class ="btn btn-danger">Comprar</a>
        							</div>
        						</div>
        						
        					</div>
        				</div>
        				
        				</c:forEach>
        				
        			
        			</div>
        		</div>	
        	</div>
        	
     <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="/js/main.js"></script>    	
        	
        	
    </body>
   
  </html>