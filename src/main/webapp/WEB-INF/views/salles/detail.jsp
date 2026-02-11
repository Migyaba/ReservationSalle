<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ include file="/WEB-INF/views/layout/header.jsp" %>

            <div class="page-header">
                <h1><i class="bi bi-door-open me-2"></i>${salle.nom}</h1>
                <p class="subtitle">Détails complets de la salle</p>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-header">
                            <h5 class="mb-0"><i class="bi bi-info-circle me-2"></i>Informations de la Salle</h5>
                        </div>
                        <div class="card-body">
                            <div class="detail-grid">
                                <div class="detail-item">
                                    <div class="label">ID</div>
                                    <div class="value">#${salle.id}</div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Nom</div>
                                    <div class="value">${salle.nom}</div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Adresse</div>
                                    <div class="value">${salle.adresse}</div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Capacité</div>
                                    <div class="value">
                                        <span class="stat-badge badge-capacity">
                                            <i class="bi bi-people-fill"></i> ${salle.capacite} personnes
                                        </span>
                                    </div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Prix par jour</div>
                                    <div class="value">
                                        <span class="stat-badge badge-price">
                                            <i class="bi bi-coin"></i> ${salle.prixParJour}€
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${not empty salle.description}">
                                <div class="detail-item mt-3">
                                    <div class="label">Description</div>
                                    <div class="value" style="font-weight: 400; font-size: 0.95rem; line-height: 1.7;">
                                        ${salle.description}</div>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <div class="d-flex gap-2 flex-wrap">
                        <a href="/salles/${salle.id}/modifier" class="btn btn-warning">
                            <i class="bi bi-pencil"></i> Modifier
                        </a>
                        <a href="/salles/${salle.id}/supprimer" class="btn btn-danger"
                            onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette salle ?')">
                            <i class="bi bi-trash"></i> Supprimer
                        </a>
                        <a href="/reservations/salle/${salle.id}" class="btn btn-info">
                            <i class="bi bi-calendar-check"></i> Voir les réservations
                        </a>
                        <a href="/salles" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> Retour à la liste
                        </a>
                    </div>
                </div>
            </div>

            <%@ include file="/WEB-INF/views/layout/footer.jsp" %>