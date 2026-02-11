<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="fr" data-theme="dark">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Réservation de Salles</title>
            <meta name="description"
                content="Plateforme de gestion des réservations de salles de fête - Simple, efficace et moderne.">

            <!-- Google Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                rel="stylesheet">

            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Bootstrap Icons -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
                rel="stylesheet">

            <style>
                /* ===== CSS VARIABLES / DARK THEME (default) ===== */
                :root,
                [data-theme="dark"] {
                    --primary: #6C5CE7;
                    --primary-light: #A29BFE;
                    --primary-dark: #4A3DB8;
                    --secondary: #00CEC9;
                    --secondary-light: #81ECEC;
                    --accent: #FD79A8;
                    --accent-light: #FDCB82;
                    --success: #00B894;
                    --warning: #FDCB6E;
                    --danger: #E17055;
                    --info: #74B9FF;

                    --bg-body: #0F0E17;
                    --bg-card: rgba(255, 255, 255, 0.04);
                    --bg-card-hover: rgba(255, 255, 255, 0.08);
                    --bg-glass: rgba(255, 255, 255, 0.06);
                    --bg-input: rgba(255, 255, 255, 0.08);
                    --bg-navbar: rgba(15, 14, 23, 0.85);
                    --bg-table-header: rgba(108, 92, 231, 0.2);

                    --text-primary: #FFFFFE;
                    --text-secondary: #A7A9BE;
                    --text-muted: #72738A;
                    --text-link: #A29BFE;

                    --border-color: rgba(255, 255, 255, 0.08);
                    --border-active: rgba(108, 92, 231, 0.5);

                    --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.2);
                    --shadow-md: 0 8px 32px rgba(0, 0, 0, 0.3);
                    --shadow-lg: 0 16px 48px rgba(0, 0, 0, 0.4);
                    --shadow-glow: 0 0 30px rgba(108, 92, 231, 0.15);

                    --gradient-primary: linear-gradient(135deg, #6C5CE7, #A29BFE);
                    --gradient-card: linear-gradient(135deg, rgba(108, 92, 231, 0.1), rgba(0, 206, 201, 0.05));
                    --gradient-success: linear-gradient(135deg, #00B894, #00CEC9);
                    --gradient-danger: linear-gradient(135deg, #E17055, #FD79A8);

                    --bg-float-1: rgba(108, 92, 231, 0.08);
                    --bg-float-2: rgba(0, 206, 201, 0.06);
                    --bg-float-3: rgba(253, 121, 168, 0.05);
                }

                /* ===== LIGHT THEME ===== */
                [data-theme="light"] {
                    --bg-body: #F5F3FF;
                    --bg-card: rgba(255, 255, 255, 0.85);
                    --bg-card-hover: rgba(255, 255, 255, 1);
                    --bg-glass: rgba(255, 255, 255, 0.75);
                    --bg-input: rgba(255, 255, 255, 1);
                    --bg-navbar: rgba(255, 255, 255, 0.88);
                    --bg-table-header: rgba(108, 92, 231, 0.08);

                    --text-primary: #1A1A2E;
                    --text-secondary: #555770;
                    --text-muted: #8E8EA0;
                    --text-link: #6C5CE7;

                    --border-color: rgba(108, 92, 231, 0.12);
                    --border-active: rgba(108, 92, 231, 0.4);

                    --shadow-sm: 0 2px 8px rgba(108, 92, 231, 0.06);
                    --shadow-md: 0 8px 32px rgba(108, 92, 231, 0.08);
                    --shadow-lg: 0 16px 48px rgba(108, 92, 231, 0.1);
                    --shadow-glow: 0 0 30px rgba(108, 92, 231, 0.1);

                    --bg-float-1: rgba(108, 92, 231, 0.04);
                    --bg-float-2: rgba(0, 206, 201, 0.03);
                    --bg-float-3: rgba(253, 121, 168, 0.03);
                }

                /* ===== COMMON TOKENS ===== */
                :root {
                    --radius-sm: 8px;
                    --radius-md: 14px;
                    --radius-lg: 20px;
                    --radius-xl: 28px;
                    --transition-fast: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
                    --transition-smooth: 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                }

                /* ===== GLOBAL RESET & BASE ===== */
                *,
                *::before,
                *::after {
                    box-sizing: border-box;
                }

                html {
                    scroll-behavior: smooth;
                    min-height: 100%;
                }

                body {
                    font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
                    background: var(--bg-body);
                    color: var(--text-primary);
                    padding-top: 80px;
                    min-height: 100vh;
                    display: flex;
                    flex-direction: column;
                    -webkit-font-smoothing: antialiased;
                    -moz-osx-font-smoothing: grayscale;
                    overflow-x: hidden;
                    transition: background var(--transition-smooth), color var(--transition-smooth);
                }

                /* Animated gradient background */
                body::before {
                    content: '';
                    position: fixed;
                    top: -50%;
                    left: -50%;
                    width: 200%;
                    height: 200%;
                    background: radial-gradient(ellipse at 20% 50%, var(--bg-float-1) 0%, transparent 50%),
                        radial-gradient(ellipse at 80% 20%, var(--bg-float-2) 0%, transparent 50%),
                        radial-gradient(ellipse at 50% 80%, var(--bg-float-3) 0%, transparent 50%);
                    z-index: -1;
                    animation: bgFloat 20s ease-in-out infinite alternate;
                }

                @keyframes bgFloat {
                    0% {
                        transform: translate(0, 0) rotate(0deg);
                    }

                    100% {
                        transform: translate(-20px, -30px) rotate(3deg);
                    }
                }

                a {
                    color: var(--text-link);
                    text-decoration: none;
                    transition: color var(--transition-fast);
                }

                a:hover {
                    color: var(--primary-light);
                }

                ::selection {
                    background: var(--primary);
                    color: white;
                }

                /* ===== NAVBAR ===== */
                .navbar-custom {
                    background: var(--bg-navbar);
                    backdrop-filter: blur(24px) saturate(180%);
                    -webkit-backdrop-filter: blur(24px) saturate(180%);
                    border-bottom: 1px solid var(--border-color);
                    padding: 0.6rem 0;
                    transition: all var(--transition-smooth);
                }

                .navbar-custom .navbar-brand {
                    font-weight: 700;
                    font-size: 1.3rem;
                    color: var(--text-primary) !important;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                    transition: transform var(--transition-fast);
                }

                .navbar-custom .navbar-brand:hover {
                    transform: scale(1.03);
                }

                .navbar-brand-icon {
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    width: 38px;
                    height: 38px;
                    background: var(--gradient-primary);
                    border-radius: var(--radius-sm);
                    font-size: 1.1rem;
                    color: white;
                }

                .navbar-custom .nav-link {
                    color: var(--text-secondary) !important;
                    font-weight: 500;
                    font-size: 0.92rem;
                    padding: 0.5rem 1rem !important;
                    border-radius: var(--radius-sm);
                    transition: all var(--transition-fast);
                }

                .navbar-custom .nav-link:hover,
                .navbar-custom .nav-link.active {
                    color: var(--text-primary) !important;
                    background: rgba(108, 92, 231, 0.15);
                }

                .nav-cta {
                    background: var(--gradient-primary) !important;
                    color: white !important;
                    padding: 0.45rem 1.1rem !important;
                    font-weight: 600 !important;
                    margin-left: 0.5rem;
                }

                .nav-cta:hover {
                    box-shadow: 0 4px 15px rgba(108, 92, 231, 0.4);
                    transform: translateY(-1px);
                }

                .navbar-toggler {
                    border: 1px solid var(--border-color);
                    padding: 0.4rem 0.6rem;
                }

                .navbar-toggler-icon {
                    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(128,128,128,.8)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e") !important;
                }

                .nav-divider {
                    width: 1px;
                    height: 24px;
                    background: var(--border-color);
                    margin: auto 0.3rem;
                }

                /* Theme Toggle Button */
                .theme-toggle {
                    background: var(--bg-input);
                    border: 1px solid var(--border-color);
                    color: var(--text-secondary);
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    cursor: pointer;
                    transition: all var(--transition-fast);
                    font-size: 1.1rem;
                    margin-left: 0.5rem;
                    padding: 0;
                }

                .theme-toggle:hover {
                    background: rgba(108, 92, 231, 0.2);
                    border-color: var(--primary);
                    color: var(--primary-light);
                    transform: rotate(20deg);
                }

                /* ===== CONTAINER ===== */
                .container-main {
                    margin-top: 2rem;
                    margin-bottom: 3rem;
                    flex: 1;
                    animation: fadeInUp 0.5s ease-out;
                }

                @keyframes fadeInUp {
                    from {
                        opacity: 0;
                        transform: translateY(20px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                    }

                    to {
                        opacity: 1;
                    }
                }

                /* ===== PAGE HEADERS ===== */
                .page-header {
                    margin-bottom: 2rem;
                    padding-bottom: 1.5rem;
                    border-bottom: 1px solid var(--border-color);
                }

                .page-header h1 {
                    font-weight: 800;
                    font-size: 2rem;
                    background: var(--gradient-primary);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text;
                    margin-bottom: 0.3rem;
                }

                .page-header .subtitle {
                    color: var(--text-secondary);
                    font-size: 1rem;
                    font-weight: 400;
                }

                h1.mb-4 {
                    font-weight: 800;
                    font-size: 2rem;
                    background: var(--gradient-primary);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text;
                }

                /* ===== CARDS ===== */
                .card {
                    background: var(--bg-card);
                    border: 1px solid var(--border-color);
                    border-radius: var(--radius-md);
                    box-shadow: var(--shadow-sm);
                    transition: all var(--transition-smooth);
                    overflow: hidden;
                }

                .card:hover {
                    background: var(--bg-card-hover);
                    border-color: var(--border-active);
                    box-shadow: var(--shadow-glow);
                    transform: translateY(-4px);
                }

                .card-header {
                    background: var(--bg-table-header) !important;
                    border-bottom: 1px solid var(--border-color);
                    padding: 1rem 1.25rem;
                }

                .card-header h5 {
                    color: var(--text-primary);
                    font-weight: 600;
                }

                .card-body {
                    padding: 1.5rem;
                }

                .card-title {
                    font-weight: 700;
                    font-size: 1.15rem;
                    color: var(--text-primary);
                }

                .card-text {
                    color: var(--text-secondary);
                    font-size: 0.92rem;
                    line-height: 1.6;
                }

                /* Feature cards on homepage */
                .feature-card {
                    background: var(--bg-glass);
                    border: 1px solid var(--border-color);
                    border-radius: var(--radius-lg);
                    padding: 2rem;
                    text-align: center;
                    transition: all var(--transition-smooth);
                    position: relative;
                    overflow: hidden;
                }

                .feature-card::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    height: 3px;
                    background: var(--gradient-primary);
                    transform: scaleX(0);
                    transition: transform var(--transition-smooth);
                }

                .feature-card:hover::before {
                    transform: scaleX(1);
                }

                .feature-card:hover {
                    background: var(--bg-card-hover);
                    border-color: var(--border-active);
                    box-shadow: var(--shadow-glow);
                    transform: translateY(-6px);
                }

                .feature-icon {
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    width: 64px;
                    height: 64px;
                    border-radius: var(--radius-md);
                    font-size: 1.6rem;
                    margin-bottom: 1.2rem;
                }

                .icon-salles {
                    background: rgba(108, 92, 231, 0.15);
                    color: var(--primary-light);
                }

                .icon-utilisateurs {
                    background: rgba(0, 206, 201, 0.15);
                    color: var(--secondary);
                }

                .icon-reservations {
                    background: rgba(253, 121, 168, 0.15);
                    color: var(--accent);
                }

                /* ===== BUTTONS ===== */
                .btn {
                    font-family: 'Inter', sans-serif;
                    font-weight: 600;
                    font-size: 0.88rem;
                    padding: 0.55rem 1.3rem;
                    border-radius: var(--radius-sm);
                    border: none;
                    transition: all var(--transition-fast);
                    display: inline-flex;
                    align-items: center;
                    gap: 6px;
                }

                .btn-primary {
                    background: var(--gradient-primary);
                    color: white;
                    box-shadow: 0 4px 15px rgba(108, 92, 231, 0.25);
                }

                .btn-primary:hover {
                    box-shadow: 0 6px 25px rgba(108, 92, 231, 0.45);
                    transform: translateY(-2px);
                    background: var(--gradient-primary);
                }

                .btn-success {
                    background: var(--gradient-success);
                    color: white;
                    box-shadow: 0 4px 15px rgba(0, 184, 148, 0.25);
                }

                .btn-success:hover {
                    box-shadow: 0 6px 25px rgba(0, 184, 148, 0.45);
                    transform: translateY(-2px);
                }

                .btn-danger {
                    background: var(--gradient-danger);
                    color: white;
                    box-shadow: 0 4px 12px rgba(225, 112, 85, 0.2);
                }

                .btn-danger:hover {
                    box-shadow: 0 6px 20px rgba(225, 112, 85, 0.4);
                    transform: translateY(-2px);
                }

                .btn-warning {
                    background: linear-gradient(135deg, #FDCB6E, #E17055);
                    color: white;
                    box-shadow: 0 4px 12px rgba(253, 203, 110, 0.2);
                }

                .btn-warning:hover {
                    box-shadow: 0 6px 20px rgba(253, 203, 110, 0.4);
                    transform: translateY(-2px);
                    color: white;
                }

                .btn-info {
                    background: linear-gradient(135deg, #74B9FF, #6C5CE7);
                    color: white;
                    box-shadow: 0 4px 12px rgba(116, 185, 255, 0.2);
                }

                .btn-info:hover {
                    box-shadow: 0 6px 20px rgba(116, 185, 255, 0.4);
                    transform: translateY(-2px);
                    color: white;
                }

                .btn-secondary {
                    background: var(--bg-input);
                    color: var(--text-secondary);
                    border: 1px solid var(--border-color);
                    box-shadow: none;
                }

                .btn-secondary:hover {
                    background: rgba(108, 92, 231, 0.1);
                    color: var(--text-primary);
                    border-color: var(--border-active);
                }

                .btn-outline-secondary {
                    border: 1px solid var(--border-color);
                    color: var(--text-secondary);
                    background: transparent;
                }

                .btn-outline-secondary:hover {
                    border-color: var(--primary);
                    color: var(--primary-light);
                    background: rgba(108, 92, 231, 0.1);
                }

                .btn-sm {
                    font-size: 0.8rem;
                    padding: 0.35rem 0.9rem;
                }

                .btn-space {
                    margin-right: 5px;
                }

                /* ===== TABLES ===== */
                .table-container {
                    background: var(--bg-card);
                    border: 1px solid var(--border-color);
                    border-radius: var(--radius-md);
                    overflow: hidden;
                }

                .table {
                    color: var(--text-primary);
                    margin-bottom: 0;
                }

                .table>thead {
                    background: var(--bg-table-header);
                }

                .table>thead th {
                    color: var(--text-primary) !important;
                    font-weight: 600;
                    font-size: 0.85rem;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    padding: 1rem 1.2rem;
                    border-bottom: 1px solid var(--border-color);
                    background: transparent !important;
                }

                .table>tbody>tr {
                    border-bottom: 1px solid var(--border-color);
                    transition: background var(--transition-fast);
                }

                .table>tbody>tr:hover {
                    background: rgba(108, 92, 231, 0.06);
                }

                .table>tbody>tr:last-child {
                    border-bottom: none;
                }

                .table {
                    --bs-table-bg: transparent;
                    --bs-table-accent-bg: transparent;
                }

                .table>tbody td {
                    padding: 1rem 1.2rem;
                    vertical-align: middle;
                    font-size: 0.9rem;
                    color: var(--text-primary) !important;
                    background-color: transparent !important;
                    border-bottom: 1px solid var(--border-color);
                }

                .table-striped>tbody>tr:nth-of-type(odd)>* {
                    background-color: transparent;
                    --bs-table-bg-type: transparent;
                }

                .table-hover>tbody>tr:hover>* {
                    background-color: transparent;
                    --bs-table-bg-state: transparent;
                }

                thead.table-dark {
                    --bs-table-bg: transparent;
                }

                /* ===== FORMS ===== */
                .form-label {
                    color: var(--text-secondary);
                    font-weight: 500;
                    font-size: 0.88rem;
                    margin-bottom: 0.4rem;
                }

                .form-control,
                .form-select {
                    background: var(--bg-input);
                    border: 1px solid var(--border-color);
                    color: var(--text-primary);
                    border-radius: var(--radius-sm);
                    padding: 0.65rem 1rem;
                    font-family: 'Inter', sans-serif;
                    font-size: 0.92rem;
                    transition: all var(--transition-fast);
                }

                .form-control:focus,
                .form-select:focus {
                    background: var(--bg-input);
                    border-color: var(--primary);
                    box-shadow: 0 0 0 3px rgba(108, 92, 231, 0.15);
                    color: var(--text-primary);
                }

                .form-control::placeholder {
                    color: var(--text-muted);
                }

                textarea.form-control {
                    min-height: 100px;
                }

                select.form-control option,
                .form-select option {
                    background: var(--bg-body);
                    color: var(--text-primary);
                }

                /* ===== ALERTS ===== */
                .alert {
                    border-radius: var(--radius-md);
                    border: 1px solid;
                    padding: 1rem 1.5rem;
                    font-size: 0.92rem;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                    animation: fadeIn 0.3s ease-out;
                }

                .alert-warning {
                    background: rgba(253, 203, 110, 0.1);
                    border-color: rgba(253, 203, 110, 0.25);
                    color: var(--warning);
                }

                .alert-danger {
                    background: rgba(225, 112, 85, 0.1);
                    border-color: rgba(225, 112, 85, 0.25);
                    color: var(--danger);
                }

                .alert-info {
                    background: rgba(116, 185, 255, 0.1);
                    border-color: rgba(116, 185, 255, 0.25);
                    color: var(--info);
                }

                .alert-success {
                    background: rgba(0, 184, 148, 0.1);
                    border-color: rgba(0, 184, 148, 0.25);
                    color: var(--success);
                }

                .alert-custom {
                    margin-bottom: 1.5rem;
                }

                /* ===== DETAIL PAGES ===== */
                .detail-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                    gap: 1.2rem;
                }

                .detail-item {
                    padding: 1rem;
                    background: rgba(108, 92, 231, 0.03);
                    border-radius: var(--radius-sm);
                    border: 1px solid var(--border-color);
                }

                .detail-item .label {
                    font-size: 0.78rem;
                    text-transform: uppercase;
                    letter-spacing: 0.8px;
                    color: var(--text-muted);
                    font-weight: 600;
                    margin-bottom: 0.3rem;
                }

                .detail-item .value {
                    font-size: 1.05rem;
                    font-weight: 600;
                    color: var(--text-primary);
                }

                /* ===== LIST GROUP ===== */
                .list-group-item {
                    background: var(--bg-card);
                    border: 1px solid var(--border-color);
                    color: var(--text-secondary);
                    padding: 0.9rem 1.3rem;
                    transition: all var(--transition-fast);
                    font-size: 0.92rem;
                }

                .list-group-item:hover {
                    background: var(--bg-card-hover);
                    border-color: var(--border-active);
                    color: var(--text-primary);
                }

                /* ===== HERO SECTION ===== */
                .hero-section {
                    text-align: center;
                    padding: 3rem 0 2rem;
                }

                .hero-title {
                    font-size: 2.8rem;
                    font-weight: 800;
                    line-height: 1.15;
                    margin-bottom: 1rem;
                    background: linear-gradient(135deg, var(--text-primary), var(--primary-light));
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text;
                }

                .hero-subtitle {
                    font-size: 1.15rem;
                    color: var(--text-secondary);
                    max-width: 600px;
                    margin: 0 auto 2rem;
                    line-height: 1.7;
                }

                .hero-badge {
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    padding: 0.4rem 1rem;
                    background: rgba(108, 92, 231, 0.15);
                    border: 1px solid rgba(108, 92, 231, 0.3);
                    border-radius: 50px;
                    font-size: 0.82rem;
                    color: var(--primary-light);
                    font-weight: 500;
                    margin-bottom: 1.5rem;
                    animation: fadeIn 0.6s ease-out;
                }

                /* ===== FOOTER ===== */
                .footer-custom {
                    background: var(--bg-navbar);
                    backdrop-filter: blur(24px);
                    border-top: 1px solid var(--border-color);
                    padding: 1.5rem 0;
                    margin-top: auto;
                    flex-shrink: 0;
                }

                .footer-custom span {
                    color: var(--text-muted);
                    font-size: 0.85rem;
                }

                /* ===== STAT BADGES ===== */
                .stat-badge {
                    display: inline-flex;
                    align-items: center;
                    gap: 5px;
                    padding: 0.3rem 0.8rem;
                    border-radius: 50px;
                    font-size: 0.78rem;
                    font-weight: 600;
                }

                .badge-capacity {
                    background: rgba(0, 206, 201, 0.15);
                    color: var(--secondary);
                }

                .badge-price {
                    background: rgba(253, 203, 110, 0.15);
                    color: var(--warning);
                }

                /* ===== ACTION BAR ===== */
                .action-bar {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    flex-wrap: wrap;
                    gap: 1rem;
                    margin-bottom: 1.5rem;
                }

                /* ===== RESPONSIVE ===== */
                @media (max-width: 991.98px) {
                    .navbar-custom .navbar-collapse {
                        background: var(--bg-body);
                        backdrop-filter: blur(24px);
                        border-radius: var(--radius-md);
                        padding: 1rem;
                        margin-top: 0.8rem;
                        border: 1px solid var(--border-color);
                    }

                    .nav-divider {
                        display: none;
                    }

                    .nav-cta {
                        margin-left: 0;
                        margin-top: 0.5rem;
                    }
                }

                @media (max-width: 767.98px) {
                    body {
                        padding-top: 70px;
                    }

                    .hero-title {
                        font-size: 2rem;
                    }

                    .hero-subtitle {
                        font-size: 1rem;
                    }

                    .container-main {
                        margin-top: 1rem;
                    }

                    h1.mb-4 {
                        font-size: 1.6rem;
                    }

                    .page-header h1 {
                        font-size: 1.6rem;
                    }

                    .detail-grid {
                        grid-template-columns: 1fr;
                    }

                    .action-bar {
                        flex-direction: column;
                        align-items: flex-start;
                    }

                    .btn {
                        width: 100%;
                        justify-content: center;
                    }

                    .btn-sm {
                        width: auto;
                    }

                    .table>thead th {
                        font-size: 0.75rem;
                        padding: 0.75rem 0.8rem;
                    }

                    .table>tbody td {
                        font-size: 0.82rem;
                        padding: 0.75rem 0.8rem;
                    }
                }

                @media (max-width: 575.98px) {
                    .hero-title {
                        font-size: 1.65rem;
                    }

                    .feature-card {
                        padding: 1.5rem;
                    }

                    .card-body {
                        padding: 1.2rem;
                    }
                }

                /* ===== STAGGER ANIMATION ===== */
                .stagger-1 {
                    animation-delay: 0.1s;
                }

                .stagger-2 {
                    animation-delay: 0.2s;
                }

                .stagger-3 {
                    animation-delay: 0.3s;
                }

                .stagger-4 {
                    animation-delay: 0.4s;
                }

                .fade-up {
                    animation: fadeInUp 0.5s ease-out both;
                }

                /* ===== SMOOTH TRANSITIONS between themes ===== */
                * {
                    transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease;
                }
            </style>
        </head>

        <body>

            <!-- Navigation -->
            <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
                <div class="container">
                    <a class="navbar-brand" href="/accueil">
                        <span class="navbar-brand-icon"><i class="bi bi-building"></i></span>
                        RéservaSalle
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-auto align-items-lg-center">
                            <li class="nav-item">
                                <a class="nav-link" href="/salles"><i class="bi bi-door-open me-1"></i>Salles</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/utilisateurs"><i
                                        class="bi bi-people me-1"></i>Utilisateurs</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/reservations"><i
                                        class="bi bi-calendar-check me-1"></i>Réservations</a>
                            </li>
                            <li class="d-none d-lg-block">
                                <div class="nav-divider"></div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link nav-cta" href="/reservations/ajouter"><i
                                        class="bi bi-plus-lg me-1"></i>Réserver</a>
                            </li>
                            <li class="nav-item d-flex align-items-center">
                                <button class="theme-toggle" id="themeToggle" title="Changer de thème"
                                    aria-label="Changer de thème">
                                    <i class="bi bi-sun-fill" id="themeIcon"></i>
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- Main Content -->
            <div class="container-main container">