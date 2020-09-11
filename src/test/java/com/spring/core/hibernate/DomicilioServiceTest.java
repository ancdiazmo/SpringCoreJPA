package com.spring.core.hibernate;

import static org.mockito.Mockito.times;

import java.sql.SQLIntegrityConstraintViolationException;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import com.spring.core.hibernate.dao.DomicilioDAO;
import com.spring.core.hibernate.domain.Domicilio;
import com.spring.core.hibernate.exceptions.DomicilioException;
import com.spring.core.hibernate.service.DomicilioService;

@SpringBootTest
public class DomicilioServiceTest {
	
	@Autowired
	private DomicilioService domicilioService;
	@MockBean
	private DomicilioDAO domicilioDAOMock;
	
	@Test
	void saveSinNroCalleTest () {
		
		//Arrange
		Domicilio domicilio = new Domicilio ();
		domicilio.setCalle("Falsa");
		domicilio.setPais("Springfield");
		
		//Act
		Exception e = Assertions.assertThrows(DomicilioException.class, () -> {
			domicilioService.save(domicilio);
		});
		
		//Assert
		Assertions.assertEquals(true, e instanceof DomicilioException);
	}
	
	@Test
	void saveSinCalleTest () {
		
		//Arrange
		Domicilio domicilio = new Domicilio ();
		domicilio.setPais("Springfield");
		domicilio.setNroCalle("123");
		
		//Act
		Exception e = Assertions.assertThrows(DomicilioException.class, () -> {
			domicilioService.save(domicilio);
		});
		
		//Assert
		Assertions.assertEquals(true, e instanceof DomicilioException);
	}
	
	@Test
	void saveSinPaisTest () {
		
		//Arrange
		Domicilio domicilio = new Domicilio ();
		domicilio.setNroCalle("123");
		domicilio.setCalle("Falsa");
		
		//Act
		Exception e = Assertions.assertThrows(DomicilioException.class, () -> {
			domicilioService.save(domicilio);
		});
		
		//Assert
		Assertions.assertEquals(true, e instanceof DomicilioException);
	}
	
	@Test
	void saveTest () throws DomicilioException {
		
		//Arrange
		Domicilio domicilio = new Domicilio ();
		domicilio.setNroCalle("123");
		domicilio.setCalle("Falsa");
		domicilio.setPais("Springfield");
		Mockito.doAnswer(i -> {
			System.out.println("Ejecuto el metodo: " + i.getMethod().getName());
			return null;
		}).when(domicilioDAOMock).insert(domicilio);
		
		//Act
		domicilioService.save(domicilio);
		
		//Assert
		Mockito.verify(domicilioDAOMock, times(1)).insert(domicilio);
	}
	
	@Test
	void saveConIdtest () throws DomicilioException {
		
		//Arrange
		Domicilio domicilio = new Domicilio ();
		domicilio.setId(898916735);
		domicilio.setNroCalle("123");
		domicilio.setCalle("Falsa");
		domicilio.setPais("Springfield");
		Mockito.doAnswer(i -> {
			System.out.println("Ejecuto el metodo: " + i.getMethod().getName());
			return null;
		}).when(domicilioDAOMock).insert(domicilio);
		
		//Act
		domicilioService.save(domicilio);
		
		//Assert
		Mockito.verify(domicilioDAOMock, times(1)).update(domicilio);
	}
	
	@Test
	void removeSinId () {
		
		//Arrange
		Domicilio domicilio = new Domicilio ();
		domicilio.setNroCalle("123");
		domicilio.setCalle("Falsa");
		domicilio.setPais("Springfield");
		
		//Act
		Exception e = Assertions.assertThrows(DomicilioException.class, () -> {
			domicilioService.remove(domicilio);
		});
		
		//Assert
		Assertions.assertEquals(true, e instanceof DomicilioException);
	}
	
	@Test
	void removeConId () throws DomicilioException, SQLIntegrityConstraintViolationException {
		
		//Arrange
		Domicilio domicilio = new Domicilio ();
		domicilio.setId(898916735);
		domicilio.setNroCalle("123");
		domicilio.setCalle("Falsa");
		domicilio.setPais("Springfield");
		
		Mockito.doAnswer(i -> {
			System.out.println("Se ejecuta el metodo: " + i.getMethod().getName());
			return null;
		}).when(domicilioDAOMock).delete(domicilio);
		
		//Act
		domicilioService.remove(domicilio);
		
		//Assert
		Mockito.verify(domicilioDAOMock, times(1)).delete(domicilio);
	}
	
}
