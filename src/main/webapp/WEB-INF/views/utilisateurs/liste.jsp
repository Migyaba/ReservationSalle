<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ include file="/WEB-INF/views/layout/header.jsp" %>

            <div class="page-header">
                <h1><i class="bi bi-people me-2"></i>Liste des Utilisateurs</h1>
                <p class="subtitle">Tous les utilisateurs enregistrés dans le système</p>
            </div>

            <div class="action-bar">
                <a href="/utilisateurs/enregistrer" class="btn btn-success">
                    <i class="bi bi-person-plus"></i> Enregistrer un Utilisateur
                </a>
            </div>

            <c:if test="${empty utilisateurs}">
                <div class="alert alert-warning alert-custom">
                    <i class="bi bi-exclamation-triangle"></i>
                    Aucun utilisateur enregistré. Veuillez en ajouter un.
                </div>
            </c:if>

            <c:if test="${not empty utilisateurs}">
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th><i class="bi bi-hash me-1"></i>ID</th>
                                    <th><i class="bi bi-person me-1"></i>Nom</th>
                                    <th><i class="bi bi-person-badge me-1"></i>Prénom</th>
                                    <th><i class="bi bi-envelope me-1"></i>Email</th>
                                    <th><i class="bi bi-telephone me-1"></i>Téléphone</th>
                                    <th><i class="bi bi-gear me-1"></i>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="utilisateur" items="${utilisateurs}">
                                    <tr>
                                        <td><strong>#${utilisateur.id}</strong></td>
                                        <td style="color: var(--text-primary); font-weight: 600;">${utilisateur.nom}
                                        </td>
                                        <td style="color: var(--text-primary);">${utilisateur.prenom}</td>
                                        <td>
                                            <span style="color: var(--info);">
                                                <i class="bi bi-envelope-fill me-1"></i>${utilisateur.email}
                                            </span>
                                        </td>
                                        <td>${utilisateur.telephone}</td>
                                        <td>
                                            <button type="button" class="btn btn-sm btn-info btn-space" title="Voir"
                                                onclick="showViewUser('${utilisateur.id}','${utilisateur.nom}','${utilisateur.prenom}','${utilisateur.email}','${utilisateur.telephone}')">
                                                <i class="bi bi-eye"></i>
                                            </button>
                                            <button type="button" class="btn btn-sm btn-warning btn-space"
                                                title="Modifier"
                                                onclick="showEditUser('${utilisateur.id}','${utilisateur.nom}','${utilisateur.prenom}','${utilisateur.email}','${utilisateur.telephone}')">
                                                <i class="bi bi-pencil"></i>
                                            </button>
                                            <button type="button" class="btn btn-sm btn-danger btn-space"
                                                title="Supprimer"
                                                onclick="showDeleteUser('${utilisateur.id}','${utilisateur.prenom} ${utilisateur.nom}')">
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
            <div class="modal fade" id="viewUserModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content"
                        style="background: var(--bg-body); border: 1px solid var(--border-color); border-radius: var(--radius-lg);">
                        <div class="modal-header"
                            style="border-bottom: 1px solid var(--border-color); padding: 1.2rem 1.5rem;">
                            <h5 class="modal-title" style="font-weight: 700; color: var(--text-primary);">
                                <i class="bi bi-person-circle me-2" style="color: var(--secondary);"></i>
                                <span id="vuTitle"></span>
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body" style="padding: 1.5rem;">
                            <div class="detail-grid" style="grid-template-columns: 1fr 1fr;">
                                <div class="detail-item">
                                    <div class="label">ID</div>
                                    <div class="value" id="vuId"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Nom</div>
                                    <div class="value" id="vuNom"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Prénom</div>
                                    <div class="value" id="vuPrenom"></div>
                                </div>
                                <div class="detail-item">
                                    <div class="label">Email</div>
                                    <div class="value" id="vuEmail" style="color: var(--info);"></div>
                                </div>
                                <div class="detail-item" style="grid-column: span 2;">
                                    <div class="label">Téléphone</div>
                                    <div class="value" id="vuTel"></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer"
                            style="border-top: 1px solid var(--border-color); padding: 1rem 1.5rem;">
                            <a id="vuReservationsLink" href="#" class="btn btn-info btn-sm">
                                <i class="bi bi-calendar-check"></i> Ses réservations
                            </a>
                            <button type="button" class="btn btn-secondary btn-sm"
                                data-bs-dismiss="modal">Fermer</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ========== MODAL MODIFIER ========== -->
            <div class="modal fade" id="editUserModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content"
                        style="background: var(--bg-body); border: 1px solid var(--border-color); border-radius: var(--radius-lg);">
                        <div class="modal-header"
                            style="border-bottom: 1px solid var(--border-color); padding: 1.2rem 1.5rem;">
                            <h5 class="modal-title" style="font-weight: 700; color: var(--text-primary);">
                                <i class="bi bi-pencil-square me-2" style="color: var(--warning);"></i>
                                Modifier l'Utilisateur
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <form id="editUserForm" method="post">
                            <div class="modal-body" style="padding: 1.5rem;">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="euNom" class="form-label"><i class="bi bi-person me-1"></i>Nom
                                                *</label>
                                            <input type="text" class="form-control" id="euNom" name="nom" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="euPrenom" class="form-label"><i
                                                    class="bi bi-person-badge me-1"></i>Prénom *</label>
                                            <input type="text" class="form-control" id="euPrenom" name="prenom"
                                                required>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="euEmail" class="form-label"><i class="bi bi-envelope me-1"></i>Email
                                        *</label>
                                    <input type="email" class="form-control" id="euEmail" name="email">
                                </div>
                                <div class="mb-3">
                                    <label for="euTel" class="form-label"><i class="bi bi-telephone me-1"></i>Téléphone
                                        *</label>
                                    <input type="text" class="form-control" id="euTel" name="telephone" required>
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
            <div class="modal fade" id="deleteUserModal" tabindex="-1" aria-hidden="true">
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
                                Voulez-vous vraiment supprimer<br><strong id="duName"
                                    style="color:var(--text-primary);"></strong> ?
                            </p>
                            <p style="font-size: 0.82rem; color: var(--text-muted);">Cette action est irréversible.</p>
                        </div>
                        <div class="modal-footer justify-content-center"
                            style="border-top: 1px solid var(--border-color); padding: 1rem 1.5rem;">
                            <button type="button" class="btn btn-secondary btn-sm"
                                data-bs-dismiss="modal">Annuler</button>
                            <a id="duLink" href="#" class="btn btn-danger btn-sm">
                                <i class="bi bi-trash"></i> Supprimer
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function showViewUser(id, nom, prenom, email, tel) {
                    document.getElementById('vuTitle').textContent = prenom + ' ' + nom;
                    document.getElementById('vuId').textContent = '#' + id;
                    document.getElementById('vuNom').textContent = nom;
                    document.getElementById('vuPrenom').textContent = prenom;
                    document.getElementById('vuEmail').textContent = email;
                    document.getElementById('vuTel').textContent = tel;
                    document.getElementById('vuReservationsLink').href = '/reservations/utilisateur/' + id;
                    new bootstrap.Modal(document.getElementById('viewUserModal')).show();
                }

                function showEditUser(id, nom, prenom, email, tel) {
                    document.getElementById('editUserForm').action = '/utilisateurs/' + id;
                    document.getElementById('euNom').value = nom;
                    document.getElementById('euPrenom').value = prenom;
                    document.getElementById('euEmail').value = email;
                    document.getElementById('euTel').value = tel;
                    new bootstrap.Modal(document.getElementById('editUserModal')).show();
                }

                function showDeleteUser(id, fullName) {
                    document.getElementById('duName').textContent = fullName;
                    document.getElementById('duLink').href = '/utilisateurs/' + id + '/supprimer';
                    new bootstrap.Modal(document.getElementById('deleteUserModal')).show();
                }
            </script>

            <%@ include file="/WEB-INF/views/layout/footer.jsp" %>