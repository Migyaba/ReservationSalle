<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ include file="/WEB-INF/views/layout/header.jsp" %>

            <div class="page-header">
                <c:if test="${salle.id != null}">
                    <h1><i class="bi bi-pencil-square me-2"></i>Modifier la Salle</h1>
                    <p class="subtitle">Modifiez les informations de la salle <strong>${salle.nom}</strong></p>
                </c:if>
                <c:if test="${salle.id == null}">
                    <h1><i class="bi bi-plus-circle me-2"></i>Ajouter une Salle</h1>
                    <p class="subtitle">Enregistrez une nouvelle salle de fête dans le système</p>
                </c:if>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body">
                            <c:if test="${salle.id != null}">
                                <form action="/salles/${salle.id}" method="post">
                            </c:if>
                            <c:if test="${salle.id == null}">
                                <form action="/salles" method="post">
                            </c:if>
                            <div class="mb-3">
                                <label for="nom" class="form-label"><i class="bi bi-tag me-1"></i>Nom *</label>
                                <input type="text" class="form-control" id="nom" name="nom" value="${salle.nom}"
                                    placeholder="Ex: Salle des Fêtes Royale" required>
                            </div>
                            <div class="mb-3">
                                <label for="adresse" class="form-label"><i class="bi bi-geo-alt me-1"></i>Adresse
                                    *</label>
                                <input type="text" class="form-control" id="adresse" name="adresse"
                                    value="${salle.adresse}" placeholder="Ex: 123 Rue de la Paix, Cotonou" required>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="capacite" class="form-label"><i
                                                class="bi bi-people me-1"></i>Capacité (personnes) *</label>
                                        <input type="number" class="form-control" id="capacite" name="capacite"
                                            value="${salle.capacite}" min="1" placeholder="Ex: 200" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="prixParJour" class="form-label"><i
                                                class="bi bi-currency-euro me-1"></i>Prix par jour (€) *</label>
                                        <input type="number" class="form-control" id="prixParJour" name="prixParJour"
                                            value="${salle.prixParJour}" step="0.01" min="0" placeholder="Ex: 500.00"
                                            required>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-4">
                                <label for="description" class="form-label"><i
                                        class="bi bi-card-text me-1"></i>Description</label>
                                <textarea class="form-control" id="description" name="description" rows="4"
                                    placeholder="Décrivez la salle, ses équipements, son ambiance...">${salle.description}</textarea>
                            </div>
                            <div class="d-flex gap-2 flex-wrap">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check-lg"></i> Enregistrer
                                </button>
                                <a href="/salles" class="btn btn-secondary">
                                    <i class="bi bi-arrow-left"></i> Annuler
                                </a>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="/WEB-INF/views/layout/footer.jsp" %>