package com.spring.core.hibernate;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.core.hibernate.dao.AlumnoDAO;
import com.spring.core.hibernate.domain.Alumno;
import com.spring.core.hibernate.domain.Contacto;
import com.spring.core.hibernate.domain.Domicilio;

@SpringBootTest
public class AlumnoDAOTest {
	
	@Autowired
	private AlumnoDAO alumnoDAO;
	
	@Test
	@Disabled
	//TODO: este test se debe de revizar ya que ahora al ingresar un usuario no se crea un contacto y un domicilio
	void insetTest () {
		
		//Arrange
		Alumno alumno = new Alumno ();
		Contacto contacto = new Contacto ();
		Domicilio domicilio = new Domicilio ();
		
		alumno.setNombre("Juan");
		alumno.setApellido("Diaz");
		alumno.setContacto(contacto);
		alumno.setDomicilio(domicilio);
		alumno.getContacto().setTelefono("3205340026");
		alumno.getContacto().setEmail("ancdiazmo@gmail.com");
		alumno.getDomicilio().setCalle("false");
		alumno.getDomicilio().setNroCalle("123");
		alumno.getDomicilio().setPais("Springfield");
		
		//Act
		alumnoDAO.insert(alumno);
	}
}
