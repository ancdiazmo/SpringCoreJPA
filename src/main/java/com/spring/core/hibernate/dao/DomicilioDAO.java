package com.spring.core.hibernate.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.core.hibernate.domain.Domicilio;

@Repository
public class DomicilioDAO extends DAO {
	
	@Autowired
	private HibernateAPI manager;
	
	public void insert (Domicilio domicio) {
		manager.getManager().getTransaction().begin();
		manager.getManager().persist(domicio);
		manager.getManager().getTransaction().commit();
	}
	
	public void update (Domicilio domicilio) {
		manager.getManager().getTransaction().begin();
		manager.getManager().merge(domicilio);
		manager.getManager().getTransaction().commit();
	}
	
	public void delete (Domicilio domicilio) throws RollbackException {
		manager.getManager().getTransaction().begin();
		Domicilio domicilioMerged = manager.getManager().merge(domicilio);
		manager.getManager().remove(domicilioMerged);
		manager.getManager().getTransaction().commit();
	}
	
	public Domicilio findById (Integer id) {
		return manager.getManager().find(Domicilio.class, id);
	}
	
	public List<Domicilio> findAll () {
		Query query = manager.getManager().createQuery("SELECT d FROM Domicilio d");
		List<Domicilio> domicilios = query.getResultList();
		return domicilios;
	}
}
