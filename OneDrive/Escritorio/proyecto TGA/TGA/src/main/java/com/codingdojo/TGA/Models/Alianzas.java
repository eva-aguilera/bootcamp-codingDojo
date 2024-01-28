package com.codingdojo.TGA.Models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "alianzas")
public class Alianzas {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message = "Nombre de la alianza es requerido!")
	@Size(min = 3 , max = 20, message = "Por favor ingresa un evento de al menos 3 caracteres")
	private String nombre;

	@NotEmpty(message = "el proposito es requerido!")
	@Size(min = 5, max = 100, message = "Por favor ingresa un evento de al menos 3 caracteres")
	private String proposito;

	@NotEmpty(message = "la descripcion es requerida!")
	
	private String descripcion;
	
	private String imgRoute;
	
	@Min(value = 0)
	private int like_count;
	

	@Min(value = 0)
	private int notLike;

	public String getImgRoute() {
		return imgRoute;
	}

	public void setImgRoute(String imgRoute) {
		this.imgRoute = imgRoute;
	}

	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;

	// RELACION 1:n hacia Usuario
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User host;

	// Relacion MANY-TO-MANY
		@ManyToMany(fetch = FetchType.LAZY)
		@JoinTable(name = "participantes", joinColumns = @JoinColumn(name = "alianza_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
		private List<User> participantes;

		@ManyToMany(fetch = FetchType.LAZY)
		@JoinTable(name = "Megusta", joinColumns = @JoinColumn(name="alianza_id"),	inverseJoinColumns = @JoinColumn(name="user_id"))
		private List<User> gusta;

	
	public List<User> getParticipantes() {
			return participantes;
		}







		public void setParticipantes(List<User> participantes) {
			this.participantes = participantes;
		}







	public Alianzas() {
	}
	
	

	

	

	public User getHost() {
		return host;
	}

	public void setHost(User host) {
		this.host = host;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public int getLike_count() {
		return like_count;
	}

	public int getNotLike() {
		return notLike;
	}

	public List<User> getGusta() {
		return gusta;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public void setNotLike(int notLike) {
		this.notLike = notLike;
	}

	public void setGusta(List<User> gusta) {
		this.gusta = gusta;
	}


	
	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	

	public String getNombre() {
		return nombre;
	}



	public String getProposito() {
		return proposito;
	}



	public String getDescripcion() {
		return descripcion;
	}



	public void setNombre(String nombre) {
		this.nombre = nombre;
	}



	public void setProposito(String proposito) {
		this.proposito = proposito;
	}



	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}



	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

}
