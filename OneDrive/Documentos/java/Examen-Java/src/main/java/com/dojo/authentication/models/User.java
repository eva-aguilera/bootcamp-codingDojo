package com.dojo.authentication.models;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message = "Nombre de usuaro es requerido!")
	@Size(min = 3, max = 30, message = "Por favor ingresa un username de al menos 3 caracteres")
	private String userName;

	@NotEmpty(message = "Correo electrónico es requerido!")
	@Email(message = "Por favor ingresa un email valido")
	private String email;

	@NotEmpty(message = "Password es requerido!")
	@Size(min = 8, max = 128, message = "Password debe contener al menos 8 caracteres")
	private String password;

	@Transient
	@NotEmpty(message = "Password es requerido!")
	@Size(min = 8, max = 128, message = "Password debe contener al menos 8 caracteres")
	private String passwordConfirmation;

	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	
	
	@OneToMany(mappedBy="host", fetch = FetchType.LAZY)
	private List<ProgramaModel> programas;
	@OneToMany(mappedBy="host", fetch = FetchType.LAZY)
	private List<Puntuacion> puntacion;
	
	public User() {
	}

	// otros getters y setters removidos para resumir.


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}

	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
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
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

}
