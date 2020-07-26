package sepp.TiendaWeb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



import sepp.TiendaWeb.service.PictureService;



@Controller
@RequestMapping("/TiendaWeb")
public class TiendaControlador {
	/*@Autowired
	private ProductRepo repo;*/
	
	@Autowired
	PictureService picService;
	
	@RequestMapping("")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/acerca")
	public String About() {
		return "Acerca";
	}
}