<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/views/layout/header.jsp" %>

        <style>
            /* ===== Homepage: Soft & Professional ===== */
            :root {
                --hero-gap: 4rem;
                --soft-bg: #f8f9fa;
                /* Fond très clair pour casser le blanc pur */
                --card-shadow: 0 12px 24px -10px rgba(0, 0, 0, 0.05);
                --card-shadow-hover: 0 20px 40px -10px rgba(0, 0, 0, 0.1);
            }

            /* Correction Dark Mode pour le soft design */
            body.dark-mode {
                --soft-bg: #1a1d21;
                --card-shadow: 0 12px 24px -10px rgba(0, 0, 0, 0.3);
            }

            /* --- Hero Section --- */
            .hero-section {
                padding: 5rem 0 6rem;
                display: grid;
                grid-template-columns: 1fr 1fr;
                /* Double colonne */
                align-items: center;
                gap: var(--hero-gap);
                position: relative;
            }

            /* Partie Gauche : Texte */
            .hero-content {
                max-width: 580px;
                text-align: left !important;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
            }

            .hero-badge {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.4rem 1rem;
                background: var(--bg-card);
                color: var(--text-secondary);
                border: 1px solid var(--border-color);
                border-radius: 50px;
                font-size: 0.85rem;
                font-weight: 500;
                margin-bottom: 1.5rem;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.03);
            }

            .hero-badge i {
                color: var(--accent);
            }

            .hero-title {
                font-size: 3rem;
                font-weight: 800;
                line-height: 1.2;
                margin-bottom: 1.2rem;
                color: var(--text-primary);
                letter-spacing: -0.01em;
            }

            /* Soulignement supprimé pour lisibilité maximale */
            .highlight-soft {
                font-weight: 800;
                /* Couleur définie inline dans le HTML (var(--accent)) */
            }

            .hero-subtitle {
                font-size: 1.1rem;
                color: var(--text-secondary);
                margin-bottom: 2.5rem;
                line-height: 1.7;
                font-weight: 400;
            }

            .hero-buttons {
                display: flex;
                gap: 1rem;
            }

            .btn-soft-primary {
                background: var(--text-primary);
                /* Noir doux ou Blanc selon thème */
                color: var(--bg-body);
                padding: 0.8rem 2rem;
                border-radius: 50px;
                font-weight: 600;
                transition: transform 0.2s ease, box-shadow 0.2s ease;
                border: none;
            }

            .btn-soft-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 20px -5px rgba(0, 0, 0, 0.2);
                color: var(--bg-body);
            }

            .btn-soft-outline {
                background: transparent;
                color: var(--text-primary);
                padding: 0.8rem 2rem;
                border-radius: 50px;
                font-weight: 600;
                border: 1px solid var(--border-color);
                transition: all 0.2s ease;
            }

            .btn-soft-outline:hover {
                border-color: var(--text-primary);
                background: var(--bg-card);
            }

            /* --- Hero Visual (Droite) : Carte Flottante Épurée --- */
            .hero-visual {
                position: relative;
                height: 400px;
                display: flex;
                align-items: center;
                justify-content: center;
                /* Recentrage pour éviter le décalage hors écran */
                margin: 0 auto;
            }

            /* Cercle de fond très subtil (correction mode sombre) */
            .bg-circle {
                position: absolute;
                width: 350px;
                height: 350px;
                border-radius: 50%;
                background: var(--accent);
                /* Utilise la couleur accent pour un halo coloré */
                opacity: 0.08;
                /* Très faible opacité pour ne pas faire "tache" */
                z-index: -1;
                filter: blur(50px);
                /* Flou important pour un effet d'ambiance */
            }

            .soft-card {
                background: var(--bg-card);
                border-radius: 24px;
                padding: 2rem;
                border: 1px solid var(--border-color);
                box-shadow: var(--card-shadow);
                position: absolute;
                width: 340px;
                transition: transform 0.3s ease;
            }

            .card-float {
                animation: float-soft 6s ease-in-out infinite;
            }

            /* Éléments simulés de l'interface */
            .ui-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1.5rem;
            }

            .ui-title {
                width: 120px;
                height: 12px;
                background: var(--text-secondary);
                border-radius: 6px;
                opacity: 0.3;
            }

            .ui-avatar {
                width: 32px;
                height: 32px;
                border-radius: 50%;
                background: var(--accent);
                opacity: 0.2;
            }

            .ui-row {
                display: flex;
                gap: 1rem;
                margin-bottom: 1rem;
            }

            .ui-block {
                flex: 1;
                height: 80px;
                background: var(--soft-bg);
                border-radius: 16px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                gap: 0.5rem;
            }

            .ui-icon {
                font-size: 1.2rem;
                color: var(--accent);
            }

            .ui-text {
                font-size: 0.8rem;
                color: var(--text-secondary);
                font-weight: 500;
            }

            .ui-btn {
                width: 100%;
                height: 40px;
                background: var(--text-primary);
                border-radius: 12px;
                margin-top: 1rem;
                opacity: 0.9;
            }

            /* Petite carte décorative */
            .small-card {
                min-width: 160px;
                padding: 0.8rem 1.2rem;
                background: var(--bg-card);
                border-radius: 16px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
                position: absolute;
                bottom: -20px;
                /* Décalé vers le bas pour ne pas cacher le contenu */
                right: auto;
                /* Décalé vers la droite */
                left: -300px;
                /* On annule l'ancien alignement gauche */
                border: 1px solid var(--border-color);
                z-index: 5;
                /* Au-dessus de la grande carte */
                animation: float-soft 7s ease-in-out infinite reverse;
            }

            @keyframes float-soft {

                0%,
                100% {
                    transform: translateY(0);
                }

                50% {
                    transform: translateY(-10px);
                }
            }

            /* --- Modules Soft --- */
            .module-soft {
                background: var(--bg-card);
                border: 1px solid var(--border-color);
                border-radius: 20px;
                padding: 2.5rem 2rem;
                height: 100%;
                transition: all 0.3s ease;
                text-align: left;
            }

            .module-soft:hover {
                transform: translateY(-5px);
                box-shadow: var(--card-shadow-hover);
                border-color: rgba(0, 0, 0, 0.1);
            }

            .icon-soft {
                width: 50px;
                height: 50px;
                border-radius: 14px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.4rem;
                margin-bottom: 1.5rem;
                /* Couleurs pastels */
            }

            /* Mobile Responsive Fixes */
            @media (max-width: 991px) {
                .hero-section {
                    grid-template-columns: 1fr;
                    text-align: center;
                    gap: 4rem;
                    padding-top: 3rem;
                }

                .hero-content {
                    margin: 0 auto;
                    align-items: center;
                    /* Centre le contenu texte sur mobile */
                    text-align: center !important;
                }

                .hero-buttons {
                    justify-content: center;
                }

                .hero-visual {
                    display: none !important;
                    /* Image cachée sur mobile */
                }

                /* Ajustement CTA mobile */
                .section-cta {
                    padding: 3rem 1.5rem !important;
                }
            }

            /* Très petits écrans */
            @media (max-width: 480px) {
                .hero-title {
                    font-size: 2.2rem;
                }

                .soft-card {
                    width: 85%;
                    padding: 1.5rem;
                }

                .small-card {
                    bottom: -40px;
                    transform: translateX(-50%) scale(0.9);
                }
            }
        </style>

        <!-- Hero Section -->
        <section class="hero-section">
            <!-- Colonne Gauche -->
            <div class="hero-content fade-up">
                <div class="hero-badge">
                    <i class="bi bi-check-circle-fill"></i> Avec RéservaSalle
                </div>
                <h1 class="hero-title">
                    Gérez vos espaces<br>
                    avec <span class="highlight-soft" style="color: var(--accent);">simplicité.</span>
                </h1>
                <p class="hero-subtitle">
                    Oubliez les fichiers Excel complexes. Centralisez vos réservations,
                    utilisateurs et salles sur une interface unique, pensée pour vous.
                </p>
                <div class="hero-buttons">
                    <a href="/reservations/ajouter" class="btn-soft-primary">
                        Nouvelle réservation
                    </a>
                    <a href="/salles" class="btn-soft-outline">
                        Voir les salles
                    </a>
                </div>
            </div>

            <!-- Colonne Droite (Illustration CSS Soft) -->
            <div class="hero-visual fade-up" style="animation-delay: 0.1s;">
                <div class="bg-circle"></div>

                <!-- Carte Principale -->
                <div class="soft-card card-float">
                    <div class="ui-header">
                        <div class="ui-title"></div>
                        <div class="ui-avatar"></div>
                    </div>
                    <div class="ui-row">
                        <div class="ui-block">
                            <i class="bi bi-calendar-event ui-icon"></i>
                            <span class="ui-text">Agenda</span>
                        </div>
                        <div class="ui-block">
                            <i class="bi bi-door-open ui-icon"></i>
                            <span class="ui-text">Salles</span>
                        </div>
                    </div>
                    <div style="background:var(--soft-bg); border-radius:12px; padding:1rem; margin-top:1rem;">
                        <div
                            style="width:60%; height:8px; background:var(--text-secondary); opacity:0.1; border-radius:4px; margin-bottom:8px;">
                        </div>
                        <div
                            style="width:40%; height:8px; background:var(--text-secondary); opacity:0.1; border-radius:4px;">
                        </div>
                    </div>
                    <div class="ui-btn"></div>
                </div>

                <!-- Petite Carte Flottante -->
                <div class="small-card">
                    <div style="display:flex; align-items:center; gap:0.8rem;">
                        <div
                            style="width:30px; height:30px; border-radius:50%; background:rgba(0,184,148,0.1); color:var(--success); display:flex; align-items:center; justify-content:center;">
                            <i class="bi bi-check-lg"></i>
                        </div>
                        <div>
                            <div style="font-size:0.8rem; font-weight:700; color:var(--text-primary);">Confirmé</div>
                            <div style="font-size:0.7rem; color:var(--text-secondary);">Réservation OK</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Stats Discrètes -->
        <div class="container fade-up" style="animation-delay: 0.2s;">
            <div
                style="display:flex; justify-content:center; gap:4rem; flex-wrap:wrap; padding: 2rem 0; border-bottom:1px solid var(--border-color); margin-bottom:5rem; opacity:0.8;">
                <div style="text-align:center;">
                    <div style="font-size:1.8rem; font-weight:700; color:var(--text-primary);">100+</div>
                    <div style="font-size:0.9rem; color:var(--text-secondary);">Salles équipées</div>
                </div>
                <div style="text-align:center;">
                    <div style="font-size:1.8rem; font-weight:700; color:var(--text-primary);">24h</div>
                    <div style="font-size:0.9rem; color:var(--text-secondary);">Disponibilité</div>
                </div>
                <div style="text-align:center;">
                    <div style="font-size:1.8rem; font-weight:700; color:var(--text-primary);">∞</div>
                    <div style="font-size:0.9rem; color:var(--text-secondary);">Utilisateurs</div>
                </div>
            </div>
        </div>

        <!-- Modules -->
        <section style="padding-bottom: 6rem;">
            <div class="row g-4 justify-content-center">
                <!-- Module 1 -->
                <div class="col-md-4 fade-up">
                    <div class="module-soft">
                        <div class="icon-soft" style="background: #eef2ff; color: #6366f1;">
                            <i class="bi bi-calendar-plus"></i>
                        </div>
                        <h3
                            style="font-size:1.25rem; font-weight:700; margin-bottom:0.8rem; color:var(--text-primary);">
                            Réservations</h3>
                        <p style="color:var(--text-secondary); font-size:0.95rem; margin-bottom:1.5rem;">Visualisez les
                            créneaux disponibles et réservez votre salle en quelques secondes.</p>
                        <a href="/reservations"
                            style="text-decoration:none; color:var(--text-primary); font-weight:600; font-size:0.9rem;">
                            Accéder <i class="bi bi-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>

                <!-- Module 2 -->
                <div class="col-md-4 fade-up" style="animation-delay: 0.1s;">
                    <div class="module-soft">
                        <div class="icon-soft" style="background: #fdf2f8; color: #ec4899;">
                            <i class="bi bi-people"></i>
                        </div>
                        <h3
                            style="font-size:1.25rem; font-weight:700; margin-bottom:0.8rem; color:var(--text-primary);">
                            Annuaire</h3>
                        <p style="color:var(--text-secondary); font-size:0.95rem; margin-bottom:1.5rem;">Retrouvez tous
                            les utilisateurs enregistrés et gérez leurs droits d'accès.</p>
                        <a href="/utilisateurs"
                            style="text-decoration:none; color:var(--text-primary); font-weight:600; font-size:0.9rem;">
                            Gérer <i class="bi bi-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>

                <!-- Module 3 -->
                <div class="col-md-4 fade-up" style="animation-delay: 0.2s;">
                    <div class="module-soft">
                        <div class="icon-soft" style="background: #ecfdf5; color: #10b981;">
                            <i class="bi bi-building"></i>
                        </div>
                        <h3
                            style="font-size:1.25rem; font-weight:700; margin-bottom:0.8rem; color:var(--text-primary);">
                            Espaces</h3>
                        <p style="color:var(--text-secondary); font-size:0.95rem; margin-bottom:1.5rem;">Consultez les
                            caractéristiques techniques de chaque salle (capacité, équipement).</p>
                        <a href="/salles"
                            style="text-decoration:none; color:var(--text-primary); font-weight:600; font-size:0.9rem;">
                            Explorer <i class="bi bi-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <!-- NOUVELLE SECTION 1: Pourquoi nous choisir -->
        <section style="padding-bottom: 6rem;">
            <div class="text-center mb-5 fade-up">
                <h2 style="font-weight: 800; color: var(--text-primary);">Pourquoi nous choisir ?</h2>
                <p style="color: var(--text-secondary);">Une solution pensée pour les entreprises modernes.</p>
            </div>

            <div class="row g-4 text-center">
                <div class="col-md-4 fade-up">
                    <div style="font-size: 2.5rem; color: var(--accent); margin-bottom: 1rem;">
                        <i class="bi bi-lightning-charge"></i>
                    </div>
                    <h4 style="font-weight: 700; color: var(--text-primary);">Ultra Rapide</h4>
                    <p style="color: var(--text-secondary);">Interface réactive et chargement instantané pour ne pas
                        perdre de temps.</p>
                </div>
                <div class="col-md-4 fade-up" style="animation-delay: 0.1s;">
                    <div style="font-size: 2.5rem; color: var(--success); margin-bottom: 1rem;">
                        <i class="bi bi-shield-lock"></i>
                    </div>
                    <h4 style="font-weight: 700; color: var(--text-primary);">Sécurisé</h4>
                    <p style="color: var(--text-secondary);">Vos données de réservation et profils utilisateurs sont
                        protégés.</p>
                </div>
                <div class="col-md-4 fade-up" style="animation-delay: 0.2s;">
                    <div style="font-size: 2.5rem; color: var(--primary-light); margin-bottom: 1rem;">
                        <i class="bi bi-headset"></i>
                    </div>
                    <h4 style="font-weight: 700; color: var(--text-primary);">Support 24/7</h4>
                    <p style="color: var(--text-secondary);">Une question ? Notre équipe est disponible pour vous aider
                        à tout moment.</p>
                </div>
            </div>
        </section>

        <!-- NOUVELLE SECTION 2: Call To Action (CTA) -->
        <section class="fade-up" style="margin-bottom: 4rem;">
            <div class="section-cta"
                style="background: var(--bg-card); border-radius: 24px; padding: 4rem 2rem; text-align: center; border: 1px solid var(--border-color); position: relative; overflow: hidden;">
                <!-- Décoration d'arrière plan -->
                <div
                    style="position: absolute; top: -50%; right: -10%; width: 300px; height: 300px; background: var(--accent); opacity: 0.05; border-radius: 50%; filter: blur(60px);">
                </div>
                <div
                    style="position: absolute; bottom: -50%; left: -10%; width: 300px; height: 300px; background: var(--primary-light); opacity: 0.05; border-radius: 50%; filter: blur(60px);">
                </div>

                <h2 style="font-weight: 800; color: var(--text-primary); margin-bottom: 1rem; position: relative;">Prêt
                    à simplifier votre gestion ?</h2>
                <p style="color: var(--text-secondary); max-width: 600px; margin: 0 auto 2rem; position: relative;">
                    Rejoignez des centaines d'entreprises qui ont déjà optimisé l'organisation de leurs espaces de
                    travail.</p>

                <a href="/reservations/ajouter" class="btn-soft-primary"
                    style="padding: 1rem 2.5rem; font-size: 1.1rem; position: relative;">
                    Commencer maintenant <i class="bi bi-arrow-right ms-2"></i>
                </a>
            </div>
        </section>

        <%@ include file="/WEB-INF/views/layout/footer.jsp" %>