package sepp.TiendaWeb.repos;

import org.springframework.data.repository.CrudRepository;

import sepp.TiendaWeb.entities.Cliente;
import sepp.TiendaWeb.entities.Compra;

import java.util.List;


public interface CompraRepo extends CrudRepository <Compra,Long>{ 
	List<Compra> findByCliente(Cliente cliente); 
}
