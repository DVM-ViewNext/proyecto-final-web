package lab.sinensia.api.controller;


import java.util.*;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import lab.sinensia.api.model.Transaccion;
import lab.sinensia.api.model.Wallet;

@Controller
public class WalletController {
	
	String uriWallet = "http://localhost:8080/api/wallets";
	//String uri = "http://localhost:8080/api/wallets";
	
	 
	
	@RequestMapping(value="/wallets/{id}")
	private String getAllWallets(Model m, @PathVariable int id) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		Wallet[] wallets  = restTemplate.getForObject(uriWallet, Wallet[].class);
		List<Wallet> walletsList = Arrays.asList(wallets).stream().filter(wallet -> wallet.getIdusuario() == id).collect(Collectors.toList());
		m.addAttribute("walletsList",walletsList);
		
		m.addAttribute("id", id);
				
		return "wallets";
		
	}
	
	@RequestMapping(value="/wallets/{id}", method = RequestMethod.POST)
	private String createWalletByUserId(@PathVariable int id) {
		RestTemplate restTemplate = new RestTemplate();
		
		Wallet wallet = new Wallet(1, id, "123", 0.0, "123452482423424", "BTC");
		
		restTemplate.postForLocation(uriWallet, wallet);
		
		return "redirect:/wallets/" + id;
		
	}
	
	@RequestMapping(value="/wallet/{idwallet}")//el mapping debe coincidir con el nombre de la pagina JSP
	private String getWalletPerId(Model m, @PathVariable int idwallet) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		Wallet wallet  = restTemplate.getForObject(uriWallet + "/" + idwallet, Wallet.class);
		m.addAttribute("wallet",wallet);
				
		return "wallet";
		
	}
	
	@RequestMapping(value="/wallet/{idwallet}", method = RequestMethod.POST)//el mapping debe coincidir con el nombre de la pagina JSP
	private String deleteWallet(Model m, @PathVariable int idwallet) {
		RestTemplate restTemplate = new RestTemplate();
		
		Wallet wallet  = restTemplate.getForObject(uriWallet + "/" + idwallet, Wallet.class);

		int idusuario = wallet.getId();
		restTemplate.delete(uriWallet + "/" + idwallet, Wallet.class);
				
		return "redirect:/wallets/" + idusuario;
		
	}
	
	/*@RequestMapping("/empform")  
    public String showform(Model m){  
    	m.addAttribute("command", new Empleado());
    	return "empform"; 
    }
	
	@RequestMapping(value="/editaremp/{id}", method = RequestMethod.GET)
	private String getEmpleadoById(@PathVariable int id,Model m) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		Empleado empleado = restTemplate.getForObject(uri +"/" + id, Empleado.class);
		m.addAttribute("command",empleado);
		//System.out.println("Empleado: " + empleado);
		return "editaremp";
		
	}
	
	@RequestMapping(value="/actualizar/{id}", method = RequestMethod.POST)
	private String actualizar(@PathVariable int id, @ModelAttribute("emp") Empleado emp) {
		
		RestTemplate restTemplate = new RestTemplate();
	      
        restTemplate.put(uri +"/" + id, emp);
        
        //restTemplate.put(url, request);
        
   	return "redirect:/empleados";
		
	}
	
	@RequestMapping(value="/agregar", method = RequestMethod.POST)
	private String agregarEmpleado(@ModelAttribute("emp") Empleado emp) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		restTemplate.postForLocation(uri, emp);	
				
		return "redirect:/empleados";
		
	}
	
	
	@RequestMapping(value="/eliminaremp/{id}")
	private String eliminarById(@PathVariable int id) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		restTemplate.delete(uri +"/" + id);
		
		return "redirect:/empleados";
		
	}*/

}
