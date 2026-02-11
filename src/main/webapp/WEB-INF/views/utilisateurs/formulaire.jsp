<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ include file="/WEB-INF/views/layout/header.jsp" %>

            <div class="page-header">
                <c:if test="${utilisateur.id != null}">
                    <h1><i class="bi bi-pencil-square me-2"></i>Modifier l'Utilisateur</h1>
                    <p class="subtitle">Mettez à jour les informations de <strong>${utilisateur.prenom}
                            ${utilisateur.nom}</strong></p>
                </c:if>
                <c:if test="${utilisateur.id == null}">
                    <h1><i class="bi bi-person-plus me-2"></i>Enregistrer un Utilisateur</h1>
                    <p class="subtitle">Ajoutez un nouvel utilisateur au système</p>
                </c:if>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <c:if test="${not empty erreur}">
                        <div class="alert alert-danger alert-custom">
                            <i class="bi bi-exclamation-octagon"></i>
                            ${erreur}
                        </div>
                    </c:if>

                    <div class="card">
                        <div class="card-body">
                            <c:if test="${utilisateur.id != null}">
                                <form action="/utilisateurs/${utilisateur.id}" method="post">
                            </c:if>
                            <c:if test="${utilisateur.id == null}">
                                <form action="/utilisateurs" method="post">
                            </c:if>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="nom" class="form-label"><i class="bi bi-person me-1"></i>Nom
                                            *</label>
                                        <input type="text" class="form-control" id="nom" name="nom"
                                            value="${utilisateur.nom}" placeholder="Ex: Dupont" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="prenom" class="form-label"><i
                                                class="bi bi-person-badge me-1"></i>Prénom *</label>
                                        <input type="text" class="form-control" id="prenom" name="prenom"
                                            value="${utilisateur.prenom}" placeholder="Ex: Jean" required>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label"><i class="bi bi-envelope me-1"></i>Email *</label>
                                <input type="email" class="form-control" id="email" name="email"
                                    value="${utilisateur.email}" placeholder="Ex: jean.dupont@email.com" <c:if
                                    test="${utilisateur.id == null}">required</c:if>>
                            </div>
                            <div class="mb-4">
                                <label for="telephone" class="form-label"><i class="bi bi-telephone me-1"></i>Téléphone
                                    *</label>
                                <input type="text" class="form-control" id="telephone" name="telephone"
                                    value="${utilisateur.telephone}" placeholder="Ex: +229 97 00 00 00" required>
                            </div>
                            <div class="d-flex gap-2 flex-wrap">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check-lg"></i> Enregistrer
                                </button>
                                <a href="/utilisateurs" class="btn btn-secondary">
                                    <i class="bi bi-arrow-left"></i> Annuler
                                </a>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="/WEB-INF/views/layout/footer.jsp" %>