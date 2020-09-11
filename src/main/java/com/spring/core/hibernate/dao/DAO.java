package com.spring.core.hibernate.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DAO {
	
	@Autowired
	private HibernateAPI manager;
	
	public boolean isTransactionOpen () {
		return this.manager.getManager().getTransaction().isActive();
	}
	
	public void rollBackTransaction () {
		this.manager.getManager().getTransaction().rollback();
	}
}
