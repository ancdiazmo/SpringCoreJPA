package com.spring.core.hibernate.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.core.hibernate.domain.Alumno;

@Repository
public class AlumnoDAO extends DAO {
	
	@Autowired
	private HibernateAPI manager;
	
	public void insert (Alumno alumno) {
		manager.getManager().getTransaction().begin();
		manager.getManager().persist(alumno);
		manager.getManager().getTransaction().commit();
		manager.getManager().detach(alumno);
	}
	
	public void update (Alumno alumno) {
		manager.getManager().getTransaction().begin();
		manager.getManager().merge(alumno);
		manager.getManager().getTransaction().commit();
	}
	
	public void delete (Alumno alumno) throws RollbackException {
		manager.getManager().getTransaction().begin();
		Alumno alumnoMerged = manager.getManager().merge(alumno);
		manager.getManager().remove(alumnoMerged);
		manager.getManager().getTransaction().commit();
	}
	
	public List<Alumno> findAll() {
		Query query = manager.getManager().createQuery("SELECT a FROM Alumno a");
		return query.getResultList();
	}
	
	public Alumno findById (Integer id) {
		return manager.getManager().find(Alumno.class, id);
	}
	
}
