<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
        <head>
         <title>Carrito</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
         <link rel="stylesheet" type="text/css" href="/css/main.css">
        </head>
        
        <body>
       
        
      
        
        	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="#">Tienda Web</a>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/"><i class="glyphicon glyphicon-home" style = "color : white; height: 20px; width: 20px;" ></i> Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/list"><i class="glyphicon glyphicon-list-alt" style = "color : white; height: 20px; width: 20px;" ></i> Productos</a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="#"><i class="glyphicon glyphicon-shopping-cart" style = "color : white; height: 20px; width: 20px;" ></i>	 Carrito<span class="sr-only">(current)</span></a>
      </li>
      
    </ul>
    <!-- Inicia la el boton que se despliga -->
                <ul class= "navbar-nav" id="down">
      		<li class="nav-item dropdown" >
    	<c:choose>
    		<c:when test="${mode=='log_off'}">
    			
        				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">        		
          				<i class="glyphicon glyphicon-user" style = "color : white; height: 20px; width: 20px;" ></i> Iniciar Sesión
          				 
        				</a>
        				<div class="dropdown-menu text-center" aria-labelledby="navbarDropdown">
          					<img src="../images/user.png" width="40" height="40" class= "rounded">
          					<a class="dropdown-item" href="login">Iniciar sesión</a>
          					<a class="dropdown-item" href="SignUp">Registrarse</a>
        					</div>
        		
      			
    		</c:when>
    		<c:when test="${mode=='log_on'}">
    			
        				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">        		
          				<i class="glyphicon glyphicon-user" style = "color : white; height: 20px; width: 20px;" ></i> ${User.getNombre()} ${User.getApellido()}
          				 
        				</a>
        				<div class="dropdown-menu text-center" aria-labelledby="navbarDropdown">
          					<img src="../images/user.png" width="40" height="40" class= "rounded">
          					<a class="dropdown-item" href="Compras">Mis Compras</a>
          					<a class="dropdown-item" href="/TiendaWeb?accion=logoff">Cerrar sesión</a>
        					</div>
        		
      				
    		</c:when>
    		
    	</c:choose>
    		</li>
      		
      			</ul>
      			<!-- Termina la el boton que se despliga -->
    
    
    
  </div>
</nav>

	<div class=""> <!-- : class= "container mt-4"  -->
		<div class="row">
			<div class="col-sm-8">
				<table class="table table-hover">
					<thead>
						<tr class="text-center">
							<th>ITEM</th>
							<th>ARTÍCULOS</th>
							<th>DESCRIPCION</th>
							<th>PRECIO</th>
							<th>CANT</th>
							<th>SUBTOTAL</th>
							<th>ACCION</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="car" items="${carrito}">
						<tr class="text-center">
							<td>${car.getItem()}</td>
							<td>${car.getNombres()}</td>
							<td>${car.descripcion}</td>
							<td>${car.precioCompra}</td>
							<td>
								<input type="hidden" id="idpro" value="${car.getId_Productos()}"> 
								<input type="number" id="Cantidad" value="${car.getCantidad()}" class="form-control text-center" min="1"> 
							</td>
							<td>${car.subTotal}</td>
							<td>
								<input type="hidden" id="idp" value="${car.getId_Productos()}">
								<a href="#" id="btnDelete"><i class="glyphicon glyphicon-trash" style = "color : black; height: 20px; width: 20px;" ></i></a>
							</td>
						</tr>
														
					</c:forEach>
						
					</tbody>
				</table>
			</div>
			<div class="col-sm-4">
					<div class="card">
						<div class="card-header">
							<h3>Generar Compra</h3>
						</div>
						<div class="card-body">
							<label>Subtotal</label>
							<input type="text" value="$ ${total}" readonly="" class="form-control">
							<label>Descuento</label>
							<input type="text" value="$ 0.00" readonly="" class="form-control">
							<label>Total a Pagar</label>
							<input type="text" value="$ ${total}" readonly="" class="form-control">
						</div>
						<div class="card-footer">	
						<c:choose>
    						<c:when test="${mode=='log_off'}">
    							<a href="#" id="btnComprar" class="btn btn-danger btn-block disabled" aria-disabled="true">RealizarCompra</a>
    						</c:when>
    						
    						<c:when test="${total==0}">
    							<a href="#" id="btnComprar" class="btn btn-danger btn-block disabled" aria-disabled="true">RealizarCompra</a>
    						</c:when>
    						
    						<c:when test="${mode=='log_on'}">
    							<a href="#" id="btnComprar" class="btn btn-danger btn-block">RealizarCompra</a>
    						</c:when>
    							
    					</c:choose>
								
											
						
						</div>
					</div>
			</div>
		</div>
	</div>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="/js/main.js"></script>
  		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script src="/js/funciones.js"></script>
        </body>
</html>