package sepp.TiendaWeb.entities;

import java.sql.Date;

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
	private Date FechaCompras;
	private String Estado;
	private double Monto;
	
	@JoinColumn(name="ID_Cliente")
	@ManyToOne(cascade = CascadeType.ALL)
	private Cliente cliente;
	
	public Long getIDCompras() {
		return IDCompras;
	}

	public void setIDCompras(Long iDCompras) {
		IDCompras = iDCompras;
	}

	public Date getFechaCompras() {
		return FechaCompras;
	}

	public void setFechaCompras(Date fechaCompras) {
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
