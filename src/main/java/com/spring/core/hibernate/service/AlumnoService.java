package com.spring.core.hibernate.service;

import java.util.List;

import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.core.hibernate.dao.AlumnoDAO;
import com.spring.core.hibernate.domain.Alumno;
import com.spring.core.hibernate.exceptions.AlumnoException;
import com.spring.core.hibernate.util.LogsYMensajesConstantes;

@Service
public class AlumnoService extends GeneralService {
	
	@Autowired
	private AlumnoDAO alumnoDAO;
	
	public void save (Alumno alumno) throws AlumnoException {
		
		if (alumno.getNombre() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Alumno", "Nombre");
			throw new AlumnoException (mensaje);
		}
		else if (alumno.getApellido() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Alumno", "Apellido");
			throw new AlumnoException (mensaje);
		}
		else if (alumno.getContacto() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Alumno", "Contacto");
			throw new AlumnoException (mensaje);
		}
		else if (alumno.getDomicilio() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Alumno", "Domicilio");
			throw new AlumnoException (mensaje);
		}
		else if (alumno.getId() == 0) {
			alumnoDAO.insert(alumno);
		}
		else {
			alumnoDAO.update(alumno);
		}
	}
	
	public void remove (Alumno alumno) throws AlumnoException, RollbackException {
		
		if (alumno.getId() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorDelete("Alumno", "Id");
			throw new AlumnoException (mensaje);
		}
		else {
			alumnoDAO.delete(alumno);
		}
	}
	
	public Alumno findById (String id) {
		return alumnoDAO.findById(Integer.valueOf(Integer.valueOf(id)));
	}
	
	public List<Alumno> findAll() {
		return alumnoDAO.findAll();
	}
	
}
