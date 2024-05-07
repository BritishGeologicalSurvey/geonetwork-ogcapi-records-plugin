FROM geonetwork/gn-cloud-ogc-api-records-service:4.4.3-0

COPY customisation/application.yml ogcapiconfig/.     
COPY customisation/bootstrap.yml ogcapiconfig/.  

ENV SPRING_PROFILES_ACTIVE=standalone \
    SPRING_DATASOURCE_URL=jdbc:postgresql://${DB_HOST}:${POSTGRES_CONTAINER_PORT}/${POSTGRES_DATABASE_NAME_V4} \
    SPRING_DATASOURCE_USERNAME=postgres \
    SPRING_DATASOURCE_PASSWORD=${POSTGRES_PASSWORD} \
    SPRING_CONFIG_LOCATION=/ogcapiconfig/ \
    GN_BASEURL=${ES_PROTOCOL}://${APP_HOSTNAME}/geonetwork/api \
    GN_LEGACY_URL=${ES_PROTOCOL}://${APP_HOSTNAME}/geonetwork \
    GN_INDEX_URL=${ES_PROTOCOL}://${ELASTIC_HOST}:${ES_CONTAINER_PORT} \
    GN_INDEX_RECORDS=${INDEX_NAME} \
    GN_INDEX_USERNAME=elastic \
    GN_INDEX_PASSWORD=${ELASTIC_PASSWORD} \
    SERVER_FORWARDHEADERSSTRATEGY=FRAMEWORK \
    JAVA_OPTS=-Dfile.encoding=UTF-8 