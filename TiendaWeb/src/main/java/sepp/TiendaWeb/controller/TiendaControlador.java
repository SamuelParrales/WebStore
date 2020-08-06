package sepp.TiendaWeb.controller;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sepp.TiendaWeb.entities.Carrito;
import sepp.TiendaWeb.entities.Producto;
import sepp.TiendaWeb.repos.ProductRepo;
import sepp.TiendaWeb.service.PictureService;



@Controller
@RequestMapping("/TiendaWeb")
public class TiendaControlador {
	
	@Autowired
	private ProductRepo repo;
	
	@Autowired
	PictureService picService;
	
	@RequestMapping("/")
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
	public void DeleteProductoCarrito(HttpServletRequest resquest) 
	{
		boolean Encontrado = false;
		Long idproducto= Long.parseLong(resquest.getParameter("idp"));
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