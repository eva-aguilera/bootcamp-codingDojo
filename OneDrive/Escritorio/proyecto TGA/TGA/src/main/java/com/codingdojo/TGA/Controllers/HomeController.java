package com.codingdojo.TGA.Controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.TGA.Models.Alianzas;
import com.codingdojo.TGA.Models.EventosModel;
import com.codingdojo.TGA.Models.LoginUser;
import com.codingdojo.TGA.Models.Provincias;
import com.codingdojo.TGA.Models.User;
import com.codingdojo.TGA.Service.AlianzaService;
import com.codingdojo.TGA.Service.EventoService;
import com.codingdojo.TGA.Service.UserService;


import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {

	private final UserService userService;
	private final AlianzaService alianzaService;
	private final EventoService eventoService;

	public HomeController(UserService userService, AlianzaService aService,EventoService eService) {
		this.userService = userService;
		this.alianzaService = aService;
		this.eventoService = eService;
	}
	//ESTO ES HOME
	@GetMapping("/")
	public String paginadeinicio(Model modelo,HttpSession sesion) {
		modelo.addAttribute("usuarioActivo", sesion.getAttribute("userID"));
		Long userId = (Long) sesion.getAttribute("userID");
		if(userId != null) {
			User usuario = userService.encontrarPorId(userId);
			modelo.addAttribute("usuario", usuario);
		}
		return "Inicio.jsp";
	}
	//DONAR
	@GetMapping("/donar")
	public String paginadedonar(Model modelo,HttpSession sesion) {
		modelo.addAttribute("usuarioActivo", sesion.getAttribute("userID"));
		Long userId = (Long) sesion.getAttribute("userID");
		if(userId != null) {
			User usuario = userService.encontrarPorId(userId);
			modelo.addAttribute("usuario", usuario);
		}
		return "Donar.jsp";
	}
	
	//LOGIN
	@GetMapping("/login")
	public String index(Model modelo) {
		modelo.addAttribute("login", new LoginUser());
		return "Login.jsp";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("login") LoginUser loginuser, BindingResult resultado, Model modelo,
			HttpSession sesion) {

		if (resultado.hasErrors()) {
			modelo.addAttribute("registro", new User());
			return "Login.jsp";
		}
		if (userService.autenticacionUser(loginuser.getEmail(), loginuser.getPassword(), resultado)) {
			User usuarioLog = userService.encontrarPorEmail(loginuser.getEmail());
			sesion.setAttribute("userID", usuarioLog.getId());
			return "redirect:/";
		}
		else{
			modelo.addAttribute("registro", new User());
			return "Login.jsp";
		}
	}
	//REGISTRO
	@GetMapping("/register")
	public String registro(Model modelo) {
		modelo.addAttribute("registro", new User());
		modelo.addAttribute("provincias", Provincias.provincias);
		return "Registro.jsp";
	}
	
	@PostMapping("/register")
	public String registro(@Valid @ModelAttribute("registro") User nuevoUsuario, BindingResult resultado, Model modelo,
			HttpSession sesion) {

		if (resultado.hasErrors()) {
			modelo.addAttribute("login", new LoginUser());
			modelo.addAttribute("provincias", Provincias.provincias);
			return "Registro.jsp";
		}
		User usuarioRegistrar = userService.registrarUsuario(nuevoUsuario, resultado);
		
		

		if (usuarioRegistrar != null) {
			modelo.addAttribute("login", new LoginUser());
			modelo.addAttribute("registro", new User());
			modelo.addAttribute("provincias", Provincias.provincias);
			modelo.addAttribute("gracias", "Gracias por registrarte");

			return "redirect:/login";
		} else {
			modelo.addAttribute("login", new LoginUser());
			return "redirect:/login";
		}

	}

	//PERFIL
	@GetMapping("/perfil")
	public String pagina(HttpSession sesion, Model modelo) {
		Long userId = (Long) sesion.getAttribute("userID");
		if(userId == null) {
			return "redirect:/";
		}
		User usuario = userService.encontrarPorId(userId);
		modelo.addAttribute("usuario", usuario);
		return "Perfil.jsp";
	}
	
	
	// CREAR ALIANZA
	@GetMapping("/crearalianza")
	public String Alianzas(  HttpSession sesion, Model modelo,@ModelAttribute("nuevoevento") Alianzas nuevoevento) {
		Long userId = (Long) sesion.getAttribute("userID");
		if(userId == null) {
			return "redirect:/";
		}
		User usuario = userService.encontrarPorId(userId);
		modelo.addAttribute("usuario", usuario);
		modelo.addAttribute("provincias", Provincias.provincias);
		
		return  "CrearAlianza.jsp";
	}
	 @GetMapping("/Crear/Evento")
	 public String crearEvento(HttpSession sesion, Model modelo, @ModelAttribute("evento") EventosModel evento) {
	   Long userId = (Long) sesion.getAttribute("userID");
	   if (userId == null) {
	     return "redirect:/";
	   }
	   User usuario = userService.encontrarPorId(userId);
	   modelo.addAttribute("usuario", usuario);
	   modelo.addAttribute("provincias", Provincias.provincias);
	   return "evento.jsp";
	 }

	
	@PostMapping("/crearalianza")
    public String crearAlianza(HttpSession sesion, @Valid @ModelAttribute("nuevoevento") Alianzas nuevoevento,
            BindingResult resultado, Model modelo, @RequestParam("postFile") MultipartFile postFile) {
        if (resultado.hasErrors()) {

            return "CrearAlianza.jsp";
        }

        Long userId = (Long) sesion.getAttribute("userID");
        User usuario = userService.encontrarPorId(userId);

        // Condicional para verificar si el usuario ya tiene una alianza
        if (usuario.getLider() == 1) {
            modelo.addAttribute("error", "Ya eres líder de una alianza. Solo puedes crear una.");
            return "CrearAlianza.jsp"; // Regresa a la vista con mensaje de error
        }
        
        nuevoevento.setHost(usuario);
        // se cae aqui

        System.out.println("despues" + usuario.getId());
        // nuevo
        if (postFile.isEmpty() == false) {
            String fileName = "servicioPicture";
            String imgRoute = "/img/" + userId + "/" + nuevoevento.getNombre();
            File directory = new File("src/main/resources/static" + imgRoute);
            if (directory.exists() == false) {
                directory.mkdirs();
            }
            try {
                byte[] bytes = postFile.getBytes();
                BufferedOutputStream outputStream = new BufferedOutputStream(
                        new FileOutputStream(
                                new File(directory.getAbsolutePath() + "/" + fileName)));
                outputStream.write(bytes);
                outputStream.flush();
                outputStream.close();
                System.out.println("El archivo se ha cargado con éxito.");
                nuevoevento.setImgRoute(imgRoute + "/" + fileName);
            } catch (IOException e) {
                // Auto-generated catch block
                e.printStackTrace();
                System.out.println("Ocurrió un error al cargar la imagen. " + e);
            }
        }

        Alianzas nuevaAlianza = alianzaService.crearAlianza(nuevoevento);
        usuario.setLider(1);
        userService.editarusuario(usuario);
        return "redirect:/Perfil/alianza/" + nuevaAlianza.getId();

    }

	//ALIANZA
	@GetMapping("/alianza")
	public String verAlianzas(Model modelo) {
	
		
	 List<Alianzas> Alianzas = alianzaService.Alianzas();
		modelo.addAttribute("alianzas", Alianzas);
		
		return "Alianzas.jsp";
	}
	
	//BUSCADOR DE GRUPOS DE ALIANZAS
	 @PostMapping("/buscar")
	    public String buscar(String letras, Model modelo) {
	        List<Alianzas> alianzas = alianzaService.buscarPorLetras(letras);
	        modelo.addAttribute("alianzas", alianzas);
	        return "Alianzas.jsp";
	    }
	 
	
	//PERFIL ALIANZA 	
	 @GetMapping("/Perfil/alianza/{id}")
	    public String mostraralianza(@PathVariable Long id,Model model) {
		Alianzas alianza= alianzaService.mostrarAlianza(id);
		model.addAttribute("alianza", alianza);
	
		User usuario = userService.encontrarPorId(id);
		model.addAttribute("usuario", usuario);
	    	return "Alianzaperfil.jsp";
	    }

	    @GetMapping("/alianza/{id}/{opcion}")
	    public String unirseCancelarAlianza(@PathVariable("id") Long id, @PathVariable("opcion") String opcion, HttpSession sesion) {
	        Long userId = (Long) sesion.getAttribute("userID");
	        if (userId == null) {
	            return "redirect:/";
	        }

	        Alianzas alianza = alianzaService.mostrarAlianza(id);
	        User usuario = userService.encontrarPorId(userId);
	        boolean unirseCancelar = opcion.equals("unirse");

	        alianzaService.unirseCancelarAlianza(alianza, usuario, unirseCancelar);

	       return "redirect:/";
	    }
	
	   //CREAR UN EVENTO POR LIDER
	
	 @PostMapping("/Crear/Evento")
	 public String crearEvento(HttpSession sesion, @Valid @ModelAttribute("evento") EventosModel evento, BindingResult resultado,
			 Model modelo, @RequestParam("postFile") MultipartFile postFile) {
	   Long userId = (Long) sesion.getAttribute("userID");
	   if (userId == null) {
	     return "redirect:/";
	   }
	   User usuario = userService.encontrarPorId(userId);
	   modelo.addAttribute("usuario", usuario);
	   if (resultado.hasErrors()) {
	     modelo.addAttribute("provincias", Provincias.provincias);
	     return "evento.jsp";
	   }
	  evento.setHost(usuario);
       // se cae aqui

       System.out.println("despues" + usuario.getId());
       // nuevo
       if (postFile.isEmpty() == false) {
           String fileName = "servicioPicture";
           String imgRoute = "/img/" + userId + "/" + evento.getNombreEvento();
           File directory = new File("src/main/resources/static" + imgRoute);
           if (directory.exists() == false) {
               directory.mkdirs();
           }
           try {
               byte[] bytes = postFile.getBytes();
               BufferedOutputStream outputStream = new BufferedOutputStream(
                       new FileOutputStream(
                               new File(directory.getAbsolutePath() + "/" + fileName)));
               outputStream.write(bytes);
               outputStream.flush();
               outputStream.close();
               System.out.println("El archivo se ha cargado con éxito.");
               evento.setImgRoute(imgRoute + "/" + fileName);
           } catch (IOException e) {
               // Auto-generated catch block
               e.printStackTrace();
               System.out.println("Ocurrió un error al cargar la imagen. " + e);
           }
       }
	 

	   eventoService.crearEvento(evento);
	   return "redirect:/eventos";
	 }
 
		
	 @GetMapping("/evento/{idEvento}/{opcion}")
	    public String asistirCancelarEvento(Model model,@PathVariable("idEvento") Long idEvento, @PathVariable("opcion") String opcion, HttpSession sesion){
	        Long userId = (Long) sesion.getAttribute("userID");
	        if (userId == null) {
	            return "redirect:/";
	        }

	        EventosModel evento = eventoService.unEvento(idEvento);
	        User usuario = userService.encontrarPorId(userId);
	        boolean unirseCancelar = opcion.equals("unirse");

	        eventoService.unirseCancelarEvento(evento, usuario, unirseCancelar);
	        model.addAttribute("unirse", unirseCancelar);

	        return "redirect:/";
	    }
	//LIKES

			@GetMapping("/likes/{id}/{opcion}") // Ruta corregida
			public String likesAlianza(@PathVariable("id") Long id,Model model, @PathVariable("opcion") String opcion, HttpSession sesion) {
			    Long userId = (Long) sesion.getAttribute("userID");
			    if (userId == null) {
			        return "redirect:/login"; // Redireccionar a login si no está autenticado
			    }

			    Alianzas alianza = alianzaService.mostrarAlianza(id);
			    User usuario = userService.encontrarPorId(userId);
			    boolean likesNotlike = opcion.equals("like");

			    alianzaService.likeNotLike(alianza, usuario, likesNotlike); // Método corregido
			    model.addAttribute("like", likesNotlike);
			    
			    // Redireccionar a la página del perfil de la alianza
			    return "redirect:/alianza/" + alianza.getId();
			}

	
		//ELIMINAR EVENTO
		@GetMapping("/evento/eliminar/{id}")
		public String borrarEvento(@PathVariable("id") Long id) {
			eventoService.borrarEvento(id);	
			return "redirect:/";
		}
		//VER TODOS LO EVENTOS
		@GetMapping("/eventos")
		public String verEventos(Model modelo) {
		List<EventosModel> Evento = eventoService.Eventos();
			modelo.addAttribute("eventos",Evento);
			
			return "Verevento.jsp";
		}

		
		
	@GetMapping("/logout")
	public String logout(HttpSession sesion) {
		sesion.invalidate();
		return "redirect:/";
		
	}

}
