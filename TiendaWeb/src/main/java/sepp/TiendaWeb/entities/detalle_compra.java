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
@Table(name="Detalles_compras")
public class detalle_compra {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long Id_Detalle;
	private int Cantidad;
	private double PrecioCompra;
	
	@JoinColumn(name="ID_Compra")
	@ManyToOne(cascade = CascadeType.ALL)
	private Compra compra;
	
	@JoinColumn(name="ID_Producto")
	@ManyToOne(cascade = CascadeType.ALL)
	private Producto producto;

	
				//Setter y getter
	public Long getId_Detalle() {
		return Id_Detalle;
	}

	public void setId_Detalle(Long id_Detalle) {
		Id_Detalle = id_Detalle;
	}

	public int getCantidad() {
		return Cantidad;
	}

	public void setCantidad(int cantidad) {
		Cantidad = cantidad;
	}

	public double getPrecioCompra() {
		return PrecioCompra;
	}

	public void setPrecioCompra(double precioCompra) {
		PrecioCompra = precioCompra;
	}

	public Compra getCompra() {
		return compra;
	}

	public void setCompra(Compra compra) {
		this.compra = compra;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}
	
	
	
}
