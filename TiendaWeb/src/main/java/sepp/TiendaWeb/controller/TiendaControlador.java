package sepp.TiendaWeb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping("/list")				//Lista los productos
	public String showRecipes(Model model) {
		model.addAttribute("products", repo.findAll());
		return "Productos";
	}
	@RequestMapping("/acerca")
	public String About() {
		return "Acerca";
	}
}