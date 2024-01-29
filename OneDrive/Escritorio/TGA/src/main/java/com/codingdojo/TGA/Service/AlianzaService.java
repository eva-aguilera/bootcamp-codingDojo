package com.codingdojo.TGA.Service;



import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.codingdojo.TGA.Models.Alianzas;

import com.codingdojo.TGA.Models.User;
import com.codingdojo.TGA.Repo.AlianzaRepo;

@Service
public class AlianzaService {
	
	//INYECCION DE DEPENDENCIAS
	private final AlianzaRepo eventoRepo;
	
	public AlianzaService(AlianzaRepo eRepo) {
		this.eventoRepo = eRepo;
	}
	
	
	public Alianzas crearAlianza(Alianzas evento) {
		return eventoRepo.save(evento);
	}
	public Alianzas crearEvento(Alianzas evento) {
		return eventoRepo.save(evento);
	}
	
	  //TODAS LAS ALIANZAS.
    public List<Alianzas> Alianzas() {
        return eventoRepo.findAll();
    }
	
	public List<Alianzas> buscarPorLetras(String letras) {
	    List<Alianzas> alianzasEncontradas = new ArrayList<>();

	    // Obtiene todas las alianzas de la base de datos
	    List<Alianzas> alianzas = eventoRepo.findAll();

	    // Itera sobre la lista de alianzas
	    for (Alianzas alianza : alianzas) {
	        // Verifica si el nombre o la descripción contiene las letras indicadas
	        if (alianza.getNombre().toLowerCase().contains(letras.toLowerCase()) ||
	                alianza.getDescripcion().toLowerCase().contains(letras.toLowerCase())) {
	            // Agrega la alianza a la lista de resultados
	            alianzasEncontradas.add(alianza);
	        }
	    }

	    // Devuelve la lista de resultados
	    return alianzasEncontradas;
	}


	public Alianzas mostrarAlianza(Long id){
		return eventoRepo.findById(id).orElse(null);
	}
	
	public Alianzas editarEvento(Alianzas evento) {
		return eventoRepo.save(evento);
	}
	
	public void borrarEvento(Long id) {
		eventoRepo.deleteById(id);
	}
	
	public void unirseCancelarAlianza(Alianzas evento, User usuario, boolean asistencia) {
		if(asistencia) {
			evento.getParticipantes().add(usuario);
		}else {
			evento.getParticipantes().remove(usuario);
		}
		eventoRepo.save(evento);
	}
	public void likeNotLike(Alianzas evento, User usuario, boolean gusta) {
		if(gusta){
			evento.getGusta().add(usuario);
		}else {
			evento.getGusta().remove(usuario);
		}
		eventoRepo.save(evento);
	}
	
	
	
}
