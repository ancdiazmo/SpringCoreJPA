package com.spring.core.hibernate.controllermvc;

import java.util.List;

import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.core.hibernate.domain.Domicilio;
import com.spring.core.hibernate.exceptions.DomicilioException;
import com.spring.core.hibernate.service.DomicilioService;

@Controller
public class DomicilioControllerMVC {
	
	@Autowired
	private DomicilioService domicilioService;
	
	
	@GetMapping("/Domiciliomvc")
	public ModelAndView manejoDomicilios () {
		
		List<Domicilio> domicilios = domicilioService.findAll();
		ModelAndView model = new ModelAndView ();
		model.addObject("domicilios",domicilios);
		model.addObject("vista","Domicilio");
		model.setViewName("index");
		return model;
	}
	
	@GetMapping("/Domiciliomvc/agregar")
	public ModelAndView agregaDomicilio () {
		ModelAndView model = new ModelAndView ();
		model.setViewName("Domicilio/AgregarDomicilio");
		return model;
	}
	
	@GetMapping("/Domiciliomvc/agregar/{id}")
	public ModelAndView modificaDomicilio (@PathVariable String id) {
		
		Domicilio domicilio = domicilioService.findById(id);
		ModelAndView model = new ModelAndView ();
		model.addObject("domicilio", domicilio);
		model.setViewName("Domicilio/ModificarDomicilio");
		return model;
	}
	
	@PostMapping("/Domiciliomvc/agregar")
	public ModelAndView agregamodificaDomicilios (Domicilio domicilio, @RequestParam(required = false) String guardar) {
		if(guardar != null) {
			try {
				domicilioService.save(domicilio);
			} 
			catch (DomicilioException e) {
				domicilioService.closeTransactionIfIsOpen();
				e.printStackTrace();
			}
		}
		else {
			try {
				domicilioService.remove(domicilio);
			} 
			catch (DomicilioException e) {
				domicilioService.closeTransactionIfIsOpen();
				e.printStackTrace();
			}
			catch (RollbackException e) {
				domicilioService.closeTransactionIfIsOpen();
				e.printStackTrace();
			}
		}
		return new ModelAndView("redirect:/Domiciliomvc");
	}
}
