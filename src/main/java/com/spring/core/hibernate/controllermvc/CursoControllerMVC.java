package com.spring.core.hibernate.controllermvc;

import java.util.List;

import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.core.hibernate.domain.Curso;
import com.spring.core.hibernate.exceptions.CursoException;
import com.spring.core.hibernate.service.CursoService;

@Controller
public class CursoControllerMVC {
	
	@Autowired
	private CursoService cursoService;
	
	@GetMapping("/Cursomvc")
	public ModelAndView manejaCursos () {
		ModelAndView model = new ModelAndView ();
		List<Curso> cursos = cursoService.findAll();
		model.addObject("cursos", cursos);
		model.addObject("vista","Curso");
		model.setViewName("index");
		return model;
	}
	
	@GetMapping("/Cursomvc/agregar")
	public ModelAndView agregaCurso () {
		return new ModelAndView ("Curso/AgregarCurso");
	}
	
	@GetMapping("/Cursomvc/agregar/{id}")
	public ModelAndView modificarCurso (@PathVariable String id) {
		
		Curso curso = cursoService.findById(id);
		ModelAndView model = new ModelAndView ();
		model.addObject("curso",curso);
		model.setViewName("Curso/ModificarCurso");
		return model;
	}
	
	@PostMapping("/Cursomvc/agregar")
	public ModelAndView agregarmodificar (Curso curso, @RequestParam(required = false) String guardar) {
		try {
			if (guardar != null)
				cursoService.saveCurso(curso);
			else {
				cursoService.remove(curso);
			}
		} 
		catch (CursoException e) {
			e.printStackTrace();
			cursoService.closeTransactionIfIsOpen();
		}
		catch (RollbackException e) {
			e.printStackTrace();
			cursoService.closeTransactionIfIsOpen();
		}
		return new ModelAndView("redirect:/Cursomvc");
	}
	
}
