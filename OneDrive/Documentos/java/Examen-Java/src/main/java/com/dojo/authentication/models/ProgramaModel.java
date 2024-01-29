package com.dojo.authentication.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
 
@Entity
@Table(name ="programas")
public class ProgramaModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message = "El titulo es obligatorio ")
	@Size(min = 3, max = 30, message = "Por favor ingresa un programa de al menos 3 caracteres")
	private String titulo;

	
	@NotBlank(message = "Por favor ingresa la red")
	@Size(min = 3, max = 30, message = "Por favor ingresa una de al menos 3 caracteres")
	private String red;
	
	
	

	public List<Puntuacion> getPuntacion() {
		return puntacion;
	}

	public void setPuntacion(List<Puntuacion> puntacion) {
		this.puntacion = puntacion;
	}
	public void addPuntacion(Puntuacion puntacion) {
		this.puntacion.add(puntacion);  
	}

	

	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;

	 @OneToMany(mappedBy="programa", fetch = FetchType.LAZY)
	 private List<Puntuacion> puntacion = new ArrayList<>();
	    
	public String calcularAvg() {
		int suma = 0;
		for (Puntuacion puntacion : this.puntacion) {
			suma +=  puntacion.getRating();
        }
		if(suma != 0) {
        	return String.valueOf(suma / this.puntacion.size());
        }
		return "no tiene puntuacion";
	} 
	
	// RELACION 1:n hacia Usuario
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User host;


	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	public Long getId() {
		return id;
	}

	public String getTitulo() {
		return titulo;
	}

	public String getRed() {
		return red;
	}



	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public User getHost() {
		return host;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public void setRed(String red) {
		this.red = red;
	}

	
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public void setHost(User host) {
		this.host = host;
	}

	

	
	
	
}
