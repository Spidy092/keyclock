FROM quay.io/keycloak/keycloak:latest

# Admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin123

# Database configuration
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-d1rra3be5dus73c4aje0-a:5432/keycloak_osu4
ENV KC_DB_USERNAME=keycloak
ENV KC_DB_PASSWORD=jxr0uz7EAo3JQDY5z5reWFLWWaiTK5Hf

# Allow HTTP (disable HTTPS for dev)
ENV KC_HTTP_ENABLED=true

# Build Keycloak
RUN /opt/keycloak/bin/kc.sh build

# Expose port
EXPOSE 8080

# Start Keycloak in dev mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]
