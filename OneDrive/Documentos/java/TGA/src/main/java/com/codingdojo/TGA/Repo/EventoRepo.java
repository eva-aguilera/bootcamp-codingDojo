package com.codingdojo.TGA.Repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.TGA.Models.Alianzas;
import com.codingdojo.TGA.Models.EventosModel;

public interface EventoRepo extends CrudRepository<EventosModel, Long>{
	
	List<EventosModel> findByProvincia(String provincia);
	
	List<EventosModel> findByProvinciaIsNot(String provincia);


	 List<EventosModel> findAll();
}
