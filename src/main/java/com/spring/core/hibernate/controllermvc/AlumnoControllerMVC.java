package com.spring.core.hibernate.controllermvc;

import java.util.List;

import javax.persistence.RollbackException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.core.hibernate.domain.Alumno;
import com.spring.core.hibernate.exceptions.AlumnoException;
import com.spring.core.hibernate.service.AlumnoService;

@Controller
public class AlumnoControllerMVC {

	@Autowired
	private AlumnoService alumnoService;
	
	@GetMapping("/Alumno")
	public ModelAndView manejaAlumno () {
		List<Alumno> alumnos = alumnoService.findAll();
		ModelAndView model = new ModelAndView ();
		model.addObject("alumnos", alumnos);
		model.addObject("vista", "Alumno");
		model.setViewName("index");
		return model;
	}
	
	@GetMapping("/Alumno/agregar")
	public ModelAndView agregaAlumno() {
		return new ModelAndView ("Alumno/AgregarAlumno");
	}
	
	@GetMapping("/Alumno/agregar/{id}")
	public ModelAndView modificarAlumno(@PathVariable String id) {
		Alumno alumno = alumnoService.findById(id);
		ModelAndView model = new ModelAndView ();
		model.setViewName("Alumno/ModificarAlumno");
		model.addObject("alumno", alumno);
		return model;
	}
	
	@PostMapping("/Alumno/agregar")
	public ModelAndView agregaModificaBorraAlumno (Alumno alumno, @RequestParam(required = false) String guardar) {
		try {
			if(guardar != null) {
				alumnoService.save(alumno);
			}
			else {
				alumnoService.remove(alumno);
			}
		} 
		catch (AlumnoException e) {
			e.printStackTrace();
			alumnoService.closeTransactionIfIsOpen();
		}
		catch (RollbackException e) {
			e.printStackTrace();
			alumnoService.closeTransactionIfIsOpen();
		}
		return new ModelAndView("redirect:/Alumno");
	}
}
