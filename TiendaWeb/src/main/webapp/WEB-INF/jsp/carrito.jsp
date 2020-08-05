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
						</tr>
					</thead>
					<tbody>
					<c:forEach var="car" items="${carrito}">
						<tr>
							<th>${car.getItem()}</th>
							<th>${car.getNombres()}</th>
							<th>${car.descripcion}</th>
							<th>${car.precioCompra}</th>
							<th>${car.cantidad}</th>
							<th>${car.subTotal}</th>
							<td>
								<a href="#">Eliminar</a>
								<a href="#">Editar</a>
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
        </body>
</html>