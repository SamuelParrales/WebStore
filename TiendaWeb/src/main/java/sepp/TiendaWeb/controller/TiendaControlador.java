package sepp.TiendaWeb.controller;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
													//FinCarrito
	
	/*@GetMapping("/list")				//Lista los productos
	public String showProducts(Model model) 
	{
		System.out.println("sasa");
		model.addAttribute("products", repo.findAll());
		return "Productos";
	}*/
	
	@GetMapping("/list")				//Lista los productos
	public String showProducts(HttpServletRequest resquest) 
	{
		String accion = resquest.getParameter("accion");
		try
		{
			switch (accion) {
			case "AddToCarrito":
				Long ID =  Long.parseLong(resquest.getParameter("ID"));	//Captura el ID
				Producto p = repo.findById(ID).orElseThrow( () -> new IllegalArgumentException("invalid product id: "+ID));;	//Captura el producto
				item++;
				
				Carrito car = new Carrito();
				
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
				resquest.setAttribute("contador", listCarrito.size());
				
				System.out.print(car.getDescripcion());
				break;
			default:
			
				break;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		
		resquest.setAttribute("products", repo.findAll());
		return "Productos";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/carrito")
	public String Showproduct(HttpServletRequest resquest) {
		
		resquest.setAttribute("contador", listCarrito.size());
		resquest.setAttribute("carrito", listCarrito);
		return "carrito";
	}
	
	@GetMapping("/list/add")				//Lista los productos
	public String AddToCarrito 	(@RequestParam Long ID, Model model) {
		System.out.println(ID);
		model.addAttribute("products", repo.findAll());
		return "Productos";
	}
	
}