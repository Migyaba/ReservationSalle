<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    </div>

    <!-- Footer -->
    <footer class="footer-custom">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 text-center text-md-start">
                    <span>&copy; 2026 <strong style="color: var(--primary-light);">RéservaSalle</strong> &mdash; Master
                        1 IFRI</span>
                </div>
                <div class="col-md-6 text-center text-md-end mt-2 mt-md-0">
                    <span>Fait par Miguel D. et Déo-Gracias F.</span>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // ===== Active nav link highlight =====
            var path = window.location.pathname;
            document.querySelectorAll('.navbar-custom .nav-link').forEach(function (link) {
                var href = link.getAttribute('href');
                if (href && href !== '/accueil' && path.startsWith(href)) {
                    link.classList.add('active');
                }
            });

            // ===== Theme Toggle =====
            var html = document.documentElement;
            var themeToggle = document.getElementById('themeToggle');
            var themeIcon = document.getElementById('themeIcon');

            // Load saved theme
            var savedTheme = localStorage.getItem('theme') || 'dark';
            html.setAttribute('data-theme', savedTheme);
            updateIcon(savedTheme);

            themeToggle.addEventListener('click', function () {
                var current = html.getAttribute('data-theme');
                var next = current === 'dark' ? 'light' : 'dark';
                html.setAttribute('data-theme', next);
                localStorage.setItem('theme', next);
                updateIcon(next);
            });

            function updateIcon(theme) {
                if (theme === 'dark') {
                    themeIcon.className = 'bi bi-sun-fill';
                    themeToggle.title = 'Passer en mode clair';
                } else {
                    themeIcon.className = 'bi bi-moon-fill';
                    themeToggle.title = 'Passer en mode sombre';
                }
            }
        });
    </script>
    </body>

    </html>