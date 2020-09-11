package com.spring.core.hibernate;

import static org.mockito.Mockito.times;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import com.spring.core.hibernate.dao.CursoDAO;
import com.spring.core.hibernate.domain.Curso;
import com.spring.core.hibernate.exceptions.CursoException;
import com.spring.core.hibernate.service.CursoService;

@SpringBootTest
class CursoServiceTest {
	
	@Autowired
	private CursoService cursoService;
	@MockBean
	private CursoDAO cursoDAOMock;
	
	@Test
	 void saveCursoSinNombreTest () {
		
		//Arrange
		Curso curso = new Curso ();
		curso.setPrecio(13450000);
		
		//Act
		//Assert
		Exception e = Assertions.assertThrows(CursoException.class, () -> {
			cursoService.saveCurso(curso);
		});
		Assertions.assertEquals(true, e instanceof CursoException);
	}
	
	@Test
	 void saveCursoSinPrecioTest () {
		
		//Arrange
		Curso curso = new Curso ();
		curso.setNombre("Java full stack Springboot-Angular");
		
		//Act
		//Assert
		Exception e = Assertions.assertThrows(CursoException.class, () -> {
			cursoService.saveCurso(curso);
		});
		Assertions.assertEquals(true, e instanceof CursoException);
	}
	
	@Test
	 void saveCursoSinTest () throws CursoException {
		
		//Arrange
		Curso curso = new Curso ();
		curso.setNombre("Java full stack Springboot-Angular");
		curso.setPrecio(13450000);
		
		//Act
		Mockito.doAnswer(i -> {
			System.out.println("Ejecuto metodo: " + i.getMethod().getName());
			return null;
		}).when(cursoDAOMock).insert(curso);
		
		cursoService.saveCurso(curso);
		//Assert
		Mockito.verify(cursoDAOMock, times(1)).insert(curso);
	}
	
	@Test
	 void saveCursoConIDTest () throws CursoException {
		
		//Arrage
		Curso curso = new Curso ();
		curso.setId(539086218);
		curso.setNombre("Java full stack Springboot-Angular");
		curso.setPrecio(13450000);
		
		//Act
		Mockito.doAnswer(i -> {
			System.out.println("Ejecuto metodo:" + i.getMethod().getName()); 
			return null;
		}).when(cursoDAOMock).update(curso);
		cursoService.saveCurso(curso);
		
		//Assert
		Mockito.verify(cursoDAOMock, times(1)).update(curso);
		
	}
	
	@Test
	 void findAllTest () {
		
		//Arrange
		List<Curso> cursosEsperados = new ArrayList<>();
		Curso curso = new Curso ();
		curso.setId(872331821);
		cursosEsperados.add(curso);
		Mockito.when(cursoDAOMock.findAll()).thenReturn(cursosEsperados);
		//Act
		List<Curso> cursosObtenido = cursoService.findAll();
		//Assert
		Assertions.assertEquals(true, cursosObtenido.equals(cursosEsperados));
	}
	
	@Test
	 void removeConIdTest () throws CursoException, SQLIntegrityConstraintViolationException {
		
		//Arrange
		Curso curso = new Curso ();
		curso.setId(964935292);
		Mockito.doAnswer(i -> {
			System.out.println("Ejcuto metodo " + i.getMethod().getName());
			return null;
		}).when(cursoDAOMock).remove(curso);
		
		//Act
		cursoService.remove(curso);
		
		//Assert
		Mockito.verify(cursoDAOMock, times(1)).remove(curso);
	}
	
	@Test
	 void removeSinIdTest () {
		
		//Arrange
		Curso curso = new Curso ();
		//Act		
		Exception e = Assertions.assertThrows(CursoException.class, () -> {
			cursoService.remove(curso);
		});
		//Assert
		Assertions.assertEquals(true, e instanceof CursoException);
	}
	
	//se debe de analisar si el hecho de hererdare el metodo, hace que no se 
	//inyecte el mock, y por eso falla el test, puede ser mejor opcion probar el metodo
	//en la clase padre y no en la hija
	@Disabled 
	@Test
	 void closeTransactionIfisOpened () {
		
		//Arrange
		Mockito.when(cursoDAOMock.isTransactionOpen()).thenReturn(true);
		Mockito.doAnswer(i -> {
			System.out.println("Ejecuto metodo " + i.getMethod().getName());
			return null;
		}).when(cursoDAOMock).rollBackTransaction();
		
		//Act
		cursoService.closeTransactionIfIsOpen();
		
		//Assert
		Mockito.verify(cursoDAOMock, times(1)).isTransactionOpen();
		Mockito.verify(cursoDAOMock, times(1)).rollBackTransaction();
	}
	
	@Test
	 void findByIdTest() {
		
		//Arrange
		Curso curso = new Curso ();
		curso.setId(269840915);
		Mockito.when(cursoDAOMock.findById(curso.getId())).thenReturn(curso);
		
		//Act
		Curso cursoObtenido = cursoService.findById(String.valueOf(curso.getId()));
		
		//Assert
		Assertions.assertEquals(true, curso.equals(cursoObtenido));
	}

}
