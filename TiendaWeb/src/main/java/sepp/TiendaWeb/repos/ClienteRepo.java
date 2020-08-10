package sepp.TiendaWeb.repos;


import org.springframework.data.repository.CrudRepository;
import sepp.TiendaWeb.entities.Cliente;


public interface ClienteRepo extends CrudRepository<Cliente,Long> {
	Cliente findByCorreoAndContrasena(String correo, String contrasena);
	
}
