package com.codingdojo.TGA.Repo;



import java.util.List;

import org.springframework.data.repository.CrudRepository;


import com.codingdojo.TGA.Models.Alianzas;
import com.codingdojo.TGA.Models.EventosModel;

public interface AlianzaRepo extends CrudRepository<Alianzas, Long>{

		List<Alianzas> findAll();
		

		
}
