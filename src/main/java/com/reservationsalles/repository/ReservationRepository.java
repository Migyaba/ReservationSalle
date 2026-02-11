package com.reservationsalles.repository;

import com.reservationsalles.model.Reservation;
import com.reservationsalles.model.Salle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    
    List<Reservation> findByUtilisateurId(Long utilisateurId);
    List<Reservation> findBySalleId(Long salleId);
    
    // Vérifier si une salle est disponible pour une période donnée
    @Query("SELECT COUNT(r) FROM Reservation r WHERE r.salle = :salle " +
           "AND ((r.dateDebut <= :dateFin AND r.dateFin >= :dateDebut))")
    Long countConflictingReservations(@Param("salle") Salle salle, 
                                       @Param("dateDebut") LocalDate dateDebut,
                                       @Param("dateFin") LocalDate dateFin);
}