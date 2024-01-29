package com.codingdojo.TGA.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codingdojo.TGA.Models.Alianzas;
import com.codingdojo.TGA.Models.EventosModel;
import com.codingdojo.TGA.Models.User;
import com.codingdojo.TGA.Repo.EventoRepo;

@Service
public class EventoService {
	
	//INYECCION DE DEPENDENCIAS
	private final EventoRepo eventoRepo;
	
	public EventoService(EventoRepo eRepo) {
		this.eventoRepo = eRepo;
	}
	  //TODAS LAS ALIANZAS.
    public List<EventosModel> Eventos() {
        return eventoRepo.findAll();
    }
	
	
	public EventosModel crearAlianza(EventosModel evento) {
		return eventoRepo.save(evento);
	}
	public EventosModel crearEvento(EventosModel evento) {
		return eventoRepo.save(evento);
	}
	
	public List<EventosModel> eventoProvinciaUsuario(String provincia){
		return eventoRepo.findByProvincia(provincia);
	}
	
	public List<EventosModel> eventoNoProvinciaUsuario(String provincia){
		return eventoRepo.findByProvinciaIsNot(provincia);
	}
	
	public EventosModel unEvento(Long id){
		return eventoRepo.findById(id).orElse(null);
	}
	
	public EventosModel editarEvento(EventosModel evento) {
		return eventoRepo.save(evento);
	}
	
	public void borrarEvento(Long id) {
		eventoRepo.deleteById(id);
	}
	
	
	public void unirseCancelarEvento(EventosModel evento, User usuario, boolean asistencia) {
		if(asistencia) {
			evento.getAsistentes().add(usuario);
		}else {
			evento.getAsistentes().remove(usuario);
		}
		eventoRepo.save(evento);
	}

	

}
