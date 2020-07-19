package sepp.TiendaWeb.repos;

import org.springframework.data.repository.CrudRepository;

import sepp.TiendaWeb.entities.Producto;

import java.util.List;

/*Sirve como conexion a la base de datos*/
public interface ProductRepo extends CrudRepository <Producto,Long>{
	List<Producto> findByNombre(String nombre);
}

