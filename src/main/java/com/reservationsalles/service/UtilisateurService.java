package com.reservationsalles.service;

import com.reservationsalles.model.Utilisateur;
import com.reservationsalles.repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class UtilisateurService {
    
    @Autowired
    private UtilisateurRepository utilisateurRepository;
    
    // Enregistrer un nouvel utilisateur
    public Utilisateur enregistrerUtilisateur(Utilisateur utilisateur) {
        // Vérifier que l'email n'existe pas déjà
        if (utilisateurRepository.existsByEmail(utilisateur.getEmail())) {
            throw new IllegalArgumentException("Un utilisateur avec cet email existe déjà");
        }
        return utilisateurRepository.save(utilisateur);
    }
    
    // Récupérer tous les utilisateurs
    public List<Utilisateur> obtenirTous() {
        return utilisateurRepository.findAll();
    }
    
    // Récupérer un utilisateur par ID
    public Optional<Utilisateur> obtenirParId(Long id) {
        return utilisateurRepository.findById(id);
    }
    
    // Récupérer un utilisateur par email
    public Optional<Utilisateur> obtenirParEmail(String email) {
        return utilisateurRepository.findByEmail(email);
    }
    
    // Mettre à jour un utilisateur
    public Utilisateur mettreAJourUtilisateur(Long id, Utilisateur utilisateurMAJ) {
        Optional<Utilisateur> utilisateur = utilisateurRepository.findById(id);
        if (utilisateur.isPresent()) {
            Utilisateur u = utilisateur.get();
            if (utilisateurMAJ.getNom() != null) u.setNom(utilisateurMAJ.getNom());
            if (utilisateurMAJ.getPrenom() != null) u.setPrenom(utilisateurMAJ.getPrenom());
            if (utilisateurMAJ.getTelephone() != null) u.setTelephone(utilisateurMAJ.getTelephone());
            // L'email ne peut pas être modifié (unique)
            return utilisateurRepository.save(u);
        }
        return null;
    }
    
    // Supprimer un utilisateur
    public boolean supprimerUtilisateur(Long id) {
        if (utilisateurRepository.existsById(id)) {
            utilisateurRepository.deleteById(id);
            return true;
        }
        return false;
    }
    
    // Vérifier si un email existe
    public boolean emailExiste(String email) {
        return utilisateurRepository.existsByEmail(email);
    }
}
