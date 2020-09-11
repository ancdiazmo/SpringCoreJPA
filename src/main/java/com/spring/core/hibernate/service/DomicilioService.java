package com.spring.core.hibernate.service;

import java.util.List;

import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.core.hibernate.dao.DomicilioDAO;
import com.spring.core.hibernate.domain.Domicilio;
import com.spring.core.hibernate.exceptions.DomicilioException;
import com.spring.core.hibernate.util.LogsYMensajesConstantes;

@Service
public class DomicilioService extends GeneralService {
	
	@Autowired
	private DomicilioDAO domicilioDAO;
	
	public void save (Domicilio domicilio) throws DomicilioException {
		
		if(domicilio.getNroCalle() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Domicilio", "NroCalle");
			throw new DomicilioException (mensaje);
		}
		else if (domicilio.getCalle() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Domicilio", "Calle");
			throw new DomicilioException (mensaje);
		}	
		else if (domicilio.getPais() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Domicilio", "Pais");
			throw new DomicilioException (mensaje);
		}
		else if (domicilio.getId() == null) {
			domicilioDAO.insert(domicilio);
		}
		else {
			domicilioDAO.update(domicilio);
		}
	}

	public void remove(Domicilio domicilio) throws DomicilioException, RollbackException {
		
		if (domicilio.getId() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorDelete("Domicilio", "id");
			throw new DomicilioException (mensaje);
		}
		
		else {
			domicilioDAO.delete(domicilio);
		}
	}
	
	public List<Domicilio> findAll() {
		return domicilioDAO.findAll();
	}
	
	public Domicilio findById (String id) {
		return domicilioDAO.findById(Integer.parseInt(id));
	}

}
