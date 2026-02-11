<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/views/layout/header.jsp" %>

        <style>
            /* ===== Homepage specific ===== */
            .hero-home {
                text-align: center;
                padding: 4rem 1rem 2.5rem;
            }

            .hero-home h1 {
                font-size: 2.8rem;
                font-weight: 800;
                line-height: 1.15;
                color: var(--text-primary);
                margin-bottom: 1.2rem;
                -webkit-text-fill-color: unset;
                background: none;
            }

            .hero-home h1 span {
                background: var(--gradient-primary);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
            }

            .hero-home .lead {
                font-size: 1.08rem;
                color: var(--text-secondary);
                max-width: 620px;
                margin: 0 auto 2.2rem;
                line-height: 1.75;
            }

            .hero-actions {
                display: flex;
                justify-content: center;
                gap: 0.75rem;
                flex-wrap: wrap;
            }

            .hero-actions .btn {
                padding: 0.7rem 1.8rem;
                font-size: 0.95rem;
            }

            /* Stats bar */
            .stats-bar {
                display: flex;
                justify-content: center;
                gap: 3rem;
                flex-wrap: wrap;
                padding: 2.5rem 0;
                margin-top: 2rem;
                border-top: 1px solid var(--border-color);
                border-bottom: 1px solid var(--border-color);
            }

            .stat-item {
                text-align: center;
            }

            .stat-value {
                font-size: 2.2rem;
                font-weight: 800;
                background: var(--gradient-primary);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                line-height: 1;
                margin-bottom: 0.3rem;
            }

            .stat-label {
                font-size: 0.88rem;
                color: var(--text-muted);
                font-weight: 500;
            }

            /* Section headings */
            .section-heading {
                text-align: center;
                padding-top: 3rem;
                margin-bottom: 2rem;
            }

            .section-heading h2 {
                font-size: 1.8rem;
                font-weight: 800;
                color: var(--text-primary);
                margin-bottom: 0.5rem;
            }

            .section-heading p {
                color: var(--text-secondary);
                font-size: 1rem;
                max-width: 500px;
                margin: 0 auto;
            }

            /* Module cards */
            .module-card {
                background: var(--bg-card);
                border: 1px solid var(--border-color);
                border-radius: var(--radius-lg);
                padding: 2rem 1.5rem;
                text-align: center;
                transition: all var(--transition-smooth);
                height: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .module-card:hover {
                background: var(--bg-card-hover);
                border-color: var(--border-active);
                box-shadow: var(--shadow-glow);
                transform: translateY(-4px);
            }

            .module-icon-lg {
                width: 60px;
                height: 60px;
                border-radius: var(--radius-md);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                margin-bottom: 1.2rem;
            }

            .module-card h5 {
                font-weight: 700;
                color: var(--text-primary);
                margin-bottom: 0.5rem;
                font-size: 1.1rem;
            }

            .module-card p {
                font-size: 0.88rem;
                color: var(--text-secondary);
                line-height: 1.6;
                flex: 1;
            }

            .module-card .btn {
                margin-top: auto;
            }

            /* CTA Section */
            .cta-section {
                background: var(--gradient-primary);
                border-radius: var(--radius-xl);
                padding: 3rem 2rem;
                text-align: center;
                margin-top: 3rem;
                position: relative;
                overflow: hidden;
            }

            .cta-section::before {
                content: '';
                position: absolute;
                top: -50%;
                right: -20%;
                width: 300px;
                height: 300px;
                background: rgba(255, 255, 255, 0.08);
                border-radius: 50%;
            }

            .cta-section h2 {
                font-size: 1.6rem;
                font-weight: 800;
                color: white;
                margin-bottom: 0.8rem;
                position: relative;
            }

            .cta-section p {
                color: rgba(255, 255, 255, 0.8);
                font-size: 0.95rem;
                max-width: 500px;
                margin: 0 auto 1.5rem;
                position: relative;
            }

            .cta-section .btn {
                background: white;
                color: var(--primary);
                font-weight: 700;
                padding: 0.65rem 1.5rem;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
                position: relative;
            }

            .cta-section .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 25px rgba(0, 0, 0, 0.2);
                color: var(--primary-dark);
                background: white;
            }

            /* Features grid */
            .feature-pill {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                padding: 1rem 1.2rem;
                background: var(--bg-card);
                border: 1px solid var(--border-color);
                border-radius: var(--radius-sm);
                transition: all var(--transition-fast);
                height: 100%;
            }

            .feature-pill:hover {
                border-color: var(--border-active);
                background: var(--bg-card-hover);
            }

            .feature-pill i {
                font-size: 1.2rem;
                flex-shrink: 0;
            }

            .feature-pill span {
                font-size: 0.9rem;
                color: var(--text-secondary);
                font-weight: 500;
            }

            @media (max-width: 767.98px) {
                .hero-home h1 {
                    font-size: 2rem;
                }

                .hero-home .lead {
                    font-size: 0.95rem;
                }

                .hero-actions .btn {
                    width: 100%;
                    justify-content: center;
                }

                .stats-bar {
                    gap: 1.5rem;
                }

                .stat-value {
                    font-size: 1.8rem;
                }

                .cta-section {
                    padding: 2rem 1.5rem;
                }

                .cta-section h2 {
                    font-size: 1.3rem;
                }
            }
        </style>

        <!-- ========== HERO ========== -->
        <section class="hero-home">
            <h1>Gestion Intelligente<br>des <span>Espaces</span></h1>
            <p class="lead">
                Optimisez la réservation de vos salles avec une plateforme moderne,
                intuitive et performante. Gérez vos espaces en toute simplicité.
            </p>
            <div class="hero-actions">
                <a href="/reservations/ajouter" class="btn btn-primary">
                    <i class="bi bi-lightning-charge-fill"></i> Commencer maintenant
                </a>
                <a href="/salles" class="btn btn-secondary">
                    Voir les salles
                </a>
            </div>
        </section>

        <!-- ========== STATS ========== -->
        <div class="stats-bar fade-up">
            <div class="stat-item">
                <div class="stat-value">24/7</div>
                <div class="stat-label">Disponibilité</div>
            </div>
            <div class="stat-item">
                <div class="stat-value">99%</div>
                <div class="stat-label">Satisfaction</div>
            </div>
            <div class="stat-item">
                <div class="stat-value">100+</div>
                <div class="stat-label">Salles gérées</div>
            </div>
        </div>

        <!-- ========== MODULES ========== -->
        <div class="section-heading fade-up">
            <h2>Gérez vos ressources</h2>
            <p>Accédez rapidement aux modules de gestion</p>
        </div>

        <div class="row g-4 fade-up">
            <div class="col-md-4">
                <div class="module-card">
                    <div class="module-icon-lg icon-reservations">
                        <i class="bi bi-calendar-check-fill"></i>
                    </div>
                    <h5>Gestion des Réservations</h5>
                    <p>Planifiez et gérez vos réservations en temps réel. Interface intuitive pour une prise de
                        rendez-vous simplifiée.</p>
                    <a href="/reservations" class="btn btn-primary">
                        <i class="bi bi-arrow-right"></i> Accéder aux réservations
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="module-card">
                    <div class="module-icon-lg icon-utilisateurs">
                        <i class="bi bi-people-fill"></i>
                    </div>
                    <h5>Gestion des Utilisateurs</h5>
                    <p>Administrez les profils utilisateurs. Contrôle complet des informations et de l'historique.</p>
                    <a href="/utilisateurs" class="btn btn-primary">
                        <i class="bi bi-arrow-right"></i> Gérer les utilisateurs
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="module-card">
                    <div class="module-icon-lg icon-salles">
                        <i class="bi bi-door-open-fill"></i>
                    </div>
                    <h5>Gestion des Salles</h5>
                    <p>Configurez et optimisez vos espaces. Gérez les équipements, capacités et disponibilités des
                        salles.</p>
                    <a href="/salles" class="btn btn-primary">
                        <i class="bi bi-arrow-right"></i> Voir les salles
                    </a>
                </div>
            </div>
        </div>

        <!-- ========== TOUT CE DONT VOUS AVEZ BESOIN ========== -->
        <div class="section-heading fade-up">
            <h2>Tout ce dont vous avez besoin</h2>
            <p>Une plateforme complète pour la gestion de vos espaces et événements</p>
        </div>

        <div class="row g-3 mb-4 fade-up">
            <div class="col-sm-6 col-lg-4">
                <div class="feature-pill">
                    <i class="bi bi-shield-check" style="color: var(--success);"></i>
                    <span>Détection automatique des conflits</span>
                </div>
            </div>
            <div class="col-sm-6 col-lg-4">
                <div class="feature-pill">
                    <i class="bi bi-search" style="color: var(--info);"></i>
                    <span>Recherche et filtrage avancés</span>
                </div>
            </div>
            <div class="col-sm-6 col-lg-4">
                <div class="feature-pill">
                    <i class="bi bi-people-fill" style="color: var(--secondary);"></i>
                    <span>Gestion complète des utilisateurs</span>
                </div>
            </div>
            <div class="col-sm-6 col-lg-4">
                <div class="feature-pill">
                    <i class="bi bi-pencil-square" style="color: var(--warning);"></i>
                    <span>Modification et suppression faciles</span>
                </div>
            </div>
            <div class="col-sm-6 col-lg-4">
                <div class="feature-pill">
                    <i class="bi bi-phone" style="color: var(--accent);"></i>
                    <span>Interface responsive tous écrans</span>
                </div>
            </div>
            <div class="col-sm-6 col-lg-4">
                <div class="feature-pill">
                    <i class="bi bi-moon-stars" style="color: var(--primary-light);"></i>
                    <span>Mode clair &amp; mode sombre</span>
                </div>
            </div>
        </div>

        <!-- ========== CTA ========== -->
        <section class="cta-section fade-up">
            <h2>Prêt à optimiser votre gestion des espaces ?</h2>
            <p>Rejoignez les organisations qui font confiance à notre plateforme pour une gestion optimale de leurs
                espaces.</p>
            <a href="/reservations/ajouter" class="btn">
                <i class="bi bi-lightning-charge-fill"></i> Commencer maintenant
            </a>
        </section>

        <%@ include file="/WEB-INF/views/layout/footer.jsp" %>