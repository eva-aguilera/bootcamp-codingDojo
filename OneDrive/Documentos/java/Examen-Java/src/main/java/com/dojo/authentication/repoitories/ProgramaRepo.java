package com.dojo.authentication.repoitories;

import java.util.List;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import com.dojo.authentication.models.ProgramaModel;

@Repository
public interface ProgramaRepo  extends CrudRepository<ProgramaModel, Long>{
	List<ProgramaModel> findAll();
	List<ProgramaModel> findByTitulo(String titulo);

	
	
	 
	
}
