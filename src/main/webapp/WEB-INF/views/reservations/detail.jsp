<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ include file="/WEB-INF/views/layout/header.jsp" %>

            <div class="page-header">
                <h1><i class="bi bi-calendar-heart me-2"></i>Réservation #${reservation.id}</h1>
                <p class="subtitle">Détails complets de la réservation</p>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-header">
                            <h5 class="mb-0"><i class="bi bi-info-circle me-2"></i>Informations de la Réservation</h5>
                        </div>
                        <div class="card-body">
                            <div class="detail-grid">
                                <div class="detail-item">
                                    <div class="label">ID</div>
                                    <div class="value">#${reservation.id}</div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Salle</div>
                                    <div class="value">
                                        <a href="/salles/${reservation.salle.id}" style="color: var(--primary-light);">
                                            <i class="bi bi-building me-1"></i>${reservation.salle.nom}
                                        </a>
                                    </div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Utilisateur</div>
                                    <div class="value">
                                        <a href="/utilisateurs/${reservation.utilisateur.id}"
                                            style="color: var(--secondary);">
                                            <i class="bi bi-person-fill me-1"></i>${reservation.utilisateur.nomComplet}
                                        </a>
                                    </div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Type d'Événement</div>
                                    <div class="value">
                                        <span class="stat-badge"
                                            style="background: rgba(253,121,168,0.15); color: var(--accent);">
                                            <i class="bi bi-stars"></i> ${reservation.typeEvenement}
                                        </span>
                                    </div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Date Début</div>
                                    <div class="value" style="color: var(--success);">
                                        <i class="bi bi-play-circle-fill me-1"></i>${reservation.dateDebut}
                                    </div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Date Fin</div>
                                    <div class="value" style="color: var(--danger);">
                                        <i class="bi bi-stop-circle-fill me-1"></i>${reservation.dateFin}
                                    </div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Nombre d'Invités</div>
                                    <div class="value">
                                        <span class="stat-badge badge-capacity">
                                            <i class="bi bi-people-fill"></i> ${reservation.nombreInvites} personnes
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${not empty reservation.commentaires}">
                                <div class="detail-item mt-3">
                                    <div class="label">Commentaires</div>
                                    <div class="value" style="font-weight: 400; font-size: 0.95rem; line-height: 1.7;">
                                        ${reservation.commentaires}</div>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <div class="d-flex gap-2 flex-wrap">
                        <a href="/reservations/${reservation.id}/modifier" class="btn btn-warning">
                            <i class="bi bi-pencil"></i> Modifier
                        </a>
                        <a href="/reservations/${reservation.id}/supprimer" class="btn btn-danger"
                            onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette réservation ?')">
                            <i class="bi bi-trash"></i> Supprimer
                        </a>
                        <a href="/reservations" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> Retour à la liste
                        </a>
                    </div>
                </div>
            </div>

            <%@ include file="/WEB-INF/views/layout/footer.jsp" %>