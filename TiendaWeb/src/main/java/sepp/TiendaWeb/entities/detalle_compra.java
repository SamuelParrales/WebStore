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
	
}
