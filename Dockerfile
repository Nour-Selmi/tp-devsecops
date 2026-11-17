
FROM eclipse-temurin:21-jdk-jammy

# Create a dedicated non-root user
RUN groupadd -r appgroup && \
    useradd -r -g appgroup appuser

# Set working directory
WORKDIR /app

# Copy the application JAR
COPY target/democyber-0.0.1-SNAPSHOT.jar app.jar

# Give ownership of the application directory to appuser
RUN chown -R appuser:appgroup /app

# Expose application port
EXPOSE 8080

# Run the application as a non-root user
USER appuser

# Start the Java application
ENTRYPOINT ["java", "-jar", "app.jar"]
