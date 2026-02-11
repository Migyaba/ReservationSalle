package com.reservationsalles.controller;

import com.reservationsalles.model.Utilisateur;
import com.reservationsalles.service.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/utilisateurs")
public class UtilisateurController {

    @Autowired
    private UtilisateurService utilisateurService;

    // Afficher la liste de tous les utilisateurs
    @GetMapping
    public String listerUtilisateurs(Model model) {
        List<Utilisateur> utilisateurs = utilisateurService.obtenirTous();
        model.addAttribute("utilisateurs", utilisateurs);
        return "utilisateurs/liste";
    }

    // Afficher le formulaire d'enregistrement
    @GetMapping("/enregistrer")
    public String afficherFormulaireEnregistrement(Model model) {
        model.addAttribute("utilisateur", new Utilisateur());
        return "utilisateurs/formulaire";
    }

    // Enregistrer un nouvel utilisateur
    @PostMapping
    public String enregistrerUtilisateur(@ModelAttribute Utilisateur utilisateur, Model model) {
        try {
            utilisateurService.enregistrerUtilisateur(utilisateur);
            return "redirect:/utilisateurs";
        } catch (IllegalArgumentException e) {
            model.addAttribute("erreur", e.getMessage());
            model.addAttribute("utilisateur", utilisateur);
            return "utilisateurs/formulaire";
        }
    }

    // Afficher les détails d'un utilisateur
    @GetMapping("/{id}")
    public String afficherUtilisateur(@PathVariable("id") Long id, Model model) {
        Optional<Utilisateur> utilisateur = utilisateurService.obtenirParId(id);
        if (utilisateur.isPresent()) {
            model.addAttribute("utilisateur", utilisateur.get());
            return "utilisateurs/detail";
        }
        return "redirect:/utilisateurs";
    }

    // Afficher le formulaire de modification
    @GetMapping("/{id}/modifier")
    public String afficherFormulaireModification(@PathVariable("id") Long id, Model model) {
        Optional<Utilisateur> utilisateur = utilisateurService.obtenirParId(id);
        if (utilisateur.isPresent()) {
            model.addAttribute("utilisateur", utilisateur.get());
            return "utilisateurs/formulaire";
        }
        return "redirect:/utilisateurs";
    }

    // Mettre à jour un utilisateur
    @PostMapping("/{id}")
    public String mettreAJourUtilisateur(@PathVariable("id") Long id, @ModelAttribute Utilisateur utilisateur) {
        Utilisateur updated = utilisateurService.mettreAJourUtilisateur(id, utilisateur);
        if (updated != null) {
            return "redirect:/utilisateurs/" + id;
        }
        return "redirect:/utilisateurs";
    }

    // Supprimer un utilisateur
    @GetMapping("/{id}/supprimer")
    public String supprimerUtilisateur(@PathVariable("id") Long id) {
        utilisateurService.supprimerUtilisateur(id);
        return "redirect:/utilisateurs";
    }
}
