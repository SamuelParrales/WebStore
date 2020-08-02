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
        <script type="text/javascript">
       /* window.onload = function()
		{
			window.open('TiendaWeb/sc','new games release','menubar=0,resizable=0,dependent=0, status=0,width=500,height=300,left=10,top=10 ')
			
		}*/
        </script>
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
                            <a class="nav-link" href="/TiendaWeb/acerca">Acerca de</a>
                        </li>
                     
                        <div th:unless="${#authorization.expression('isAuthenticated()')}">
                            <li class="nav-item">
                                <a class="nav-link" href="TiendaWeb/login">Iniciar sesión</a>
                            </li>
                        </div>
        
                        <div sec:authorize="isAuthenticated()">
                            <li class="nav-item">
                            <a class="nav-link" href="/TiendaWeb/logout">Cerrar sesión</a>
        					</li>
                        </div>
        
                    </ul>
        
                </div>
            </nav>
        
        <header class="page-header header container-fluid">
            <div class="overlay">
                <div class="description">
                    <h1>Tienda  Web</h1>
                    <p> </p>
                </div>
            </div>
        </header>
    </body>
</html>