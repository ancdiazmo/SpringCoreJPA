package com.spring.core.hibernate.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.springframework.stereotype.Component;
import com.spring.core.hibernate.util.LogsYMensajesConstantes;

@Component
public class HibernateAPI {
	
	private EntityManager manager;
	
	public HibernateAPI () {
		LogsYMensajesConstantes.generaInfoLog(LogsYMensajesConstantes.APPLICATIONCONTRUCTORLOG);
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("MiUnidadDePersistencia");
		manager = factory.createEntityManager();
	}

	public EntityManager getManager() {
		return manager;
	}
}
