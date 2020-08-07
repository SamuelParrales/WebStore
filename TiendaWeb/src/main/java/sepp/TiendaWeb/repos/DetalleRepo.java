package sepp.TiendaWeb.repos;

import org.springframework.data.repository.CrudRepository;

import sepp.TiendaWeb.entities.detalle_compra;



public interface DetalleRepo extends CrudRepository<detalle_compra,Long> {

}
