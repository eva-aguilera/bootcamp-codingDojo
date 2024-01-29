package com.dojo.authentication.repoitories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dojo.authentication.models.Puntuacion;

@Repository

public interface PuntuacionRepo extends CrudRepository<Puntuacion, Long>{

	List<Puntuacion> findByProgramaId(Long id);

	


}
