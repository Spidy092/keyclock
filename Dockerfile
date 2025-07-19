FROM quay.io/keycloak/keycloak:24.0.1

# Set environment variables
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin123

ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-d1rra3be5dus73c4aje0-a:5432/keycloak_osu4
ENV KC_DB_USERNAME=keycloak
ENV KC_DB_PASSWORD=jxr0uz7EAo3JQDY5z5reWFLWWaiTK5Hf

# TLS setup
ENV KC_HTTPS_CERTIFICATE_FILE=/opt/keycloak/conf/keycloak.p12
ENV KC_HTTPS_CERTIFICATE_KEY_STORE_PASSWORD=password
ENV KC_HTTPS_CERTIFICATE_KEY_STORE_TYPE=PKCS12
ENV KC_HTTPS_CERTIFICATE_KEY_STORE_ALIAS=keycloak

# Disable Liquibase checksum validation
ENV KC_FEATURES=preview

# Enable HTTPS and proxy
ENV KC_HTTPS_PORT=8443
ENV KC_HTTP_ENABLED=false
ENV KC_PROXY=edge
ENV KC_HOSTNAME=keyclock-zgu6.onrender.com
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_CACHE=local

# Copy the certificate into container
COPY keycloak.p12 /opt/keycloak/conf/

# Build Keycloak
RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8443

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--spi-changelog-checks-validate-on-startup=false"]
