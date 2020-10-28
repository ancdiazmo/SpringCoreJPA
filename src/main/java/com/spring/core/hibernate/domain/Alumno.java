package com.spring.core.hibernate.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Alumno {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "APELLIDO", nullable = false)
	private String apellido;
	@Column(name = "NOMBRE", nullable = false)
	private String nombre;

	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "ID_DOMICILIO", nullable = false)
	private Domicilio domicilio;
	
	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "ID_CONTACTO", nullable = false)
	private Contacto contacto;
	
	@OneToMany(mappedBy = "alumno")
	private List<Asignacion> asignaciones;
	
	
	public Alumno () {
		this.id = 0;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public Domicilio getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(Domicilio domicilio) {
		this.domicilio = domicilio;
	}

	public Contacto getContacto() {
		return contacto;
	}

	public void setContacto(Contacto contacto) {
		this.contacto = contacto;
	}

	@Override
	public String toString() {
		return "Alumno [id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", domicilio=" + domicilio
				+ ", contacto=" + contacto + "]";
	}

}
