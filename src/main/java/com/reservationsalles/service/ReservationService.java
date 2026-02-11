package com.reservationsalles.service;

import com.reservationsalles.model.Reservation;
import com.reservationsalles.model.Salle;
import com.reservationsalles.model.Utilisateur;
import com.reservationsalles.repository.ReservationRepository;
import com.reservationsalles.repository.SalleRepository;
import com.reservationsalles.repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class ReservationService {
    
    @Autowired
    private ReservationRepository reservationRepository;
    
    @Autowired
    private SalleRepository salleRepository;
    
    @Autowired
    private UtilisateurRepository utilisateurRepository;
    
    // Créer une réservation avec vérification de conflit
    public Reservation creerReservation(Reservation reservation) {
        // Valider que les dates sont correctes
        if (reservation.getDateDebut().isAfter(reservation.getDateFin())) {
            throw new IllegalArgumentException("La date de début doit être avant la date de fin");
        }
        
        // Vérifier que la salle existe
        if (reservation.getSalle() == null || !salleRepository.existsById(reservation.getSalle().getId())) {
            throw new IllegalArgumentException("La salle spécifiée n'existe pas");
        }
        
        // Vérifier que l'utilisateur existe
        if (reservation.getUtilisateur() == null || !utilisateurRepository.existsById(reservation.getUtilisateur().getId())) {
            throw new IllegalArgumentException("L'utilisateur spécifié n'existe pas");
        }
        
        // Vérifier les conflits de réservation
        Long conflits = reservationRepository.countConflictingReservations(
            reservation.getSalle(),
            reservation.getDateDebut(),
            reservation.getDateFin()
        );
        
        if (conflits > 0) {
            throw new IllegalArgumentException("La salle est déjà réservée pour cette période");
        }
        
        return reservationRepository.save(reservation);
    }
    
    // Récupérer toutes les réservations
    public List<Reservation> obtenirToutes() {
        return reservationRepository.findAll();
    }
    
    // Récupérer une réservation par ID
    public Optional<Reservation> obtenirParId(Long id) {
        return reservationRepository.findById(id);
    }
    
    // Récupérer les réservations d'un utilisateur
    public List<Reservation> obtenirParUtilisateur(Long utilisateurId) {
        return reservationRepository.findByUtilisateurId(utilisateurId);
    }
    
    // Récupérer les réservations d'une salle
    public List<Reservation> obtenirParSalle(Long salleId) {
        return reservationRepository.findBySalleId(salleId);
    }
    
    // Mettre à jour une réservation
    public Reservation mettreAJourReservation(Long id, Reservation reservationMAJ) {
        Optional<Reservation> reservation = reservationRepository.findById(id);
        if (reservation.isPresent()) {
            Reservation r = reservation.get();
            
            // Si les dates sont modifiées, vérifier les conflits
            if ((reservationMAJ.getDateDebut() != null && !reservationMAJ.getDateDebut().equals(r.getDateDebut())) ||
                (reservationMAJ.getDateFin() != null && !reservationMAJ.getDateFin().equals(r.getDateFin()))) {
                
                LocalDate newStart = reservationMAJ.getDateDebut() != null ? reservationMAJ.getDateDebut() : r.getDateDebut();
                LocalDate newEnd = reservationMAJ.getDateFin() != null ? reservationMAJ.getDateFin() : r.getDateFin();
                
                if (newStart.isAfter(newEnd)) {
                    throw new IllegalArgumentException("La date de début doit être avant la date de fin");
                }
                
                // Vérifier les conflits (exclure la réservation actuelle)
                Long conflits = reservationRepository.countConflictingReservations(r.getSalle(), newStart, newEnd);
                // Soustraire 1 car la requête compte aussi la réservation actuelle
                if (conflits > 1) {
                    throw new IllegalArgumentException("La salle est déjà réservée pour cette période");
                }
                
                r.setDateDebut(newStart);
                r.setDateFin(newEnd);
            }
            
            if (reservationMAJ.getTypeEvenement() != null) r.setTypeEvenement(reservationMAJ.getTypeEvenement());
            if (reservationMAJ.getNombreInvites() != null) r.setNombreInvites(reservationMAJ.getNombreInvites());
            if (reservationMAJ.getCommentaires() != null) r.setCommentaires(reservationMAJ.getCommentaires());
            
            return reservationRepository.save(r);
        }
        return null;
    }
    
    // Supprimer une réservation
    public boolean supprimerReservation(Long id) {
        if (reservationRepository.existsById(id)) {
            reservationRepository.deleteById(id);
            return true;
        }
        return false;
    }
    
    // Vérifier la disponibilité d'une salle
    public boolean estDisponible(Long salleId, LocalDate dateDebut, LocalDate dateFin) {
        Optional<Salle> salle = salleRepository.findById(salleId);
        if (salle.isEmpty()) {
            return false;
        }
        
        Long conflits = reservationRepository.countConflictingReservations(salle.get(), dateDebut, dateFin);
        return conflits == 0;
    }
}
