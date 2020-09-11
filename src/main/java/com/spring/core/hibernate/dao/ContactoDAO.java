package com.spring.core.hibernate.dao;

import java.util.List;

import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.core.hibernate.domain.Contacto;

@Repository
public class ContactoDAO extends DAO {
	
	@Autowired
	private HibernateAPI manager;
	
	public void insert (Contacto contacto) throws PersistenceException {
		manager.getManager().getTransaction().begin();
		manager.getManager().persist(contacto);
		manager.getManager().getTransaction().commit();
	}
	public void update (Contacto contacto) throws PersistenceException {
		manager.getManager().getTransaction().begin();
		manager.getManager().merge(contacto);
		manager.getManager().getTransaction().commit();
	}
	public void delete (Contacto contacto) throws RollbackException {
		manager.getManager().getTransaction().begin();
		Contacto contactoMerged = manager.getManager().merge(contacto);
		manager.getManager().remove(contactoMerged);
		manager.getManager().getTransaction().commit();
	}
	
	public List<Contacto> findAll () {
		manager.getManager().getTransaction().begin();
		Query query = manager.getManager().createQuery("SELECT c FROM Contacto c");
		List<Contacto> contactos = query.getResultList();
		manager.getManager().getTransaction().commit();
		return contactos;
	}

	public Contacto findById(int id) {
		return manager.getManager().find(Contacto.class, id);
	}
}
