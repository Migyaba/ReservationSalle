<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ include file="/WEB-INF/views/layout/header.jsp" %>

            <div class="page-header">
                <h1><i class="bi bi-building me-2"></i>Réservations : ${salle.nom}</h1>
                <p class="subtitle">Historique des réservations pour cette salle</p>
            </div>

            <div class="action-bar">
                <a href="/salles" class="btn btn-secondary me-2">
                    <i class="bi bi-arrow-left"></i> Retour aux Salles
                </a>
                <a href="/reservations/ajouter" class="btn btn-success">
                    <i class="bi bi-calendar-plus"></i> Nouvelle Réservation
                </a>
            </div>

            <c:if test="${empty reservations}">
                <div class="alert alert-info alert-custom">
                    <i class="bi bi-info-circle"></i>
                    Aucune réservation trouvée pour la salle <strong>${salle.nom}</strong>.
                </div>
            </c:if>

            <c:if test="${not empty reservations}">
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th><i class="bi bi-hash me-1"></i>ID</th>
                                    <th><i class="bi bi-person me-1"></i>Utilisateur</th>
                                    <th><i class="bi bi-calendar-event me-1"></i>Début</th>
                                    <th><i class="bi bi-calendar-x me-1"></i>Fin</th>
                                    <th><i class="bi bi-stars me-1"></i>Type</th>
                                    <th><i class="bi bi-gear me-1"></i>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="reservation" items="${reservations}">
                                    <tr>
                                        <td><strong>#${reservation.id}</strong></td>
                                        <td style="color: var(--text-primary);">${reservation.utilisateur.prenom}
                                            ${reservation.utilisateur.nom}</td>
                                        <td>
                                            <span class="stat-badge"
                                                style="background:rgba(0,184,148,0.15);color:var(--success);">
                                                <i class="bi bi-play-fill"></i> ${reservation.dateDebut}
                                            </span>
                                        </td>
                                        <td>
                                            <span class="stat-badge"
                                                style="background:rgba(225,112,85,0.15);color:var(--danger);">
                                                <i class="bi bi-stop-fill"></i> ${reservation.dateFin}
                                            </span>
                                        </td>
                                        <td>
                                            <span class="stat-badge"
                                                style="background:rgba(108,92,231,0.15);color:var(--primary-light);">
                                                ${reservation.typeEvenement}
                                            </span>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-sm btn-info btn-space" title="Voir"
                                                onclick="showViewRes('${reservation.id}','${reservation.salle.nom}','${reservation.salle.id}','${reservation.utilisateur.prenom} ${reservation.utilisateur.nom}','${reservation.utilisateur.id}','${reservation.dateDebut}','${reservation.dateFin}','${reservation.typeEvenement}','${reservation.nombreInvites}','${reservation.commentaires}')">
                                                <i class="bi bi-eye"></i>
                                            </button>
                                            <a href="/reservations/${reservation.id}/modifier"
                                                class="btn btn-sm btn-warning btn-space" title="Modifier">
                                                <i class="bi bi-pencil"></i>
                                            </a>
                                            <button type="button" class="btn btn-sm btn-danger btn-space"
                                                title="Supprimer"
                                                onclick="showDeleteRes('${reservation.id}','${reservation.dateDebut}')">
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
            <div class="modal fade" id="viewResModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content"
                        style="background: var(--bg-body); border: 1px solid var(--border-color); border-radius: var(--radius-lg);">
                        <div class="modal-header"
                            style="border-bottom: 1px solid var(--border-color); padding: 1.2rem 1.5rem;">
                            <h5 class="modal-title" style="font-weight: 700; color: var(--text-primary);">
                                <i class="bi bi-calendar-heart me-2" style="color: var(--accent);"></i>
                                Détails de la Réservation
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body" style="padding: 1.5rem;">
                            <div class="detail-grid">
                                <div class="detail-item">
                                    <div class="label">ID</div>
                                    <div class="value" id="vrId"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Salle</div>
                                    <div class="value"><a id="vrSalle" href="#"
                                            style="color: var(--primary-light);"></a></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Utilisateur</div>
                                    <div class="value"><a id="vrUser" href="#" style="color: var(--secondary);"></a>
                                    </div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Type d'événement</div>
                                    <div class="value" id="vrType"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Date de début</div>
                                    <div class="value" id="vrStart" style="color: var(--success);"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Date de fin</div>
                                    <div class="value" id="vrEnd" style="color: var(--danger);"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Nombre d'invités</div>
                                    <div class="value" id="vrGuests"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Commentaire</div>
                                    <div class="value" id="vrComment" style="font-weight: 400; font-size: 0.92rem;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer"
                            style="border-top: 1px solid var(--border-color); padding: 1rem 1.5rem;">
                            <button type="button" class="btn btn-secondary btn-sm"
                                data-bs-dismiss="modal">Fermer</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ========== MODAL SUPPRIMER ========== -->
            <div class="modal fade" id="deleteResModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content"
                        style="background: var(--bg-body); border: 1px solid var(--border-color); border-radius: var(--radius-lg);">
                        <div class="modal-header"
                            style="border-bottom: 1px solid var(--border-color); padding: 1.2rem 1.5rem;">
                            <h5 class="modal-title" style="font-weight: 700; color: var(--danger);">
                                <i class="bi bi-exclamation-triangle me-2"></i>Supprimer
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body text-center" style="padding: 1.5rem;">
                            <div
                                style="width:60px;height:60px;border-radius:50%;background:rgba(225,112,85,0.15);display:inline-flex;align-items:center;justify-content:center;margin-bottom:1rem;">
                                <i class="bi bi-trash" style="font-size:1.5rem;color:var(--danger);"></i>
                            </div>
                            <p style="color: var(--text-secondary); font-size: 0.95rem;">
                                Supprimer la réservation du<br><strong id="drDate"
                                    style="color:var(--text-primary);"></strong> ?
                            </p>
                            <p style="font-size: 0.82rem; color: var(--text-muted);">Cette action est irréversible.</p>
                        </div>
                        <div class="modal-footer justify-content-center"
                            style="border-top: 1px solid var(--border-color); padding: 1rem 1.5rem;">
                            <button type="button" class="btn btn-secondary btn-sm"
                                data-bs-dismiss="modal">Annuler</button>
                            <a id="drLink" href="#" class="btn btn-danger btn-sm">
                                <i class="bi bi-trash"></i> Supprimer
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function showViewRes(id, salleName, salleId, userName, userId, start, end, type, guests, comment) {
                    document.getElementById('vrId').textContent = '#' + id;
                    document.getElementById('vrSalle').textContent = salleName;
                    document.getElementById('vrSalle').href = '/salles/' + salleId;
                    document.getElementById('vrUser').textContent = userName;
                    document.getElementById('vrUser').href = '/utilisateurs/' + userId;
                    document.getElementById('vrStart').textContent = start;
                    document.getElementById('vrEnd').textContent = end;
                    document.getElementById('vrType').textContent = type;
                    document.getElementById('vrGuests').textContent = guests + ' personne(s)';
                    document.getElementById('vrComment').textContent = comment || 'Aucun commentaire';
                    new bootstrap.Modal(document.getElementById('viewResModal')).show();
                }

                function showDeleteRes(id, date) {
                    document.getElementById('drDate').textContent = date;
                    document.getElementById('drLink').href = '/reservations/' + id + '/supprimer';
                    new bootstrap.Modal(document.getElementById('deleteResModal')).show();
                }
            </script>

            <%@ include file="/WEB-INF/views/layout/footer.jsp" %>