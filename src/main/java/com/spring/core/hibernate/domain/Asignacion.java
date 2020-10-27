package com.spring.core.hibernate.domain;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Asignacion {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "TURNO", nullable = false)
	private String turno;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ID_ALUMNO", nullable = false)
	private Alumno alumno;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ID_CURSO", nullable = false)
	private Curso curso;
	
	public Asignacion () {
		this.id = 0;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTurno() {
		return turno;
	}

	public void setTurno(String turno) {
		this.turno = turno;
	}

	public Alumno getAlumno() {
		return alumno;
	}

	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	@Override
	public String toString() {
		return "Asignacion [id=" + id + ", turno=" + turno + ", alumno=" + alumno + ", curso=" + curso + "]";
	}
	
}
