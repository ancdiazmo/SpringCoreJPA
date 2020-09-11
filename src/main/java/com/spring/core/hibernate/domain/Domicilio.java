package com.spring.core.hibernate.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Domicilio {
	
	@Id
	@GeneratedValue (strategy = GenerationType.AUTO)
	private Integer id;
	@Column(name = "CALLE", nullable = false)
	private String calle;
	@Column(name = "NRO_CALLE", nullable = false)
	private String nroCalle;
	@Column(name = "PAIS", nullable = false)
	private String pais;
	
	@OneToMany(mappedBy = "domicilio")
	private List<Alumno> alumnos;
	
	public Domicilio () {
		//Contructor por defecto de Domicilio
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public String getNroCalle() {
		return nroCalle;
	}

	public void setNroCalle(String nroCalle) {
		this.nroCalle = nroCalle;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	@Override
	public String toString() {
		return "Domicilio [id=" + id + ", calle=" + calle + ", nroCalle=" + nroCalle + ", pais=" + pais + "]";
	}
	
}
