FROM quay.io/keycloak/keycloak:24.0.1

# Admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin123

# Database connection
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-d1rra3be5dus73c4aje0-a:5432/keycloak_osu4
ENV KC_DB_USERNAME=keycloak
ENV KC_DB_PASSWORD=jxr0uz7EAo3JQDY5z5reWFLWWaiTK5Hf

# Proxy + hostname config for Render
ENV KC_HTTP_ENABLED=true
ENV KC_HTTPS_ENABLED=false
ENV KC_PROXY=edge
ENV KC_HOSTNAME=keyclock-zgu6.onrender.com
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false

RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]
