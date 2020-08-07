package sepp.TiendaWeb.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Pagos")
public class Pago {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long IdPago;
	
	private double Monto;
	public Long getIdPago() {
		return IdPago;
	}
	public void setIdPago(Long idPago) {
		this.IdPago = idPago;
	}
	public double getMonto() {
		return Monto;
	}
	public void setMonto(double monto) {
		this.Monto = monto;
	}
	
	
}
