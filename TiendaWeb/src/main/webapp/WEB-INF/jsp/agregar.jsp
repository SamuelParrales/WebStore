<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Agregar Producto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="../css/shards.min.css"> -->
</head>

<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
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

<header class="page-header header container-fluid">
<div class="overlay">

    <div class="container my-5">
       <!--  <h3> Añadir Producto</h3>-->
       <div class="row">
        <div class="col-sm-3"></div>
        
        <div class="col-sm-6">
        <div class="card-transparent">
            <div class="card-body rounded" style="background-color: rgba(0, 0, 0, 0.4); ">
                    <form action="#" th:action="@{/recetas/add}" th:object="${receta}" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <!--Nombre-->
                            <div class="form-group col-md-12">
                                <label for="nombre" class="col-form-label">Nombre</label> 
                                <input type="text" th:field="*{nombre}" class="form-control" id="nombre" placeholder="Nombre" required>
                            </div>
                             <!--Descripciom-->       
                            <div class="form-group col-md-12">
                                <label for="Descripcion" class="col-form-label">Preparación</label>
                                <input class="form-control" th:field="*{descripcion}" id="descripcion" placeholder="descripcion" required>
                            </div>
                            <!--precio-->
                            <div class="form-group col-md-12">
                                <label for="precio" class="col-form-label">Precio</label>
                                <input type="text" class="form-control" th:field="*{Precio}" id="Precio" placeholder="Precio" required>
                            </div>

                            <!--Cantidad-->
                            <div class="form-group col-md-12">
                                <label for="Cantidad" class="col-form-label">Cantidad</label>
                                <input type="text" class="form-control" th:field="*{Catidad}" id="Cantidad" placeholder="Cantidad" required>
                            </div>

                            <!--Imagen-->
                            <div class="form-group col-md-12">
                            	<label for="name" class="col-form-label">Subir foto</label>
                            	<input type="file" name="file"  accept="image/*" class="form-control" required/> 
                            </div>

                            <div class="form-group col-md-6">
                                <input type="submit" class="btn btn-primary" value="Guardar receta">
                            </div>
                        </div>
                    </form>
              
            </div>
        </div>
    </div>
    <div class="col-sm-3"></div>
   </div>
   </div> 
</div>
</header>    
</body>

</html>