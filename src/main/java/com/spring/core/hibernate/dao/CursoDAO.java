package com.spring.core.hibernate.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.core.hibernate.domain.Curso;

@Repository
public class CursoDAO extends DAO {
	
	@Autowired
	private HibernateAPI manager;
	
	public void insert (Curso curso) {
		manager.getManager().getTransaction().begin();
		manager.getManager().persist(curso);
		manager.getManager().getTransaction().commit();
	}
	
	public void update (Curso curso) {
		manager.getManager().getTransaction().begin();
		manager.getManager().merge(curso);
		manager.getManager().getTransaction().commit();
	}
	
	public void remove (Curso curso) throws RollbackException {
		manager.getManager().getTransaction().begin();
		Curso cursoMerged = manager.getManager().merge(curso);
		manager.getManager().remove(cursoMerged);
		manager.getManager().getTransaction().commit();
	}
	
	public List<Curso> findAll () {
		Query query = manager.getManager().createQuery("SELECT c FROM Curso c");
		return query.getResultList();
	}
	
	public Curso findById(int id) {
		return manager.getManager().find(Curso.class, id);
	}
}
