package com.reservationsalles.repository;

import com.reservationsalles.model.Salle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface SalleRepository extends JpaRepository<Salle, Long> {
    // JpaRepository fournit automatiquement: save, findAll, findById, delete, etc.
    
    // Méthodes personnalisées (Spring génère automatiquement les requêtes!)
    List<Salle> findByNomContainingIgnoreCase(String nom);
    List<Salle> findByCapaciteGreaterThanEqual(Integer capacite);
    List<Salle> findByPrixParJourLessThanEqual(Double prix);
}