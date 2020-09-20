package com.spring.core.hibernate;

import static org.mockito.Mockito.times;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import com.spring.core.hibernate.dao.DAO;
import com.spring.core.hibernate.dao.HibernateAPI;
import com.spring.core.hibernate.util.LogsYMensajesConstantes;

@SpringBootTest
public class DAOTest {
	
	@Autowired
	@Qualifier("DAO")
	private DAO dao;
	@Autowired
	private HibernateAPI manager;
	
	@Test
	void isTransactionOpenTest () {
		
		//Arrange
		manager.getManager().getTransaction().begin();
		
		//Act
		boolean respuestaObtenida = dao.isTransactionOpen();
		
		//Assert
		Assertions.assertEquals(true, respuestaObtenida);
		manager.getManager().getTransaction().rollback();
	}
	
	@Test
	void rollBackTransactionTest () {
		
		//Arrange
		manager.getManager().getTransaction().begin();
		
		//Act
		dao.rollBackTransaction();
		
		//Assert
		Assertions.assertEquals(false, manager.getManager().getTransaction().isActive());
		
	}
}
