package com.spring.core.hibernate.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.core.hibernate.dao.AsignacionDAO;
import com.spring.core.hibernate.domain.Asignacion;
import com.spring.core.hibernate.exceptions.AsignacionException;
import com.spring.core.hibernate.util.LogsYMensajesConstantes;

@Service
public class AsignacionService extends GeneralService {
	
	@Autowired
	private AsignacionDAO asignacionDAO;
	
	public void save (Asignacion asignacion) throws AsignacionException {
		
		if(asignacion.getTurno() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Asignacion", "Turno");
			throw new AsignacionException (mensaje);
		}
		else if (asignacion.getAlumno() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Asignacion", "Alumno");
			throw new AsignacionException (mensaje);
		}
		else if (asignacion.getCurso() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Asignacion", "Curso");
			throw new AsignacionException (mensaje);
		}
		else if (asignacion.getId() == null) {
			asignacionDAO.insertAsignacion(asignacion);
		}
		else {
			asignacionDAO.updateAsignacion(asignacion);
		}
	}
	
	public void remove (Asignacion asignacion) throws AsignacionException {
		if (asignacion.getId() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorDelete("Asignacion", "id");
			throw new AsignacionException (mensaje);
		}
		else {
			asignacionDAO.deleteAsignacion(asignacion);
		}
		
	}
	
	public Asignacion findById (String id) {
		return asignacionDAO.findById(Integer.parseInt(id));
	}
	
	public List<Asignacion> findAll () {
		return asignacionDAO.findAll();
	}
}
