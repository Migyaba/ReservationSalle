package com.reservationsalles.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.time.LocalDate;

@Entity
@Table(name = "reservations")
public class Reservation {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotNull(message = "La date de début est obligatoire")
    @Column(nullable = false)
    private LocalDate dateDebut;
    
    @NotNull(message = "La date de fin est obligatoire")
    @Column(nullable = false)
    private LocalDate dateFin;
    
    @NotBlank(message = "Le type d'événement est obligatoire")
    @Column(nullable = false)
    private String typeEvenement;
    
    @Min(value = 1, message = "Le nombre d'invités doit être au moins 1")
    @Column(nullable = false)
    private Integer nombreInvites;
    
    @Column(length = 1000)
    private String commentaires;
    
    // Relations Many-to-One
    @ManyToOne
    @JoinColumn(name = "salle_id", nullable = false)
    private Salle salle;
    
    @ManyToOne
    @JoinColumn(name = "utilisateur_id", nullable = false)
    private Utilisateur utilisateur;
    
    // Constructeurs
    public Reservation() {}
    
    public Reservation(LocalDate dateDebut, LocalDate dateFin, String typeEvenement, 
                       Integer nombreInvites, Salle salle, Utilisateur utilisateur) {
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.typeEvenement = typeEvenement;
        this.nombreInvites = nombreInvites;
        this.salle = salle;
        this.utilisateur = utilisateur;
    }
    
    // Getters et Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public LocalDate getDateDebut() {
        return dateDebut;
    }
    
    public void setDateDebut(LocalDate dateDebut) {
        this.dateDebut = dateDebut;
    }
    
    public LocalDate getDateFin() {
        return dateFin;
    }
    
    public void setDateFin(LocalDate dateFin) {
        this.dateFin = dateFin;
    }
    
    public String getTypeEvenement() {
        return typeEvenement;
    }
    
    public void setTypeEvenement(String typeEvenement) {
        this.typeEvenement = typeEvenement;
    }
    
    public Integer getNombreInvites() {
        return nombreInvites;
    }
    
    public void setNombreInvites(Integer nombreInvites) {
        this.nombreInvites = nombreInvites;
    }
    
    public String getCommentaires() {
        return commentaires;
    }
    
    public void setCommentaires(String commentaires) {
        this.commentaires = commentaires;
    }
    
    public Salle getSalle() {
        return salle;
    }
    
    public void setSalle(Salle salle) {
        this.salle = salle;
    }
    
    public Utilisateur getUtilisateur() {
        return utilisateur;
    }
    
    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }
}