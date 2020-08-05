<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
        <head>
         <title>Carrito</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
         <link rel="stylesheet" type="text/css" href="/css/main.css">
        </head>
        
        <body>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrap.com/bootstrap/4.1.3/js/bootstrap.min,js" crossorigin="anonymous"></script>
        <script src="/js/main.js"></script>
        
      
        
        	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="#">Tienda Web</a>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/">Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/list">Ver Productos</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/carrito">
        	<i class = "fas fa-cart-plus">
        		<label style="color: orange;">(${contador})</label>
        	</i> Ver Carrito
        </a>
      </li>
    </ul>
  </div>
</nav>

	<div class="container mt-4">
		<div class="row">
			<div class="col-sm-8">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ITEM</th>
							<th>NOMBRES</th>
							<th>DESCRIPCION</th>
							<th>PRECIO</th>
							<th>CANTIDAD</th>
							<th>SUBTOTAL</th>
							<th>ACCION</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="car" items="${carrito}">
						<tr>
							<td>${car.getItem()}</td>
							<td>${car.getNombres()}</td>
							<td>${car.descripcion}</td>
							<td>${car.precioCompra}</td>
							<td>${car.cantidad}</td>
							<td>${car.subTotal}</td>
							<td>
							<a href="/TiendaWeb/list?accion=Delete&idp=${car.getId_Productos()}" id="btnDelete">eliminar</a>
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
							<a href="#" class="btn btn-info btn-block">Realizar Pago</a>
							<a href="#" class="btn btn-danger btn-block">Generar Compra</a>
						</div>
					</div>
			</div>
		</div>
	</div>
  		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script src="/js/funciones.js"></script>
	
	
        </body>
</html>