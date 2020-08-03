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
        <a class="nav-link" href="/TiendaWeb/list">Seguir Comprando</a>
      </li>
      
    </ul>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
 
      
      	
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

	<h1>Carrito</h1>
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
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
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
							<input type="text" readonly="" class="form-control">
							<label>Descuento</label>
							<input type="text" readonly="" class="form-control">
							<label>Total a Pagar</label>
							<input type="text" readonly="" class="form-control">
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-info btn-block">Realizar Pagp</a>
							<a href="#" class="btn btn-danger btn-block">Generar Compra</a>
							
						</div>
					</div>
			</div>
		</div>
	</div>
        </body>
</html>