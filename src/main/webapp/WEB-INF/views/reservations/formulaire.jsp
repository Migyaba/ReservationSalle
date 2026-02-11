<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ include file="/WEB-INF/views/layout/header.jsp" %>

            <div class="page-header">
                <c:if test="${reservation.id != null}">
                    <h1><i class="bi bi-pencil-square me-2"></i>Modifier la Réservation</h1>
                    <p class="subtitle">Modifiez les détails de la réservation #${reservation.id}</p>
                </c:if>
                <c:if test="${reservation.id == null}">
                    <h1><i class="bi bi-calendar-plus me-2"></i>Créer une Réservation</h1>
                    <p class="subtitle">Réservez une salle pour votre événement</p>
                </c:if>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <c:if test="${not empty erreur}">
                        <div class="alert alert-danger alert-custom">
                            <i class="bi bi-exclamation-octagon"></i>
                            <strong>Erreur :</strong> ${erreur}
                        </div>
                    </c:if>

                    <div class="card">
                        <div class="card-body">
                            <c:if test="${reservation.id != null}">
                                <form action="/reservations/${reservation.id}" method="post">
                            </c:if>
                            <c:if test="${reservation.id == null}">
                                <form action="/reservations" method="post">
                            </c:if>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="salle" class="form-label"><i class="bi bi-door-open me-1"></i>Salle
                                            *</label>
                                        <select class="form-control" id="salle" name="salle.id" required>
                                            <option value="">-- Sélectionnez une salle --</option>
                                            <c:forEach var="salle" items="${salles}">
                                                <option value="${salle.id}" <c:if
                                                    test="${reservation.salle.id == salle.id}">selected</c:if>>
                                                    ${salle.nom} (${salle.capacite} pers., ${salle.prixParJour}€)
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="utilisateur" class="form-label"><i
                                                class="bi bi-person me-1"></i>Utilisateur *</label>
                                        <select class="form-control" id="utilisateur" name="utilisateur.id" required>
                                            <option value="">-- Sélectionnez un utilisateur --</option>
                                            <c:forEach var="utilisateur" items="${utilisateurs}">
                                                <option value="${utilisateur.id}" <c:if
                                                    test="${reservation.utilisateur.id == utilisateur.id}">selected
                                                    </c:if>>
                                                    ${utilisateur.nomComplet} (${utilisateur.email})
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="dateDebut" class="form-label"><i
                                                class="bi bi-calendar-event me-1"></i>Date Début *</label>
                                        <input type="date" class="form-control" id="dateDebut" name="dateDebut"
                                            value="${reservation.dateDebut}" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="dateFin" class="form-label"><i
                                                class="bi bi-calendar-x me-1"></i>Date Fin *</label>
                                        <input type="date" class="form-control" id="dateFin" name="dateFin"
                                            value="${reservation.dateFin}" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="typeEvenement" class="form-label"><i
                                                class="bi bi-stars me-1"></i>Type d'Événement *</label>
                                        <input type="text" class="form-control" id="typeEvenement" name="typeEvenement"
                                            value="${reservation.typeEvenement}"
                                            placeholder="Ex: Mariage, Anniversaire, Conférence" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="nombreInvites" class="form-label"><i
                                                class="bi bi-people me-1"></i>Nombre d'Invités *</label>
                                        <input type="number" class="form-control" id="nombreInvites"
                                            name="nombreInvites" value="${reservation.nombreInvites}" min="1"
                                            placeholder="Ex: 100" required>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label for="commentaires" class="form-label"><i
                                        class="bi bi-chat-dots me-1"></i>Commentaires</label>
                                <textarea class="form-control" id="commentaires" name="commentaires" rows="3"
                                    placeholder="Ajoutez des détails supplémentaires sur votre événement...">${reservation.commentaires}</textarea>
                            </div>

                            <div class="d-flex gap-2 flex-wrap">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check-lg"></i> Enregistrer la Réservation
                                </button>
                                <a href="/reservations" class="btn btn-secondary">
                                    <i class="bi bi-arrow-left"></i> Annuler
                                </a>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="/WEB-INF/views/layout/footer.jsp" %>