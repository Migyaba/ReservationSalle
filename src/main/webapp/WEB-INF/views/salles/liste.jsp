<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ include file="/WEB-INF/views/layout/header.jsp" %>

            <div class="page-header">
                <h1><i class="bi bi-door-open me-2"></i>Liste des Salles</h1>
                <p class="subtitle">Gérez toutes les salles de fête disponibles</p>
            </div>

            <div class="action-bar">
                <a href="/salles/ajouter" class="btn btn-success">
                    <i class="bi bi-plus-circle"></i> Ajouter une Salle
                </a>
            </div>

            <c:if test="${not empty recherche}">
                <div class="alert alert-info alert-custom">
                    <i class="bi bi-search"></i>
                    Résultats de recherche pour : <strong>${recherche}</strong>
                    <a href="/salles" class="btn btn-sm btn-outline-secondary ms-auto">
                        <i class="bi bi-x-lg"></i> Réinitialiser
                    </a>
                </div>
            </c:if>

            <c:if test="${empty salles}">
                <div class="alert alert-warning alert-custom">
                    <i class="bi bi-exclamation-triangle"></i>
                    Aucune salle trouvée. Veuillez en ajouter une.
                </div>
            </c:if>

            <c:if test="${not empty salles}">
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th><i class="bi bi-hash me-1"></i>ID</th>
                                    <th><i class="bi bi-tag me-1"></i>Nom</th>
                                    <th><i class="bi bi-geo-alt me-1"></i>Adresse</th>
                                    <th><i class="bi bi-people me-1"></i>Capacité</th>
                                    <th><i class="bi bi-currency-euro me-1"></i>Prix/Jour</th>
                                    <th><i class="bi bi-gear me-1"></i>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="salle" items="${salles}">
                                    <tr>
                                        <td><strong>#${salle.id}</strong></td>
                                        <td style="color: var(--text-primary); font-weight: 600;">${salle.nom}</td>
                                        <td>${salle.adresse}</td>
                                        <td>
                                            <span class="stat-badge badge-capacity">
                                                <i class="bi bi-people-fill"></i> ${salle.capacite}
                                            </span>
                                        </td>
                                        <td>
                                            <span class="stat-badge badge-price">
                                                <i class="bi bi-coin"></i> ${salle.prixParJour}&euro;
                                            </span>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-sm btn-info btn-space" title="Voir"
                                                onclick="showViewModal('${salle.id}','${salle.nom}','${salle.adresse}','${salle.capacite}','${salle.prixParJour}','${salle.description}')">
                                                <i class="bi bi-eye"></i>
                                            </button>
                                            <button type="button" class="btn btn-sm btn-warning btn-space"
                                                title="Modifier"
                                                onclick="showEditModal('${salle.id}','${salle.nom}','${salle.adresse}','${salle.capacite}','${salle.prixParJour}','${salle.description}')">
                                                <i class="bi bi-pencil"></i>
                                            </button>
                                            <button type="button" class="btn btn-sm btn-danger btn-space"
                                                title="Supprimer"
                                                onclick="showDeleteModal('${salle.id}','${salle.nom}')">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:if>

            <!-- ========== MODAL VOIR ========== -->
            <div class="modal fade" id="viewModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content"
                        style="background: var(--bg-body); border: 1px solid var(--border-color); border-radius: var(--radius-lg);">
                        <div class="modal-header"
                            style="border-bottom: 1px solid var(--border-color); padding: 1.2rem 1.5rem;">
                            <h5 class="modal-title" style="font-weight: 700; color: var(--text-primary);">
                                <i class="bi bi-door-open me-2" style="color: var(--primary-light);"></i>
                                <span id="viewTitle"></span>
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                aria-label="Fermer"></button>
                        </div>
                        <div class="modal-body" style="padding: 1.5rem;">
                            <div class="detail-grid" style="grid-template-columns: 1fr 1fr;">
                                <div class="detail-item">
                                    <div class="label">ID</div>
                                    <div class="value" id="viewId"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Nom</div>
                                    <div class="value" id="viewNom"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Adresse</div>
                                    <div class="value" id="viewAdresse"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Capacité</div>
                                    <div class="value" id="viewCapacite"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Prix / Jour</div>
                                    <div class="value" id="viewPrix"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Description</div>
                                    <div class="value" id="viewDesc" style="font-weight: 400; font-size: 0.92rem;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer"
                            style="border-top: 1px solid var(--border-color); padding: 1rem 1.5rem;">
                            <a id="viewReservationsLink" href="#" class="btn btn-info btn-sm">
                                <i class="bi bi-calendar-check"></i> Réservations
                            </a>
                            <button type="button" class="btn btn-secondary btn-sm"
                                data-bs-dismiss="modal">Fermer</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ========== MODAL MODIFIER ========== -->
            <div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content"
                        style="background: var(--bg-body); border: 1px solid var(--border-color); border-radius: var(--radius-lg);">
                        <div class="modal-header"
                            style="border-bottom: 1px solid var(--border-color); padding: 1.2rem 1.5rem;">
                            <h5 class="modal-title" style="font-weight: 700; color: var(--text-primary);">
                                <i class="bi bi-pencil-square me-2" style="color: var(--warning);"></i>
                                Modifier la Salle
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                aria-label="Fermer"></button>
                        </div>
                        <form id="editForm" method="post">
                            <div class="modal-body" style="padding: 1.5rem;">
                                <div class="mb-3">
                                    <label for="editNom" class="form-label"><i class="bi bi-tag me-1"></i>Nom *</label>
                                    <input type="text" class="form-control" id="editNom" name="nom" required>
                                </div>
                                <div class="mb-3">
                                    <label for="editAdresse" class="form-label"><i
                                            class="bi bi-geo-alt me-1"></i>Adresse *</label>
                                    <input type="text" class="form-control" id="editAdresse" name="adresse" required>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="editCapacite" class="form-label"><i
                                                    class="bi bi-people me-1"></i>Capacité *</label>
                                            <input type="number" class="form-control" id="editCapacite" name="capacite"
                                                min="1" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="editPrix" class="form-label"><i
                                                    class="bi bi-currency-euro me-1"></i>Prix/Jour (€) *</label>
                                            <input type="number" class="form-control" id="editPrix" name="prixParJour"
                                                step="0.01" min="0" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="editDescription" class="form-label"><i
                                            class="bi bi-card-text me-1"></i>Description</label>
                                    <textarea class="form-control" id="editDescription" name="description"
                                        rows="3"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer"
                                style="border-top: 1px solid var(--border-color); padding: 1rem 1.5rem;">
                                <button type="button" class="btn btn-secondary btn-sm"
                                    data-bs-dismiss="modal">Annuler</button>
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="bi bi-check-lg"></i> Enregistrer
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- ========== MODAL SUPPRIMER ========== -->
            <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content"
                        style="background: var(--bg-body); border: 1px solid var(--border-color); border-radius: var(--radius-lg);">
                        <div class="modal-header"
                            style="border-bottom: 1px solid var(--border-color); padding: 1.2rem 1.5rem;">
                            <h5 class="modal-title" style="font-weight: 700; color: var(--danger);">
                                <i class="bi bi-exclamation-triangle me-2"></i>Supprimer
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                aria-label="Fermer"></button>
                        </div>
                        <div class="modal-body text-center" style="padding: 1.5rem;">
                            <div
                                style="width:60px;height:60px;border-radius:50%;background:rgba(225,112,85,0.15);display:inline-flex;align-items:center;justify-content:center;margin-bottom:1rem;">
                                <i class="bi bi-trash" style="font-size:1.5rem;color:var(--danger);"></i>
                            </div>
                            <p style="color: var(--text-secondary); font-size: 0.95rem;">
                                Voulez-vous vraiment supprimer la salle<br><strong id="deleteNom"
                                    style="color:var(--text-primary);"></strong> ?
                            </p>
                            <p style="font-size: 0.82rem; color: var(--text-muted);">Cette action est irréversible.</p>
                        </div>
                        <div class="modal-footer justify-content-center"
                            style="border-top: 1px solid var(--border-color); padding: 1rem 1.5rem;">
                            <button type="button" class="btn btn-secondary btn-sm"
                                data-bs-dismiss="modal">Annuler</button>
                            <a id="deleteLink" href="#" class="btn btn-danger btn-sm">
                                <i class="bi bi-trash"></i> Supprimer
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function showViewModal(id, nom, adresse, capacite, prix, desc) {
                    document.getElementById('viewTitle').textContent = nom;
                    document.getElementById('viewId').textContent = '#' + id;
                    document.getElementById('viewNom').textContent = nom;
                    document.getElementById('viewAdresse').textContent = adresse;
                    document.getElementById('viewCapacite').textContent = capacite + ' personnes';
                    document.getElementById('viewPrix').textContent = prix + '€';
                    document.getElementById('viewDesc').textContent = desc || 'Aucune description';
                    document.getElementById('viewReservationsLink').href = '/reservations/salle/' + id;
                    new bootstrap.Modal(document.getElementById('viewModal')).show();
                }

                function showEditModal(id, nom, adresse, capacite, prix, desc) {
                    document.getElementById('editForm').action = '/salles/' + id;
                    document.getElementById('editNom').value = nom;
                    document.getElementById('editAdresse').value = adresse;
                    document.getElementById('editCapacite').value = capacite;
                    document.getElementById('editPrix').value = prix;
                    document.getElementById('editDescription').value = desc || '';
                    new bootstrap.Modal(document.getElementById('editModal')).show();
                }

                function showDeleteModal(id, nom) {
                    document.getElementById('deleteNom').textContent = nom;
                    document.getElementById('deleteLink').href = '/salles/' + id + '/supprimer';
                    new bootstrap.Modal(document.getElementById('deleteModal')).show();
                }
            </script>

            <%@ include file="/WEB-INF/views/layout/footer.jsp" %>