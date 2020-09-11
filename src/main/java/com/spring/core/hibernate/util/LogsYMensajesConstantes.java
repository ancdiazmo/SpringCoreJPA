package com.spring.core.hibernate.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogsYMensajesConstantes {
	
	public static final String APPLICATIONCONTRUCTORLOG = "Se llama el contructor de application desde spring";
	public static final String DOMICILIOCONTRUCTORLOG = "Se llama el contructor de application desde spring";
	
	
	private static final String ERRORDEINSERT = "Se intento hacer una insercion sin el atributo:";
	private static final String ERRORDEDELETE = "Se intento hacer un borrado sin el atributo:";
	private static Logger logger = LoggerFactory.getLogger(LogsYMensajesConstantes.class);
	
	private LogsYMensajesConstantes () {}
	
	public static String generaMensajeErrorInsert (String clase, String nombreAtributo) {
		String mensaje = ERRORDEINSERT + " " + clase + "." +  nombreAtributo + " Fecha: " + LocalDate.now() + " Hora: " + LocalTime.now();
		logger.warn(mensaje); 
		return mensaje;
	}
	
	public static String generaMensajeErrorDelete (String clase, String nombreAtributo) {
		String mensaje = ERRORDEDELETE + " " + clase + "." +  nombreAtributo + " Fecha: " + LocalDate.now() + " Hora: " + LocalTime.now();
		logger.warn(mensaje); 
		return mensaje;
	}
	
	public static String generaInfoLog(String message) {
		logger.info(message);
		return message;
	}

}
