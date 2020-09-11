package com.spring.core.hibernate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.spring.core.hibernate.dao.DAO;

@Service
public class GeneralService {
	
	@Autowired
	@Qualifier("DAO")
	private DAO dao;
	
	public void closeTransactionIfIsOpen () {
		if (this.dao.isTransactionOpen()) {
			this.dao.rollBackTransaction();
		}
	}
}
