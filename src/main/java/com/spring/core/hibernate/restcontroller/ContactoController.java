package com.spring.core.hibernate.restcontroller;

import java.util.List;

import javax.persistence.PersistenceException;
import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.core.hibernate.domain.Contacto;
import com.spring.core.hibernate.exceptions.ContactoException;
import com.spring.core.hibernate.service.ContactoService;

@RestController
public class ContactoController {
	
	@Autowired
	private ContactoService contactoService;
	
	@GetMapping("/Contacto")
	public ResponseEntity<List<Contacto>> obtenerContactos () {
		return ResponseEntity.ok(contactoService.findAll());
	}
	
	@PostMapping("/Contacto")
	public ResponseEntity<String> insertarContacto (@RequestBody Contacto contacto) {
		try {
			contactoService.saveContacto(contacto);
		} 
		catch (ContactoException e) {
			e.printStackTrace();
			contactoService.closeTransactionIfIsOpen();
			return ResponseEntity.badRequest().body(e.getMessage());
		}
		catch (PersistenceException e) {
			e.printStackTrace();
			contactoService.closeTransactionIfIsOpen();
			return ResponseEntity.badRequest().body(e.getMessage());
		}
		return ResponseEntity.ok("Ingreso de contacto OK");
	}
	
	@DeleteMapping("/Contacto")
	public ResponseEntity<String> borrarContacto (@RequestBody Contacto contacto) {
		
		try {
			contactoService.removeContacto(contacto);
		}
		catch (ContactoException e) {
			e.printStackTrace();
			contactoService.closeTransactionIfIsOpen();
			return ResponseEntity.badRequest().body(e.getMessage());
		}
		catch (RollbackException e) {
			e.printStackTrace();
			contactoService.closeTransactionIfIsOpen();
			return ResponseEntity.badRequest().body(e.getMessage());
		}
		return ResponseEntity.ok().body("Borrado Exitoso");
	}
	
}
