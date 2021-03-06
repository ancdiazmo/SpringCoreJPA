package com.spring.core.hibernate.controllermvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.core.hibernate.domain.Alumno;
import com.spring.core.hibernate.domain.Asignacion;
import com.spring.core.hibernate.domain.Curso;
import com.spring.core.hibernate.exceptions.AsignacionException;
import com.spring.core.hibernate.service.AlumnoService;
import com.spring.core.hibernate.service.AsignacionService;
import com.spring.core.hibernate.service.CursoService;

@Controller
public class AsignacionControllerMVC {

	@Autowired
	private AsignacionService asignacionService;
	@Autowired
	private AlumnoService alumnoService;
	@Autowired
	private CursoService cursoService;
	
	@GetMapping("/Asignacion")
	public ModelAndView manejaAsignaciones () {
		List<Asignacion> asignaciones = asignacionService.findAll();
		ModelAndView model = new ModelAndView ();
		model.addObject("asignaciones", asignaciones);
		model.addObject("vista", "Asignacion");
		model.setViewName("index");
		return model;
	}
	
	@GetMapping("/Asignacion/agregar")
	public ModelAndView agregarAsignacion () {
		
		List<Alumno> alumnos = alumnoService.findAll();
		List<Curso> cursos = cursoService.findAll();
		ModelAndView model = new ModelAndView ();
		model.addObject("alumnos", alumnos);
		model.addObject("cursos", cursos);
		model.setViewName("/Asignaciones/AgregarAsignacion");
		return model;
	}

	
	@GetMapping("/Asignacion/agregar/{id}") 
	public ModelAndView modificarAsignacion (@PathVariable String id) {
		Asignacion asignacion = asignacionService.findById(id);
		List<Alumno> alumnos = alumnoService.findAll();
		List<Curso> cursos = cursoService.findAll();
		ModelAndView model = new ModelAndView ();
		model.addObject("asignacion", asignacion);
		model.addObject("alumnos", alumnos);
		model.addObject("cursos", cursos);
		model.setViewName("/Asignaciones/ModificaAsignacion");
		return model;
	}
	
	@PostMapping("/Asignacion/agregar")
	public ModelAndView agregarModificarBorrarAsignacion (Asignacion asignacion, @RequestParam(required = false) String guardar) {
		try {
			if (guardar != null) {
				asignacionService.save(asignacion);
			}
			else {
				asignacionService.remove(asignacion);
			}
			
		} catch (AsignacionException e) {
			asignacionService.closeTransactionIfIsOpen();
			e.printStackTrace();
		}
		return new ModelAndView ("redirect:/Asignacion");
	}
}
