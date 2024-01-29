package com.dojo.authentication.models;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;

@Entity
@Table(name ="puntuacion")
public class Puntuacion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	
	@Min(1) @Max(5)
	private Integer rating;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User host;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="programas_id")
	 private ProgramaModel programa;

	public Integer getRating() {
		return rating;
	}

	public User getHost() {
		return host;
	}

	public ProgramaModel getPrograma() {
		return programa;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public void setHost(User host) {
		this.host = host;
	}

	public void setPrograma(ProgramaModel programa) {
		this.programa = programa;
	}
	
	

}
