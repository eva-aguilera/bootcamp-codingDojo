package com.dojo.authentication.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dojo.authentication.models.ProgramaModel;
import com.dojo.authentication.models.Puntuacion;
import com.dojo.authentication.models.User;
import com.dojo.authentication.repoitories.ProgramaRepo;
import com.dojo.authentication.repoitories.PuntuacionRepo;
import com.dojo.authentication.repoitories.UserRepo;




@Service
public class ProgramaService {
	
	//INYECCION DE DEPENDENCIAS
		private final ProgramaRepo programaRepo;
		private final UserRepo userRepo;
		private final PuntuacionRepo puntuacionRepo;
		
		public ProgramaService(ProgramaRepo pRepo,UserRepo userRepo,PuntuacionRepo puntuacionRepo) {
			this.programaRepo = pRepo;
			this.userRepo = userRepo;
			this.puntuacionRepo = puntuacionRepo;
		}
	
	public ProgramaModel crearPrograma(ProgramaModel programa) {
		return programaRepo.save(programa);
	}
	public Puntuacion puntuacion(Puntuacion puntuacion) {
		return puntuacionRepo.save(puntuacion);
	}
	
	 public List<ProgramaModel> titulo(String titulo) {
		 return programaRepo.findByTitulo(titulo);
	 }
	
	 public List<ProgramaModel> mostrarPrograma() {
		 return programaRepo.findAll();
	 }
	 public List<User> mostrarUsuarios() {
		 return userRepo.findAll();
	 }
	 public ProgramaModel unPrograma(Long id){
			return programaRepo.findById(id).orElse(null);
		}
	 public ProgramaModel editarPrograma(ProgramaModel programa) {
			return programaRepo.save(programa);
		}
	
     public void deleteById(Long id) {
    	  List<Puntuacion> puntuaciones = puntuacionRepo.findByProgramaId(id);
    	  puntuacionRepo.deleteAll(puntuaciones);
    	  programaRepo.deleteById(id);
    	}
	
}
