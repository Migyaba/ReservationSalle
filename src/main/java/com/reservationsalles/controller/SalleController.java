package com.reservationsalles.controller;

import com.reservationsalles.model.Salle;
import com.reservationsalles.service.SalleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/salles")
public class SalleController {

    @Autowired
    private SalleService salleService;

    // Afficher la liste de toutes les salles
    @GetMapping
    public String listerSalles(Model model) {
        List<Salle> salles = salleService.obtenirToutes();
        model.addAttribute("salles", salles);
        return "salles/liste";
    }

    // Afficher le formulaire de création
    @GetMapping("/ajouter")
    public String afficherFormulaireAjout(Model model) {
        model.addAttribute("salle", new Salle());
        return "salles/formulaire";
    }

    // Enregistrer une nouvelle salle
    @PostMapping
    public String ajouterSalle(@ModelAttribute Salle salle) {
        salleService.ajouterSalle(salle);
        return "redirect:/salles";
    }

    // Afficher les détails d'une salle
    @GetMapping("/{id}")
    public String afficherSalle(@PathVariable("id") Long id, Model model) {
        Optional<Salle> salle = salleService.obtenirParId(id);
        if (salle.isPresent()) {
            model.addAttribute("salle", salle.get());
            return "salles/detail";
        }
        return "redirect:/salles";
    }

    // Afficher le formulaire de modification
    @GetMapping("/{id}/modifier")
    public String afficherFormulaireModification(@PathVariable("id") Long id, Model model) {
        Optional<Salle> salle = salleService.obtenirParId(id);
        if (salle.isPresent()) {
            model.addAttribute("salle", salle.get());
            return "salles/formulaire";
        }
        return "redirect:/salles";
    }

    // Mettre à jour une salle
    @PostMapping("/{id}")
    public String mettreAJourSalle(@PathVariable("id") Long id, @ModelAttribute Salle salle) {
        Salle updated = salleService.mettreAJourSalle(id, salle);
        if (updated != null) {
            return "redirect:/salles/" + id;
        }
        return "redirect:/salles";
    }

    // Supprimer une salle
    @GetMapping("/{id}/supprimer")
    public String supprimerSalle(@PathVariable("id") Long id) {
        salleService.supprimerSalle(id);
        return "redirect:/salles";
    }

    // Rechercher une salle par nom (JSON pour AJAX)
    @GetMapping("/rechercher")
    public String rechercher(@RequestParam String nom, Model model) {
        List<Salle> salles = salleService.rechercherParNom(nom);
        model.addAttribute("salles", salles);
        model.addAttribute("recherche", nom);
        return "salles/liste";
    }

    // Filtrer par capacité (JSON pour AJAX)
    @GetMapping("/filtrer-capacite")
    public String filtrerParCapacite(@RequestParam Integer capacite, Model model) {
        List<Salle> salles = salleService.filtrerParCapacite(capacite);
        model.addAttribute("salles", salles);
        model.addAttribute("filtreCapacite", capacite);
        return "salles/liste";
    }

    // Filtrer par prix (JSON pour AJAX)
    @GetMapping("/filtrer-prix")
    public String filtrerParPrix(@RequestParam Double prix, Model model) {
        List<Salle> salles = salleService.filtrerParPrix(prix);
        model.addAttribute("salles", salles);
        model.addAttribute("filtrePrix", prix);
        return "salles/liste";
    }
}
