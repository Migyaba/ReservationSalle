<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ include file="/WEB-INF/views/layout/header.jsp" %>

            <div class="page-header">
                <h1><i class="bi bi-person-circle me-2"></i>${utilisateur.nomComplet}</h1>
                <p class="subtitle">Profil de l'utilisateur</p>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-header">
                            <h5 class="mb-0"><i class="bi bi-info-circle me-2"></i>Informations de l'Utilisateur</h5>
                        </div>
                        <div class="card-body">
                            <div class="detail-grid">
                                <div class="detail-item">
                                    <div class="label">ID</div>
                                    <div class="value">#${utilisateur.id}</div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Nom</div>
                                    <div class="value">${utilisateur.nom}</div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Prénom</div>
                                    <div class="value">${utilisateur.prenom}</div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Email</div>
                                    <div class="value" style="color: var(--info);">
                                        <i class="bi bi-envelope-fill me-1"></i>${utilisateur.email}
                                    </div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Téléphone</div>
                                    <div class="value">
                                        <i class="bi bi-telephone-fill me-1"
                                            style="color: var(--success);"></i>${utilisateur.telephone}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex gap-2 flex-wrap">
                        <a href="/utilisateurs/${utilisateur.id}/modifier" class="btn btn-warning">
                            <i class="bi bi-pencil"></i> Modifier
                        </a>
                        <a href="/utilisateurs/${utilisateur.id}/supprimer" class="btn btn-danger"
                            onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet utilisateur ?')">
                            <i class="bi bi-trash"></i> Supprimer
                        </a>
                        <a href="/reservations/utilisateur/${utilisateur.id}" class="btn btn-info">
                            <i class="bi bi-calendar-check"></i> Voir ses réservations
                        </a>
                        <a href="/utilisateurs" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> Retour à la liste
                        </a>
                    </div>
                </div>
            </div>

            <%@ include file="/WEB-INF/views/layout/footer.jsp" %>