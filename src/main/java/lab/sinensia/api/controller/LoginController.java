package lab.sinensia.api.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lab.sinensia.api.model.Usuario;

@Controller
public class LoginController {


	String uri = "http://localhost:8080/api/usuarios";
	
	@RequestMapping("/login")  
    public String form(Model m){  
    	m.addAttribute("command", new Usuario());
    	return "login"; 
    } 
	
	
}
