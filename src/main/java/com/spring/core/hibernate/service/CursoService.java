package com.spring.core.hibernate.service;

import java.util.List;

import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.core.hibernate.dao.CursoDAO;
import com.spring.core.hibernate.domain.Curso;
import com.spring.core.hibernate.exceptions.CursoException;
import com.spring.core.hibernate.util.LogsYMensajesConstantes;

@Service
public class CursoService extends GeneralService {
	
	@Autowired
	private CursoDAO cursoDAO;
	
	public void saveCurso (Curso curso) throws CursoException {
		if (curso.getNombre() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Curso", "Nombre");
			throw new CursoException (mensaje);
		}
		else if (curso.getPrecio() == null) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorInsert("Curso", "Precio");
			throw new CursoException (mensaje);
		}
		else if (curso.getId() == 0) {
			cursoDAO.insert(curso);
		}
		else if (curso.getId() != null) {
			cursoDAO.update(curso);
		}
	}
	
	public void remove (Curso curso) throws CursoException, RollbackException {
		
		if (curso.getId() == 0) {
			String mensaje = LogsYMensajesConstantes.generaMensajeErrorDelete("Curso", "id");
			throw new CursoException(mensaje);
		}
		else {
			cursoDAO.remove(curso);
		}
	}
	
	public List<Curso> findAll () {
		return cursoDAO.findAll();
	}

	public Curso findById(String id) {
		return cursoDAO.findById(Integer.valueOf(id));
	}
	
}
