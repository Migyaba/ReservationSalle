package com.reservationsalles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    
    // Rediriger la racine vers la page d'accueil
    @GetMapping("/")
    public String accueil() {
        return "index";
    }
    
    @GetMapping("/accueil")
    public String accueilliste() {
        return "index";
    }
}
