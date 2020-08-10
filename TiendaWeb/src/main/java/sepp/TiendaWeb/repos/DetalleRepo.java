package sepp.TiendaWeb.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import sepp.TiendaWeb.entities.Compra;
import sepp.TiendaWeb.entities.detalle_compra;



public interface DetalleRepo extends CrudRepository<detalle_compra,Long> {
	List<detalle_compra> findByCompra(Compra compra); 
}
