# Lavalink braucht Java 17
FROM eclipse-temurin:17-jdk-jammy

# Arbeitsverzeichnis
WORKDIR /app

# Kopiere alles ins Image
COPY . .

# Expose (Render nutzt PORT-Umgebungsvariable)
ENV PORT=2333
EXPOSE ${PORT}

# Startbefehl
CMD ["java", "-jar", "Lavalink.jar"]
