package sepp.TiendaWeb.entities;



import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Compras")
public class Compra {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long IDCompras;
	private String FechaCompras;
	private String Estado;
	private double Monto;
	
	@JoinColumn(name="ID_Cliente")
	@ManyToOne(cascade = CascadeType.ALL)		//Hija de cliente
	private Cliente cliente;
	

	
	public Compra() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Compra(String string, String estado, double monto, Cliente cliente) {
		this.FechaCompras = string;
		this.Estado = estado;
		this.Monto = monto;
		this.cliente = cliente;

	}



	//Metodos setter y getter
	public Long getIDCompras() {
		return IDCompras;
	}

	public void setIDCompras(Long iDCompras) {
		IDCompras = iDCompras;
	}

	public String getFechaCompras() {
		return FechaCompras;
	}

	public void setFechaCompras(String fechaCompras) {
		FechaCompras = fechaCompras;
	}

	public String getEstado() {
		return Estado;
	}

	public void setEstado(String estado) {
		Estado = estado;
	}

	public double getMonto() {
		return Monto;
	}

	public void setMonto(double monto) {
		Monto = monto;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}



	
	

	
	
	
	
}
