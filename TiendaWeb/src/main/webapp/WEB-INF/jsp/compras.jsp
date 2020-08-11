<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Mi compra</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
    	<link rel="stylesheet" type="text/css" href="/css/main.css">
    </head>
    <body>
        

        <!--Inicio de la navegacion-->    
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Tienda Web</a>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb"><i class="glyphicon glyphicon-home" style = "color : white; height: 20px; width: 20px;" ></i> Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/list"><i class="glyphicon glyphicon-list-alt" style = "color : white; height: 20px; width: 20px;" ></i> Productos</a>
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="/TiendaWeb/list?accion=OpenCarrito"> <i class="glyphicon glyphicon-shopping-cart" style = "color : white; height: 20px; width: 20px;" ></i>	Carrito</a>
      </li>
  
    </ul>
    
    
    	<ul class= "navbar-nav" id="down">
      		<li class="nav-item dropdown" >
    	
    			
        				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">        		
          				<i class="glyphicon glyphicon-user" style = "color : white; height: 20px; width: 20px;" ></i> ${User.getNombre()} ${User.getApellido()}
        				</a>
        				<div class="dropdown-menu text-center" aria-labelledby="navbarDropdown">
          					<img src="../images/user.png" width="40" height="40" class= "rounded">
          					<a class="dropdown-item" href="Compras">Mis Compras</a>
          					<a class="dropdown-item" href="/TiendaWeb?accion=logoff">Cerrar sesión</a>
        					</div>
        		
      			
    		</li>
      		
      			</ul>
    </div>
      
</nav>
           
    <!--Fin de la navegacion   -->  
        
        
        
        
        <div class="container mt-4">
            <div class="row">
                <div class="col-sm-8">
                    <h3>Mis compras</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr class="text-center">
                                <th >Código de compra</th>
                                <th >Fecha de compra</th>
                                <th >Monto</th>
                             
                                <th >Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="compra" items="${compras}">
                        	<tr  class="text-center" style="text-align :center">
                    			<td >${compra.getIDCompras()}</td>
                    			<td >${compra.getFechaCompras()}</td>
                    			<td >${compra.getMonto()}</td>
                   				
                    			<td >${compra.getEstado()}</td> 
                    			<td>
                        			<a href="Compras?accion=detalles&id=${compra.getIDCompras()}" id="btnDetalle">Ver detalle</a>
                    			</td>
                    		</tr>
                        </c:forEach>
                        	
                        </tbody>
                    </table>
                </div>
        
            </div>
        </div>
         <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="/js/main.js"></script>
        
        
    </body>
</html>