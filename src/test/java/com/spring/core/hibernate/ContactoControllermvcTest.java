package com.spring.core.hibernate;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
@AutoConfigureMockMvc
public class ContactoControllermvcTest {
	
	@Autowired
	private MockMvc mockMvc;
	
	@Test
	void manejaContactosGetTest () {
//		mockMvc.perform(MockMvcRequestBuilders.get(uri))
	}
	
//	@GetMapping("/Contactomvc")
//	public ModelAndView manejaContactos () {
	
//	@Test
//	void endPointTest () throws Exception {
//		mockMvc.perform(get("http://localhost:8080/mascotaController/listar"))
//		.andExpect(status().isOk())
//		.andExpect(content().contentType(MediaType.APPLICATION_JSON));
//	}
}
