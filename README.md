# Système de Réservation de Salles - RéservaSalle

Une application web moderne et robuste pour la gestion simplifiée des espaces de réunion et de fête.

## Binôme
- **Membre 1 :** DEKAKPOEVOU Missetcho Miguel (SI)
- **Membre 2 :** ATCHE Finagnon Déo-Gratias (SIRI)

---

## Présentation du projet
**RéservaSalle** est une plateforme intuitive conçue pour centraliser la gestion des salles et des réservations au sein d'une organisation. Développée avec le framework **Spring Boot**, elle offre une interface fluide et sécurisée pour éviter les doubles réservations et optimiser l'occupation des espaces.

## Fonctionnalités clés
*   **Gestion des Salles** : Catalogue complet avec descriptifs, capacité et tarifs.
*   **Annuaire Utilisateurs** : Gestion des membres autorisés à réserver.
*   **Réservations Intelligentes** : Création de réservations avec **vérification automatique des conflits** de planning.
*   **Vues Filtrées** : Consultation des réservations par utilisateur ou par salle spécifique.
*   **Design Responsive** : Interface "Glassmorphism" moderne, entièrement compatible mobile grâce à Bootstrap 5.

## Stack Technique
*   **Backend** : Java 17, Spring Boot 4.0.2, Spring Data JPA (Hibernate).
*   **Frontend** : JSP (JavaServer Pages), JSTL, Bootstrap 5.
*   **Base de données** : PostgreSQL.
*   **Sécurité & Validation** : Jakarta Bean Validation.

## Architecture du Projet
Le projet suit le pattern **MVC** (Modèle-Vue-Contrôleur) avec une séparation stricte des responsabilités :
*   `com.reservationsalles.model` : Entités métier (Salle, Utilisateur, Réservation).
*   `com.reservationsalles.controller` : Gestion des requêtes HTTP et routage.
*   `com.reservationsalles.service` : Logique métier (calcul de disponibilité, gestion des conflits).
*   `com.reservationsalles.repository` : Couche d'accès aux données (interfaces JPA).
*   `src/main/webapp/WEB-INF/views` : Templates de rendu JSP.

---

## Instructions de lancement

### 1. Prérequis
- Java 17 ou supérieur.
- PostgreSQL installé.
- Maven (inclus via `./mvnw`).

### 2. Configuration de la base de données
1.  Créez une base de données nommée `reservation_salles` dans PostgreSQL.
2.  L'application est configurée pour créer/mettre à jour les tables automatiquement (`hibernate.ddl-auto=update`).
3.  Vérifiez vos identifiants dans `src/main/resources/application.properties`.

### 3. Démarrage
Exécutez la commande suivante à la racine :
```bash
./mvnw spring-boot:run
```
L'application est accessible à : **[http://localhost:8081](http://localhost:8081)**

---
