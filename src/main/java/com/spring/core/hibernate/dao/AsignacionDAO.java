package com.spring.core.hibernate.dao;

import java.util.List;
import javax.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.spring.core.hibernate.domain.Asignacion;

@Repository
public class AsignacionDAO extends DAO {
	
	@Autowired
	private HibernateAPI manager;
	
	public void insertAsignacion (Asignacion asignacion) {
		manager.getManager().getTransaction().begin();
		manager.getManager().persist(asignacion);
		manager.getManager().getTransaction().commit();
		manager.getManager().detach(asignacion);
	}
	
	public void updateAsignacion (Asignacion asignacion) {
		manager.getManager().getTransaction().begin();
		manager.getManager().merge(asignacion);
		manager.getManager().getTransaction().commit();
	}
	
	public void deleteAsignacion (Asignacion asignacion) {
		manager.getManager().getTransaction().begin();
		Asignacion asignacionMerged = manager.getManager().merge(asignacion);
		manager.getManager().remove(asignacionMerged);
		manager.getManager().getTransaction().commit();
	}
	
	public Asignacion findById (Integer id) {
		return manager.getManager().find(Asignacion.class, id);
	}
	
	public List<Asignacion> findAll() {
		Query query = manager.getManager().createQuery("SELECT a FROM Asignacion a");
		return query.getResultList();
	}
}
