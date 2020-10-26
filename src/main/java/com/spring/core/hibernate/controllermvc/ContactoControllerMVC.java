package com.spring.core.hibernate.controllermvc;

import java.util.List;

import javax.persistence.PersistenceException;
import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.core.hibernate.domain.Contacto;
import com.spring.core.hibernate.exceptions.ContactoException;
import com.spring.core.hibernate.service.ContactoService;

@Controller
public class ContactoControllerMVC {
	
	@Autowired
	private ContactoService contactoService;
	
	@GetMapping("/Contactomvc")
	public ModelAndView manejaContactos () {
		
		List<Contacto> contactos = contactoService.findAll();
		ModelAndView model = new ModelAndView ();
		model.addObject("contactos", contactos);
		model.addObject("vista", "Contacto");
		model.setViewName("index");
		return model;
	}
	
	@GetMapping("/Contactomvc/agregar")
	public ModelAndView agregaContactoRedirect () {
		return new ModelAndView ("Contacto/AgregarContacto");
	}
	
	@GetMapping("/Contactomvc/agregar/{id}")
	public ModelAndView modificaContactoRedirect (@PathVariable String id) {
		Contacto contacto = contactoService.findById(Integer.parseInt(id));
		ModelAndView model = new ModelAndView ();
		model.addObject("contacto", contacto);
		model.setViewName("Contacto/ModificarContacto");
		return model;
	}
	
	@PostMapping("/Contactomvc/agregar")
	public ModelAndView agregamodificaContacto (Contacto contacto, @RequestParam(required = false) String guardar) {
		try {
			if (guardar != null) {
				contactoService.saveContacto(contacto);
			}
			else {
				contactoService.removeContacto(contacto);
			}
		} 
		catch (ContactoException e) {
			e.printStackTrace();
			contactoService.closeTransactionIfIsOpen();
		}
		catch (RollbackException e) { 
			e.printStackTrace();
			contactoService.closeTransactionIfIsOpen();
		}
		return new ModelAndView ("redirect:/Contactomvc");
	}
}
