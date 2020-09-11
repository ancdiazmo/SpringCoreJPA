package com.spring.core.hibernate;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ServletConfig extends SpringBootServletInitializer{
	
	//este metodo se usa para el mapeo dentro de tomcat una ves se despliega la aplicacion
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Main.class);
	}
}
