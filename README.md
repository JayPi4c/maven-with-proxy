# Maven-with-Proxy

This project is inspired by the following [GitHub repository](https://github.com/alirizasaral/Maven-with-Proxy) and [this](https://stackoverflow.com/a/45892901) StackOverflow answer. Minor changes had to be made in order to make the scripts working with a Java 17 implementation of Maven.


## How to use

This project was made to be used in gitlab-ci.yml scripts. Other environmonts are also perfectly fine, although the scripts are not tested in them.

```yml
image: docker:latest
services:
  - docker:dind

stages:
  - build

maven-build:
  image: jaypi4c/maven-with-proxy:3.9.0-eclipse-temurin-17-alpine
  variables: 
    PROXY_HOST: $PROXY_HOST
    PROXY_PORT: $PROXY_PORT
  stage: build
  script: "mvn package -B"
  artifacts:
    paths:
      - target/*.jar
  tags:
    - docker
```

The variables PROXY_HOST and PROXY_PORT are set in the GitLab CI/CD settings.

All supported Environment Variables are:
- `PROXY_PROTOCOL`
- `PROXY_USER`
- `PROXY_PASS`
- `PROXY_HOST`
- `PROXY_PORT`
- `NO_PROXY`
