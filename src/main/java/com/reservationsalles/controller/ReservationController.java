package com.reservationsalles.controller;

import com.reservationsalles.model.Reservation;
import com.reservationsalles.model.Salle;
import com.reservationsalles.model.Utilisateur;
import com.reservationsalles.service.ReservationService;
import com.reservationsalles.service.SalleService;
import com.reservationsalles.service.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/reservations")
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private SalleService salleService;

    @Autowired
    private UtilisateurService utilisateurService;

    // Afficher la liste de toutes les réservations
    @GetMapping
    public String listerReservations(Model model) {
        List<Reservation> reservations = reservationService.obtenirToutes();
        model.addAttribute("reservations", reservations);
        return "reservations/liste";
    }

    // Afficher le formulaire de réservation
    @GetMapping("/ajouter")
    public String afficherFormulaireAjout(Model model) {
        List<Salle> salles = salleService.obtenirToutes();
        List<Utilisateur> utilisateurs = utilisateurService.obtenirTous();
        model.addAttribute("reservation", new Reservation());
        model.addAttribute("salles", salles);
        model.addAttribute("utilisateurs", utilisateurs);
        return "reservations/formulaire";
    }

    // Créer une réservation
    @PostMapping
    public String creerReservation(@ModelAttribute Reservation reservation, Model model) {
        try {
            // Remplir les objets Salle et Utilisateur complets
            Optional<Salle> salle = salleService.obtenirParId(reservation.getSalle().getId());
            Optional<Utilisateur> utilisateur = utilisateurService.obtenirParId(reservation.getUtilisateur().getId());

            if (salle.isPresent() && utilisateur.isPresent()) {
                reservation.setSalle(salle.get());
                reservation.setUtilisateur(utilisateur.get());
                reservationService.creerReservation(reservation);
                return "redirect:/reservations";
            } else {
                model.addAttribute("erreur", "Salle ou utilisateur invalide");
            }
        } catch (IllegalArgumentException e) {
            model.addAttribute("erreur", e.getMessage());
        }

        // Rechauger les données pour le formulaire
        List<Salle> salles = salleService.obtenirToutes();
        List<Utilisateur> utilisateurs = utilisateurService.obtenirTous();
        model.addAttribute("salles", salles);
        model.addAttribute("utilisateurs", utilisateurs);
        model.addAttribute("reservation", reservation);
        return "reservations/formulaire";
    }

    // Afficher les détails d'une réservation
    @GetMapping("/{id}")
    public String afficherReservation(@PathVariable("id") Long id, Model model) {
        Optional<Reservation> reservation = reservationService.obtenirParId(id);
        if (reservation.isPresent()) {
            model.addAttribute("reservation", reservation.get());
            return "reservations/detail";
        }
        return "redirect:/reservations";
    }

    // Afficher le formulaire de modification
    @GetMapping("/{id}/modifier")
    public String afficherFormulaireModification(@PathVariable("id") Long id, Model model) {
        Optional<Reservation> reservation = reservationService.obtenirParId(id);
        if (reservation.isPresent()) {
            List<Salle> salles = salleService.obtenirToutes();
            List<Utilisateur> utilisateurs = utilisateurService.obtenirTous();
            model.addAttribute("reservation", reservation.get());
            model.addAttribute("salles", salles);
            model.addAttribute("utilisateurs", utilisateurs);
            return "reservations/formulaire";
        }
        return "redirect:/reservations";
    }

    // Mettre à jour une réservation
    @PostMapping("/{id}")
    public String mettreAJourReservation(@PathVariable("id") Long id, @ModelAttribute Reservation reservation,
            Model model) {
        try {
            // Remplir les objets Salle et Utilisateur complets si modifiés
            if (reservation.getSalle() != null && reservation.getSalle().getId() != null) {
                Optional<Salle> salle = salleService.obtenirParId(reservation.getSalle().getId());
                if (salle.isPresent()) {
                    reservation.setSalle(salle.get());
                }
            }
            if (reservation.getUtilisateur() != null && reservation.getUtilisateur().getId() != null) {
                Optional<Utilisateur> utilisateur = utilisateurService
                        .obtenirParId(reservation.getUtilisateur().getId());
                if (utilisateur.isPresent()) {
                    reservation.setUtilisateur(utilisateur.get());
                }
            }

            Reservation updated = reservationService.mettreAJourReservation(id, reservation);
            if (updated != null) {
                return "redirect:/reservations/" + id;
            }
        } catch (IllegalArgumentException e) {
            model.addAttribute("erreur", e.getMessage());
            List<Salle> salles = salleService.obtenirToutes();
            List<Utilisateur> utilisateurs = utilisateurService.obtenirTous();
            model.addAttribute("salles", salles);
            model.addAttribute("utilisateurs", utilisateurs);
            model.addAttribute("reservation", reservation);
            return "reservations/formulaire";
        }

        return "redirect:/reservations";
    }

    // Supprimer une réservation
    @GetMapping("/{id}/supprimer")
    public String supprimerReservation(@PathVariable("id") Long id) {
        reservationService.supprimerReservation(id);
        return "redirect:/reservations";
    }

    // Afficher les réservations d'un utilisateur
    @GetMapping("/utilisateur/{utilisateurId}")
    public String listerReservationsUtilisateur(@PathVariable("utilisateurId") Long utilisateurId, Model model) {
        Optional<Utilisateur> utilisateur = utilisateurService.obtenirParId(utilisateurId);
        if (utilisateur.isPresent()) {
            List<Reservation> reservations = reservationService.obtenirParUtilisateur(utilisateurId);
            model.addAttribute("utilisateur", utilisateur.get());
            model.addAttribute("reservations", reservations);
            return "reservations/listeparutilisateur";
        }
        return "redirect:/utilisateurs";
    }

    // Afficher les réservations d'une salle
    @GetMapping("/salle/{salleId}")
    public String listerReservationsSalle(@PathVariable("salleId") Long salleId, Model model) {
        Optional<Salle> salle = salleService.obtenirParId(salleId);
        if (salle.isPresent()) {
            List<Reservation> reservations = reservationService.obtenirParSalle(salleId);
            model.addAttribute("salle", salle.get());
            model.addAttribute("reservations", reservations);
            return "reservations/listeparsalle";
        }
        return "redirect:/salles";
    }

    // Vérifier la disponibilité d'une salle (JSON pour AJAX)
    @GetMapping("/verifier-disponibilite")
    @ResponseBody
    public boolean verifierDisponibilite(@RequestParam Long salleId,
            @RequestParam String dateDebut,
            @RequestParam String dateFin) {
        LocalDate start = LocalDate.parse(dateDebut);
        LocalDate end = LocalDate.parse(dateFin);
        return reservationService.estDisponible(salleId, start, end);
    }
}
