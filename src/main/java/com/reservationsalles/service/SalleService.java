package com.reservationsalles.service;

import com.reservationsalles.model.Salle;
import com.reservationsalles.repository.SalleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class SalleService {
    
    @Autowired
    private SalleRepository salleRepository;
    
    // Ajouter une salle
    public Salle ajouterSalle(Salle salle) {
        return salleRepository.save(salle);
    }
    
    // Récupérer toutes les salles
    public List<Salle> obtenirToutes() {
        return salleRepository.findAll();
    }
    
    // Récupérer une salle par ID
    public Optional<Salle> obtenirParId(Long id) {
        return salleRepository.findById(id);
    }
    
    // Mettre à jour une salle
    public Salle mettreAJourSalle(Long id, Salle salleMAJ) {
        Optional<Salle> salle = salleRepository.findById(id);
        if (salle.isPresent()) {
            Salle s = salle.get();
            if (salleMAJ.getNom() != null) s.setNom(salleMAJ.getNom());
            if (salleMAJ.getAdresse() != null) s.setAdresse(salleMAJ.getAdresse());
            if (salleMAJ.getCapacite() != null) s.setCapacite(salleMAJ.getCapacite());
            if (salleMAJ.getPrixParJour() != null) s.setPrixParJour(salleMAJ.getPrixParJour());
            if (salleMAJ.getDescription() != null) s.setDescription(salleMAJ.getDescription());
            return salleRepository.save(s);
        }
        return null;
    }
    
    // Supprimer une salle
    public boolean supprimerSalle(Long id) {
        if (salleRepository.existsById(id)) {
            salleRepository.deleteById(id);
            return true;
        }
        return false;
    }
    
    // Rechercher par nom
    public List<Salle> rechercherParNom(String nom) {
        return salleRepository.findByNomContainingIgnoreCase(nom);
    }
    
    // Filtrer par capacité minimale
    public List<Salle> filtrerParCapacite(Integer capaciteMin) {
        return salleRepository.findByCapaciteGreaterThanEqual(capaciteMin);
    }
    
    // Filtrer par prix maximal
    public List<Salle> filtrerParPrix(Double prixMax) {
        return salleRepository.findByPrixParJourLessThanEqual(prixMax);
    }
}
