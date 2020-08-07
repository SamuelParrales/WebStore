package sepp.TiendaWeb.entities;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Clientes")
public class Cliente {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long ID;
	private String nombre;
	private String apellido;
	private String contrasena;
	private String correo;
	//Relaciones entre tablas
	
	
	public void setID(Long id) {
		this.ID=id;
	}
	public Long getID() {
		return ID;
	}

	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getApellido() {
		return apellido;
	}
	
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	
	public String getContrasena() {
		return contrasena;
	}
	
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	
	public String getCorreo() {
		return correo;
	}
	
	public void setCorreo(String correo) {
		this.correo = correo;
	}

}
