# Utiliser une image de base officielle avec Java 21 (ou 17 selon votre version)
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /workspace/app

# Copier les fichiers de configuration Maven
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Télécharger les dépendances (pour utiliser le cache Docker)
RUN ./mvnw dependency:go-offline

# Copier le code source
COPY src src

# Construire l'application sans lancer les tests pour accélérer
RUN ./mvnw install -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

# Étape finale : Créer l'image d'exécution légère
FROM eclipse-temurin:21-jre-alpine
VOLUME /tmp
ARG DEPENDENCY=/workspace/app/target/dependency

# Copier les dépendances et le code compilé depuis l'étape de build
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

# Point d'entrée pour lancer l'application (Supporte la variable $PORT de Render)
ENTRYPOINT ["java","-cp","app:app/lib/*","com.reservationsalles.ReservationSallesApplication"]
