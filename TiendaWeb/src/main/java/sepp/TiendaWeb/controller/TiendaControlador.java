package sepp.TiendaWeb.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sepp.TiendaWeb.entities.Carrito;
import sepp.TiendaWeb.entities.Cliente;
import sepp.TiendaWeb.entities.Compra;
import sepp.TiendaWeb.entities.Pago;
import sepp.TiendaWeb.entities.Producto;
import sepp.TiendaWeb.entities.detalle_compra;
import sepp.TiendaWeb.repos.ClienteRepo;
import sepp.TiendaWeb.repos.CompraRepo;
import sepp.TiendaWeb.repos.DetalleRepo;
import sepp.TiendaWeb.repos.PagoRepo;
import sepp.TiendaWeb.repos.ProductRepo;
import sepp.TiendaWeb.service.PictureService;



@Controller
@RequestMapping("/TiendaWeb")
public class TiendaControlador {
	
	@Autowired
	private ProductRepo repo;					//Repositorio del producto
	
	@Autowired
	private CompraRepo comprarepo;				//Repositorio de las compras
	
	@Autowired
	private ClienteRepo clienterepo;			//Repositorio del cliente
	
	@Autowired
	private PagoRepo pagorepo;					//Repositorios de los pagos
	
	@Autowired
	private DetalleRepo detallerepo;			//Repositorios de los detalles
	
	@Autowired
	PictureService picService;
	
	@RequestMapping("")
	public String index() {
		return "index";
	}
	
													//InicioCarrito
	List<Carrito> listCarrito = new ArrayList<>();
	int item= 0;
	double totalPagar=0.0;
	int cantidad=1;
	Long ID;
	Producto p;
	Carrito car;
													//FinCarrito

	
	@GetMapping("/list")				//Lista los productos
	public String showProducts(HttpServletRequest resquest) 
	{
		String accion = resquest.getParameter("accion");
		
		try
		{
			switch (accion) {
			case "AddToCarrito":
				
				ID =  Long.parseLong(resquest.getParameter("ID"));	//Captura el ID
				p = repo.findById(ID).orElseThrow( () -> new IllegalArgumentException("invalid product id: "+ID));;	//Captura el producto
	
				AddProductoCarrito();		//Insertar producto en el carrito
				break;
			case "Comprar":
				ID =  Long.parseLong(resquest.getParameter("ID"));	//Captura el ID
				p = repo.findById(ID).orElseThrow( () -> new IllegalArgumentException("invalid product id: "+ID));;	//Captura el producto
				AddProductoCarrito();	//Guarda el producto en el carrito
				
			case "OpenCarrito":								//Abrir Carrito
				totalPagar=0;
				for(int i=0;i<listCarrito.size();i++)
				{
					totalPagar = totalPagar + listCarrito.get(i).getSubTotal();
				}
				resquest.setAttribute("contador", listCarrito.size());
				resquest.setAttribute("total", totalPagar );	//total a pagar	
				resquest.setAttribute("carrito", listCarrito);
						
				return "carrito";
			default:
			
				break;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		resquest.setAttribute("contador", listCarrito.size());
		resquest.setAttribute("products", repo.findAll());
		return "Productos";
	}
	
	
	@GetMapping("/list/delete")		//Elimina productos del carrito
	public void DeleteProductoCarrito(HttpServletRequest request) throws ServletException, IOException 
	{
		boolean Encontrado = false;
		Long idproducto= Long.parseLong(request.getParameter("idp"));
		for(int i=0; i<listCarrito.size();i++)
		{
			
				
			if(listCarrito.get(i).getId_Productos()==idproducto)
			{
				listCarrito.remove(i);
				item--;
				Encontrado = true;
			}
			if(Encontrado)
			listCarrito.get(i).setItem(i+1);
		}
		totalPagar=0;
		for(int i=0;i<listCarrito.size();i++)
		{
			totalPagar = totalPagar + listCarrito.get(i).getSubTotal();
		}
	}
	
	
	@GetMapping("/list/updateCant")		//Actualiza la cantidad de productos del carrito
	public String updateCantCarrito(HttpServletRequest resquest) 
	{
		
		Long idpro = Long.parseLong(resquest.getParameter("idp"));
		int cant = Integer.parseInt(resquest.getParameter("Cantidad"));
		
		for (int i = 0; i < listCarrito.size(); i++) {
			if (listCarrito.get(i).getId_Productos()==idpro)
			{
				listCarrito.get(i).setCantidad(cant);
				double subtotal = cant*listCarrito.get(i).getPrecioCompra();
				listCarrito.get(i).setSubTotal(subtotal);
			}
		}
		return "carrito";
	}
	
	@GetMapping("/Compras")	
	public String Compras(){
		if(totalPagar>0)
		{
			Long idpago= Long.parseLong("1");
			Long idcliente= Long.parseLong("1");
			
			Pago pago = pagorepo.findById(idpago).orElseThrow( () -> new IllegalArgumentException("invalid pago id: "+idpago));			//Busca el pago
			Cliente cliente= clienterepo.findById(idcliente).orElseThrow( () -> new IllegalArgumentException("invalid cliente id: "+idcliente));		//Busca el cliente
			
			Date fecha = new Date();
			Compra compra = new Compra(new SimpleDateFormat("dd-MM-yyyy").format(fecha),"pagada",pago.getMonto(), cliente, pago);
			comprarepo.save(compra);					//Se crea la compra
			
			Long idCompra = compra.getIDCompras();		//Se conserva el id de la compra
			
			for (int i = 0; i < listCarrito.size(); i++) 	//Se llenan los detalles
			{
				Long ID_Producto = listCarrito.get(i).getId_Productos();
				p = repo.findById(ID_Producto).orElseThrow( () -> new IllegalArgumentException("invalid product id: "+ID));	
																//Se llenan
				detalle_compra detalle = new detalle_compra
						(listCarrito.get(i).getCantidad(), 
						listCarrito.get(i).getSubTotal(), 
						compra, 
						p, 
						listCarrito.get(i).getPrecioCompra());
				
				detallerepo.save(detalle);
				
			}
	
			
		}
		return "carrito";
		
	}
	
	
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/agregar")
	public String add_product() {
		return "agregar";
	}
	
	
//*******************************************Metodos complementarios para evitar redundancia 
	private void CopyAtributos()		//Copias los atributos en el carro de compra
	{
		item++;
		
		car = new Carrito();
		
		//Se llenan las filas del carro
		car.setItem(item);
		car.setId_Productos(p.getID());
		car.setNombres(p.getNombre());
		car.setDescripcion(p.getDescripcion());
		car.setPrecioCompra(p.getPrecio());
		car.setCantidad(cantidad);
		car.setSubTotal(cantidad*p.getPrecio());
		listCarrito.add(car);
		//end
	}
	private void AddProductoCarrito()
	{
		int pos=0;
		if(listCarrito.size()>0)		//Para que no exista duplicidad de datos
		{
			for (int i = 0; i < listCarrito.size(); i++) {
				if(ID==listCarrito.get(i).getId_Productos())
				{
					pos=i;		//Guarda el producto una vez encontrado
					break;		//Termina el ciclo
				}
					
			}
			
			if(ID==listCarrito.get(pos).getId_Productos())
			{
				cantidad=listCarrito.get(pos).getCantidad()+cantidad; 
				double subtotal = listCarrito.get(pos).getPrecioCompra()*cantidad;
				listCarrito.get(pos).setCantidad(cantidad);
				listCarrito.get(pos).setSubTotal(subtotal);
				cantidad=1;				
			}
			else
				CopyAtributos();	//Guarda el producto en el carrito
		}
		else
			CopyAtributos();		//Guarda el producto en el carrito
	}
}