package com.dojo.authentication.controllers;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.dojo.authentication.models.LoginUser;
import com.dojo.authentication.models.ProgramaModel;
import com.dojo.authentication.models.Puntuacion;
import com.dojo.authentication.models.User;
import com.dojo.authentication.services.ProgramaService;
import com.dojo.authentication.services.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {

	private final UserService userService;
	private final ProgramaService programaService;

	public HomeController(UserService userService, ProgramaService programService) {
		this.userService = userService;
		this.programaService = programService;
	}

	@GetMapping("/")
	public String index(Model modelo) {
		modelo.addAttribute("registro", new User());
		modelo.addAttribute("login", new LoginUser());
		return "index.jsp";
	}

	@PostMapping("/register")
	public String registro(@Valid @ModelAttribute("registro") User nuevoUsuario, BindingResult resultado, Model modelo,
			HttpSession sesion) {

		if (resultado.hasErrors()) {
			modelo.addAttribute("login", new LoginUser());
			return "index.jsp";
		}
		User usuarioRegistrar = userService.registrarUsuario(nuevoUsuario, resultado);

		if (usuarioRegistrar != null) {
			modelo.addAttribute("login", new LoginUser());
			modelo.addAttribute("registro", new User());
			modelo.addAttribute("gracias", "Bienvenido!");

			return "index.jsp";
		} else {
			modelo.addAttribute("login", new LoginUser());
			return "index.jsp";
		}

	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("login") LoginUser loginuser, BindingResult resultado, Model modelo,
			HttpSession sesion) {

		if (resultado.hasErrors()) {
			modelo.addAttribute("registro", new User());
			return "index.jsp";
		}
//		boolean cumple_login = userService.autenticacionUser(loginuser.getEmail(),
//				loginuser.getPassword(),
//				resultado);
		if (userService.autenticacionUser(loginuser.getEmail(), loginuser.getPassword(), resultado)) {
			User usuarioLog = userService.encontrarPorEmail(loginuser.getEmail());
			sesion.setAttribute("userID", usuarioLog.getId());
			return "redirect:/shows";
		}else {
			modelo.addAttribute("registro", new User());
			return "index.jsp";
		}
	}

	@GetMapping("/shows")
	public String dashboard(HttpSession sesion, Model modelo) {
		Long userId = (Long) sesion.getAttribute("userID");
		if(userId == null) {
			return "redirect:/";
		}
		User usuario = userService.encontrarPorId(userId);
		modelo.addAttribute("usuario", usuario);
		modelo.addAttribute("shows", programaService.mostrarPrograma());
		  return "dashboard.jsp";
	}
	@GetMapping("/shows/{id}")
	public String verPrograma(HttpSession sesion,Model modelo, @PathVariable("id") Long id) {
		Long userId = (Long) sesion.getAttribute("userID");
		if(userId == null) {
			return "redirect:/";
		}
		User usuario = userService.encontrarPorId(userId);
		ProgramaModel Programa = programaService.unPrograma(id);
		modelo.addAttribute("show",programaService.unPrograma(id));
		
		modelo.addAttribute("programas", programaService.mostrarPrograma());
		
		modelo.addAttribute("usuario", usuario);
		
		List<Puntuacion> programaAscendente = Programa.getPuntacion();
		//System.out.println(programaAscendente);
		Collections.sort(programaAscendente, Comparator.comparingInt(programa -> programa.getRating()));
		modelo.addAttribute("programaAscendente", programaAscendente);
	
		return "verPrograma.jsp";
	}
	@PostMapping("/shows/{id}")
	public String crearRating(Model model, HttpSession sesion, HttpServletRequest request, @PathVariable("id") Long id) {
		Long userId = (Long) sesion.getAttribute("userID");
		
		if(userId == null) {
			return "redirect:/";
		}
		User usuario = userService.encontrarPorId(userId);
		
		String rating = request.getParameter("rating");
			
		
		ProgramaModel Programa = programaService.unPrograma(id);
		
		
		List<Puntuacion> programaAscendente = Programa.getPuntacion();
		System.out.println(programaAscendente);
		Collections.sort(programaAscendente, Comparator.comparingInt(programa -> programa.getRating()));
		
		
		
		
		for(Puntuacion puntuacion:Programa.getPuntacion() ) {
			if(puntuacion.getHost() == usuario ) {
				model.addAttribute("error", "el usuario ya tiene rating" );
				model.addAttribute("show",programaService.unPrograma(id));
				model.addAttribute("programas", programaService.mostrarPrograma());
				model.addAttribute("programaAscendente", programaAscendente);
				
				model.addAttribute("usuario", usuario);
				return "verPrograma.jsp";
			}
		
		}
		Puntuacion puntacion = new Puntuacion();
		puntacion.setHost(usuario);
		puntacion.setPrograma(Programa);
		puntacion.setRating(Integer.valueOf(rating));
		Programa.addPuntacion(puntacion);
		programaService.crearPrograma(Programa);
		programaService.puntuacion(puntacion);
		
		return "redirect:/shows";
	}
	
	
	
	
	@GetMapping("/shows/new")
	public String dashboard(HttpSession sesion, Model modelo, 
			@ModelAttribute("showsnew") ProgramaModel nuevoPrograma) {
		Long userId = (Long) sesion.getAttribute("userID");
		if(userId == null) {
			return "redirect:/";
		}
		User usuario = userService.encontrarPorId(userId);
		modelo.addAttribute("usuario", usuario);
			return "programa.jsp";
	}
	
	@PostMapping("/shows/new")
	public String crearEvento(@Valid @ModelAttribute("showsnew") ProgramaModel nuevoPrograma, 
			BindingResult resultado, Model modelo) {
		if(resultado.hasErrors()) {
			
			return "programa.jsp";
		}
		List <ProgramaModel> programaencontrado = programaService.titulo(nuevoPrograma.getTitulo());
		if(programaencontrado.size() > 0) {
			
		resultado.rejectValue("titulo", "error.titulo", "El titulo no puede ser el mismo"
				+ "");
		return "programa.jsp";
		}
		
		programaService.crearPrograma(nuevoPrograma);
		return "redirect:/shows";
	}
	
	@GetMapping("/shows/{id}/edit")
	public String formEditar( Model modelo, HttpSession sesion, @PathVariable("id") Long id ) {
		Long userId = (Long) sesion.getAttribute("userID");
		//System.out.println(sesion.getAttribute("userID") +"jjj");
		if(userId == null) {
			return "redirect:/";
		}

		modelo.addAttribute("usuario",userService.encontrarPorId(userId));
		modelo.addAttribute("editarshow", programaService.unPrograma(id));
		return "editar.jsp";
	}
	@PutMapping("/shows/{id}/edit")
	public String edicionPrograma(@Valid @ModelAttribute("editarshow") ProgramaModel nuevoPrograma,
			BindingResult resultado, @PathVariable("id") Long id, Model modelo, HttpSession sesion) {
		
		Long userId = (Long) sesion.getAttribute("userID");
		if(userId == null) {
			return "redirect:/";
		}		
		if(resultado.hasErrors()) {	
			modelo.addAttribute("usuario", userService.encontrarPorId(userId));
		
			return  "editar.jsp";
		}
		
	
		programaService.editarPrograma(nuevoPrograma);	
		return "redirect:/shows";		
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession sesion) {
		sesion.invalidate();
		return "redirect:/";
		
	}
	 @GetMapping("/shows/{id}/delete")
	    public String deleteById(@PathVariable("id") Long id) {
		 programaService.deleteById(id);
	        return "redirect:/shows";
	    }

}
