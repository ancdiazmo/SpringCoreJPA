package com.spring.core.hibernate;

import static org.junit.jupiter.api.Assertions.assertThrows;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import com.spring.core.hibernate.dao.HibernateAPI;
import com.spring.core.hibernate.dao.ContactoDAO;
import com.spring.core.hibernate.domain.Contacto;

@SpringBootTest
class ContactoDAOTest {
	
	@Autowired
	private ContactoDAO contactoDAO;
	@Autowired
	private HibernateAPI app;
	
	@Test
	void insertarUnContacto () {
		
		//Arrange
		Contacto contacto = new Contacto ();
		contacto.setEmail("email de prueba");
		contacto.setTelefono("telefono de prueba");
		
		//Act
		contactoDAO.insert(contacto);
		int idContacto = contacto.getId();
		//Assert
		Query query = app.getManager().createQuery("FROM Contacto WHERE id = '" + idContacto + "'");
		List<Contacto> obtenido = query.getResultList();
		Assertions.assertEquals(1, obtenido.size());
		
		//Clean
		app.getManager().getTransaction().begin();
		Query queryClean = app.getManager().createQuery("DELETE FROM Contacto WHERE id = '" + idContacto + "'");
		queryClean.executeUpdate();
		app.getManager().getTransaction().commit();
	}
	
	@Test
	void insertarUnContactoConId () {
		
		//Arrange
		Contacto contacto = new Contacto ();
		contacto.setId(167198650);
		contacto.setEmail("email de prueba");
		contacto.setTelefono("telefono de prueba");
		
		//Act
		//Assert
		Exception e = Assertions.assertThrows(PersistenceException.class, () -> {
			contactoDAO.insert(contacto);
		});
		
		if (contactoDAO.isTransactionOpen()) {
			contactoDAO.rollBackTransaction();
		}
		
		Assertions.assertTrue(e instanceof PersistenceException);
	}
	
	@Test
	void borrarContactoExistenteEnLaBD () throws SQLIntegrityConstraintViolationException {
		//Arrange
		Contacto contacto = new Contacto ();
		contacto.setEmail("email de prueba");
		contacto.setTelefono("telefono de prueba");
		app.getManager().getTransaction().begin();
		app.getManager().persist(contacto);
		int id = contacto.getId();
		app.getManager().getTransaction().commit();
		//Act
		contacto.setId(id);
		contactoDAO.delete(contacto);
		//Assert
		Query query = app.getManager().createQuery("FROM Contacto WHERE id = '" + id + "'");
		List<Contacto> obtenido = query.getResultList();
		Assertions.assertEquals(0, obtenido.size());
	}
	
	@Test
	void borrarContactoConIdUnicamenteYNoExistenteEnLaBD () {
		//Arrange
		Contacto contacto = new Contacto ();
		contacto.setId(987527654);
		
		//Act
		Exception e = assertThrows(PersistenceException.class, () -> {
			contactoDAO.delete(contacto);
		});
		
		if (contactoDAO.isTransactionOpen()) {
			contactoDAO.rollBackTransaction();
		}
		
		String mensajeEsperado = "org.hibernate.PropertyValueException: not-null property references a null or "
				+ "transient value : com.spring.core.hibernate.domain.Contacto.email";
		
		Assertions.assertEquals(true, mensajeEsperado.equals(e.getMessage()));
	}
	
	@Test
	void borrarContactoConTodosLosDatosYNoExistenteEnLaBD () throws SQLIntegrityConstraintViolationException {
		//Arrange
		Contacto contacto = new Contacto ();
		contacto.setId(623467951);
		contacto.setEmail("email de prueba");
		contacto.setTelefono("telefono de prueba");
		
		//Act
		contactoDAO.delete(contacto);
		
		//Assert (validamos que el metodo delete no haya creado un registro en la base de datos
		//mediante el metodo merge)
		
		Query query = app.getManager().createQuery("FROM Contacto WHERE id = '623467951'");
		List<Contacto> obtenido = query.getResultList();
		Assertions.assertEquals(0, obtenido.size());
	}
	

}
