package sepp.TiendaWeb.entities;

public class Carrito {

	int item;
	Long Id_Productos;
	String nombres;
	String descripcion;
	double precioCompra;
	int cantidad;
	double subTotal;
	
	public Carrito() {
		// TODO Auto-generated constructor stub
	}
	
	public int getItem() {
		return item;
	}
	public void setItem(int item) {
		this.item = item;
	}
	public Long getId_Productos() {
		return Id_Productos;
	}
	public void setId_Productos(Long id_Productos) {
		Id_Productos = id_Productos;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public double getPrecioCompra() {
		return precioCompra;
	}
	public void setPrecioCompra(double precioCompra) {
		this.precioCompra = precioCompra;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}
	
	
	
}
