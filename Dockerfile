FROM maven:3.9.0-eclipse-temurin-17-alpine

COPY settings.template.xml /usr/share/maven/ref/settings.template.xml
COPY *.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]