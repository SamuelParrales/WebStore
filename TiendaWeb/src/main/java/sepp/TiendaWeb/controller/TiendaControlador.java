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
import sepp.TiendaWeb.entities.Producto;
import sepp.TiendaWeb.entities.detalle_compra;
import sepp.TiendaWeb.repos.ClienteRepo;
import sepp.TiendaWeb.repos.CompraRepo;
import sepp.TiendaWeb.repos.DetalleRepo;
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
	private DetalleRepo detallerepo;			//Repositorios de los detalles
	
	@Autowired
	PictureService picService;
											//Atributos necesarios para el cliente
	Long idcliente;
	Cliente Sesioncliente;// 
	String loginstarted = "log_off";
											//de atributos necesarios para el cliente
													//InicioCarrito
	List<Carrito> listCarrito = new ArrayList<>();
	int item= 0;
	double totalPagar=0.0;
	int cantidad=1;
	Long ID;
	Producto p;
	Carrito car;
	
													//FinCarrito

	@RequestMapping("")
	public String index(HttpServletRequest request) 
	{
		String accion =request.getParameter("accion");
				
		if((accion!=null)&&(accion.equals("logoff")))
		{		
					Sesioncliente = null;	
					
					idcliente =null;
					loginstarted = "log_off";
					request.setAttribute("mode", loginstarted);
					return "index";
				
		}
		
		request.setAttribute("mode", loginstarted);
		request.setAttribute("User", Sesioncliente);
		return "index";
	}
	
	@GetMapping("/list")				//Lista los productos
	public String showProducts(HttpServletRequest resquest) 
	{
		resquest.setAttribute("mode", loginstarted);
		resquest.setAttribute("User", Sesioncliente);
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
	
	
	
	
	@GetMapping("/Comprar")	
	public void GenerarCompra(HttpServletRequest request){
				
		if(totalPagar>0&&loginstarted.equals("log_on"))
		{
			Sesioncliente = clienterepo.findById(idcliente).orElseThrow( () -> new IllegalArgumentException("invalid cliente id: "+idcliente));
		
			
			Date fecha = new Date();
			Compra compra = new Compra(new SimpleDateFormat("dd-MM-yyyy").format(fecha),"pagada", totalPagar, Sesioncliente);
			comprarepo.save(compra);					//Se crea la compra
			
					
			
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
			listCarrito.clear();
		}	
	}
	
	@GetMapping("/Compras")
	public String Compras(HttpServletRequest request)
	{
		if(Sesioncliente==null)
		{
			return "error";
		}
		request.setAttribute("User", Sesioncliente);
		String accion = request.getParameter("accion");
		
		if(accion!=null&&accion.equals("detalles"))
		{
			Long id = Long.parseLong(request.getParameter("id"));
			Compra compra = comprarepo.findById(id).orElseThrow( () -> new IllegalArgumentException("invalid compra id: "+id));;	//Captura la compra
			request.setAttribute("detalles", detallerepo.findByCompra(compra));
			return "detalles";
		}
		
			request.setAttribute("compras",comprarepo.findByCliente(Sesioncliente)); //
			return "compras";
		
		
		
	}
	
	
	
	@GetMapping("/Prueba")
	public void Prueba(HttpServletRequest request)
	{
		
		
	
	}
	
	
	
	@GetMapping("/agregar")
	public String add_product() {
		return "agregar";
	}
	
	@GetMapping("/login")
	public String RegistrarClient(HttpServletRequest request) {
		
		return "login";
	}
	
	@RequestMapping ("/login-user")
	public String loginUser(HttpServletRequest request)
	{
		String correo = request.getParameter("correo");
		String contrasena = request.getParameter("contrasena");
		Sesioncliente=clienterepo.findByCorreoAndContrasena(correo,contrasena);
		
		if(Sesioncliente!=null)
		{	
			idcliente = Sesioncliente.getID();
			loginstarted = "log_on";
			request.setAttribute("mode", loginstarted);
			request.setAttribute("User", Sesioncliente);	
			
			return "index";
		}
		
	
		request.setAttribute("error", "Invalid email or Password");
		return "login";
	}
	
	
	@GetMapping("/SignUp")
	public String Registrarse() {
		return "Registrar";
	}
	@GetMapping("/SignUp/Successful")
	 public String Registrado(@RequestParam String nombre, @RequestParam String apellido, @RequestParam String correo,@RequestParam String contrasena ) {
		Cliente cliente = new Cliente();
	    cliente.setNombre(nombre);
	    cliente.setApellido(apellido);
	    cliente.setCorreo(correo);
	    cliente.setContrasena(contrasena);
	    
	    clienterepo.save(cliente);
	    return"successful";
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