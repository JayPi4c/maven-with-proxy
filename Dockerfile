FROM maven:3.8.6-eclipse-temurin-17-alpine

COPY settings.template.xml /usr/share/maven/ref/settings.template.xml
COPY *.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]