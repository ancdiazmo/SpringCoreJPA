package com.spring.core.hibernate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.when;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import com.spring.core.hibernate.dao.HibernateAPI;
import com.spring.core.hibernate.dao.ContactoDAO;
import com.spring.core.hibernate.domain.Contacto;
import com.spring.core.hibernate.exceptions.ContactoException;
import com.spring.core.hibernate.service.ContactoService;

@SpringBootTest
class ContactoServiceTest {
	
	@Autowired
	private ContactoService contactoService;
	@MockBean
	private ContactoDAO contactoDAOMock;
	
	@Test
	void saveContactoSinIdTest () throws Exception {
		
		//Arrange
		Contacto contacto = new Contacto ();
		contacto.setTelefono("2789738");
		contacto.setEmail("ancdiaz@gmail.com");
		Mockito.doAnswer(i -> {
			System.out.println("Se ejecuta el metodo: " + i.getMethod().getName());
			return null;
		}).when(contactoDAOMock).insert(contacto);
		//Act
		contactoService.saveContacto(contacto);
		
		//Assert
		Mockito.verify(contactoDAOMock, times(1)).insert(contacto);
	}
	
	@Test
	void saveContactoConIdTest () throws Exception {
		
		//Arrange
		Contacto contacto = new Contacto ();
		contacto.setId(1000);
		contacto.setTelefono("2789738");
		contacto.setEmail("ancdiaz@gmail.com");
		Mockito.doAnswer(i -> {
			System.out.println("Se ejecuta el metodo: " + i.getMethod().getName());
			return null;
		}).when(contactoDAOMock).update(contacto);
		//Act
		contactoService.saveContacto(contacto);
		
		//Assert
		Mockito.verify(contactoDAOMock, times(1)).update(contacto);
	}
	
	@Test
	void saveContactoSinTelefonoTest () {
		//Arrange
		
		Contacto contacto = new Contacto ();
		contacto.setId(1000);
		contacto.setEmail("ancdiaz@gmail.com");
		
		//Act
		//Assert
		Exception e = assertThrows(ContactoException.class, () -> {
			contactoService.saveContacto(contacto);
		});
		Assertions.assertEquals(true, e instanceof ContactoException);
	}
	
	@Test
	void saveContactoSinEmailTest () {
		//Arrange
		
		Contacto contacto = new Contacto ();
		contacto.setId(1000);
		contacto.setTelefono("2789738");
		
		//Act
		//Assert
		Exception e = assertThrows(ContactoException.class, () -> {
			contactoService.saveContacto(contacto);
		});
		
		Assertions.assertEquals(true, e instanceof ContactoException);
	}
	
	@Test
	void borraContactoSinID () {
		//Arrange
		
		Contacto contacto = new Contacto ();
		contacto.setEmail("ancdiaz@gmail.com");
		contacto.setTelefono("2789738");
		
		//Act
		Exception e = assertThrows(ContactoException.class, () -> {
			contactoService.removeContacto(contacto);
		});
		
		//Assert
		Assertions.assertEquals(true, e instanceof ContactoException);
	}
	
	@Test
	void borraContactoConID () throws ContactoException, SQLIntegrityConstraintViolationException {
		
		//Arrange
		Contacto contacto = new Contacto ();
		contacto.setId(1000);
		contacto.setEmail("ancdiaz@gmail.com");
		contacto.setTelefono("2789738");
		Mockito.doAnswer(i -> {
			System.out.println("Se ejecuta el metodo: " + i.getMethod().getName());
			return i.getMethod().getName();
		}).when(contactoDAOMock).delete(contacto);
		//Act
		contactoService.removeContacto(contacto);
		//Assert
		Mockito.verify(contactoDAOMock, times(1)).delete(contacto);
	}
	
	@Test
	void findAll() {
		//Arrange
		List<Contacto> listaEsperada = new ArrayList<> ();
		Contacto contacto = new Contacto ();
		contacto.setId(98765);
		listaEsperada.add(contacto);
		Mockito.when(contactoDAOMock.findAll()).thenReturn(listaEsperada);
		//Act
		List<Contacto> obtenida = contactoService.findAll();
		//Assert
		Assertions.assertEquals(true, listaEsperada.equals(obtenida));
	}
}
