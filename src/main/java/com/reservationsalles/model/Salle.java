package com.reservationsalles.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.util.List;

@Entity
@Table(name = "salles")
public class Salle {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank(message = "Le nom est obligatoire")
    @Column(nullable = false)
    private String nom;
    
    @NotBlank(message = "L'adresse est obligatoire")
    @Column(nullable = false)
    private String adresse;
    
    @Min(value = 1, message = "La capacité doit être au moins 1")
    @Column(nullable = false)
    private Integer capacite;
    
    @DecimalMin(value = "0.0", message = "Le prix doit être positif")
    @Column(nullable = false)
    private Double prixParJour;
    
    @Column(length = 1000)
    private String description;
    
    // Relation One-to-Many avec Reservation
    @OneToMany(mappedBy = "salle", cascade = CascadeType.ALL)
    private List<Reservation> reservations;
    
    // Constructeurs
    public Salle() {}
    
    public Salle(String nom, String adresse, Integer capacite, Double prixParJour) {
        this.nom = nom;
        this.adresse = adresse;
        this.capacite = capacite;
        this.prixParJour = prixParJour;
    }
    
    // Getters et Setters (comme @property en Python)
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getNom() {
        return nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public String getAdresse() {
        return adresse;
    }
    
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }
    
    public Integer getCapacite() {
        return capacite;
    }
    
    public void setCapacite(Integer capacite) {
        this.capacite = capacite;
    }
    
    public Double getPrixParJour() {
        return prixParJour;
    }
    
    public void setPrixParJour(Double prixParJour) {
        this.prixParJour = prixParJour;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public List<Reservation> getReservations() {
        return reservations;
    }
    
    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }
}