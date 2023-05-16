package lab.sinensia.api.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import lab.sinensia.api.model.Usuario;

@Controller
public class SignUpController {

	String uri = "http://localhost:8080/api/usuarios";
	
	@RequestMapping("/signup")  
    public String form(Model m){  
    	m.addAttribute("command", new Usuario());
    	return "signup"; 
    } 
	
	@RequestMapping(value="/signup", method = RequestMethod.POST)
	private String signup(@ModelAttribute("usuario") Usuario usuario) {
		
		System.out.println(usuario.toString());
		System.out.println("1");
		
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForLocation(uri, usuario);	
		
		System.out.println("2");
				
		return "redirect:/login";
		
	}
	
}
