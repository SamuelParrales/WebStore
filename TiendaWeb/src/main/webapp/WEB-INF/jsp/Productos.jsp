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
        
             
             
             
            <nav class="navbar navbar-expand-md">
                <button class="navbar-toggler navbar-dark" type="button" data-toggle="#main-navigation"> 
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="main-navigation">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="">Ver Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">Carrito de Compras</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Acerca de</a>
                        </li>
                     
                        <div th:unless="${#authorization.expression('isAuthenticated()')}">
                            <li class="nav-item">
                                <a class="nav-link" href="TiendaWeb/login">Iniciar sesiÃ³n</a>
                            </li>
                        </div>
        
                        <div sec:authorize="isAuthenticated()">
                            <li class="nav-item">
                            <a class="nav-link" href="/TiendaWeb/logout">Cerrar sesiÃ³n</a>
        					</li>
                        </div>
        
                    </ul>
        
                </div>
            </nav>
        
        
        
        
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
        							<label>DescripciÃ³n Producto</label>
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