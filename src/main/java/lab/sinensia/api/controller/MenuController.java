package lab.sinensia.api.controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import lab.sinensia.api.model.Moneda;
import lab.sinensia.api.model.Transaccion;
import lab.sinensia.api.model.Usuario;
import lab.sinensia.api.model.Wallet;

@Controller
public class MenuController {

	String uriWallet = "http://localhost:8080/api/wallets";
	String uriMoneda = "http://localhost:8080/api/monedas";
	String uriTransaccion = "http://localhost:8080/api/transacciones";
	String uriUsuario = "http://localhost:8080/api/usuarios";
	
	@RequestMapping(value="/menu/{id}")
	private String getAllWallets(Model m, @PathVariable int id) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		// Usuario
		Usuario usuario = restTemplate.getForObject(uriUsuario + "/" + id, Usuario.class);
		m.addAttribute("usuario", usuario);
		
		// id user
		m.addAttribute("id", id);
		
		// Wallets
		Wallet[] wallets  = restTemplate.getForObject(uriWallet, Wallet[].class);
		List<Wallet> walletsList = Arrays.asList(wallets).stream().filter(wallet -> wallet.getIdusuario() == id).collect(Collectors.toList());
		m.addAttribute("wallets",walletsList);
		m.addAttribute("walletsAmount",walletsList.size());
		
		
		// TotalProfits
		double totalProfits = 0;
		final Moneda[] monedas = restTemplate.getForObject(uriMoneda, Moneda[].class);
		List<Moneda> monedaList = Arrays.asList(monedas);
		
		for(Wallet wallet : walletsList){
			for(Moneda moneda : monedaList) {
				if (wallet.getIdmoneda() == moneda.getIdtipomoneda()) {
					totalProfits += moneda.getPrecio();
				}
			}
		}
		
		DecimalFormat decimalFormat = new DecimalFormat("#,###.##");
        String totalProfitsFormat = decimalFormat.format(totalProfits);
		m.addAttribute("totalProfits", totalProfitsFormat);
			
		// Transacciones
		Transaccion[] transacciones  = restTemplate.getForObject(uriTransaccion, Transaccion[].class);
		List<Transaccion> transaccionesList = Arrays.asList(transacciones);
		List<Transaccion> transaccionesRecientes = new ArrayList<>();
		double totalIngresado = 0;
		int transaccionesAmount = 0;
		
		for (Wallet wallet : walletsList) {
		    int idWallet = wallet.getId();
		    for (Transaccion transaccion : transaccionesList) {
		    	if (transaccion.getIdwallet() == idWallet) {
		    		
		    		// Transacciones amount
		    		transaccionesAmount++;
		    		
		    		// Total ingresado
		    		if(transaccion.getIdtipotransaccion() == 1) totalIngresado += transaccion.getMonto();
		    		
		    		// Fecha
		    	    String fechaTransaccionString = transaccion.getFecha();
		    	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    	    
		    	    try {
		    	    	Date fechaTransaccion = formatter.parse(fechaTransaccionString);

			    	    // Comparar las fechas y almacenar las 5 transacciones más recientes
			    	    if (transaccionesRecientes.size() < 5) {
			    	        transaccionesRecientes.add(transaccion);
			    	        Collections.sort(transaccionesRecientes, new Comparator<Transaccion>() {
			    	            @Override
			    	            public int compare(Transaccion t1, Transaccion t2) {
			    	                return t2.getFecha().compareTo(t1.getFecha());
			    	            }
			    	        });
			    	    } else {
			    	        Date fechaTransaccionMenor = formatter.parse(transaccionesRecientes.get(4).getFecha());
			    	        if (fechaTransaccion.after(fechaTransaccionMenor)) {
			    	            transaccionesRecientes.remove(4);
			    	            transaccionesRecientes.add(transaccion);
			    	            Collections.sort(transaccionesRecientes, new Comparator<Transaccion>() {
			    	                @Override
			    	                public int compare(Transaccion t1, Transaccion t2) {
			    	                    return t2.getFecha().compareTo(t1.getFecha());
			    	                }
			    	            });
			    	        }
			    	    }
		    	    } catch(ParseException e) {
		    	    	e.printStackTrace();
		    	    }
		    	    
		    	    
		    	}
		    }
		}

		m.addAttribute("transacciones", transaccionesRecientes);
		m.addAttribute("transaccionesAmount", transaccionesAmount);
		
        String totalIngresadoFormat = decimalFormat.format(totalIngresado);
		m.addAttribute("totalIngresado", totalIngresadoFormat);
		
		return "menu";
		
	}
	
	
}
