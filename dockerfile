# Lavalink Dockerfile für Render
# Läuft mit Java 17, baut Lavalink automatisch

# Basis-Image mit Java 17
FROM eclipse-temurin:17-jdk-jammy

# Arbeitsverzeichnis
WORKDIR /app

# Git installieren für das Clonen
RUN apt-get update && \
    apt-get install -y git wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Lavalink clonen
RUN git clone https://github.com/lavalink-devs/Lavalink.git /app/Lavalink

# Ins Verzeichnis wechseln und bauen
WORKDIR /app/Lavalink
RUN ./gradlew build -x test

# Env Vars für Lavalink konfigurieren
ENV LAVALINK_HOME=/app/Lavalink
ENV SERVER_PORT=2333
ENV LAVALINK_PASSWORD=yoursecretpassword

# Standard Port expose
EXPOSE 2333

# Startbefehl
CMD ["java", "-jar", "/app/Lavalink/build/libs/Lavalink.jar"]
