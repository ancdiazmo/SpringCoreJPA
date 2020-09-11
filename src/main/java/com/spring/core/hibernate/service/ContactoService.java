package com.spring.core.hibernate.service;

import java.util.List;

import javax.persistence.PersistenceException;
import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.core.hibernate.dao.ContactoDAO;
import com.spring.core.hibernate.domain.Contacto;
import com.spring.core.hibernate.exceptions.ContactoException;
import com.spring.core.hibernate.util.LogsYMensajesConstantes;

@Service
public class ContactoService extends GeneralService {
	
	@Autowired
	private ContactoDAO contactoDAO;
	
	public void saveContacto (Contacto contacto) throws ContactoException, PersistenceException {
		if (contacto.getTelefono() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Contacto", "Telefono");
			throw new ContactoException(mensaje);
		}
		else if(contacto.getEmail() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Contacto", "Email");
			throw new ContactoException(mensaje);
		}
		else if (contacto.getId() == null) {
			contactoDAO.insert(contacto);
		}
		else {
			contactoDAO.update(contacto);
		}
	}
	
	public void removeContacto (Contacto contacto) 
			throws ContactoException, PersistenceException, RollbackException {
		if (contacto.getId() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorDelete("Contacto", "id");
			throw new ContactoException(mensaje);
		}
		else {
			contactoDAO.delete(contacto);
		}
	}
	
	public List<Contacto> findAll () {
		return contactoDAO.findAll();
	}
	
	public Contacto findById (int id) {
		return contactoDAO.findById(id);
	}

}
