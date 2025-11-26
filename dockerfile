# Lavalink braucht Java 17
FROM openjdk:17-jdk-slim

# Arbeitsverzeichnis
WORKDIR /app

# Kopiere alles ins Image
COPY . .

# Expose (Render nutzt PORT-Umgebungsvariable)
ENV PORT=2333
EXPOSE ${PORT}

# Startbefehl
CMD ["java", "-jar", "Lavalink.jar"]
