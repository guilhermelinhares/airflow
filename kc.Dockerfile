FROM quay.io/keycloak/keycloak:22.0.3 as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# ENV DB=postgres

WORKDIR /opt/keycloak
# for demonstration purposes only, please make sure to use proper certificates in production instead
# RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:keycloak,IP:127.0.0.1" -keystore conf/server.keystore

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:22.0.3
ENV TZ=America/Fortaleza

COPY --from=builder /opt/keycloak/ /opt/keycloak/

WORKDIR /opt/keycloak

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]