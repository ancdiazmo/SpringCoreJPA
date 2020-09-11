package com.spring.core.hibernate.controllermvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	@GetMapping("/index")
	public ModelAndView volverIndex () {
		return new ModelAndView("index");
	}
}
