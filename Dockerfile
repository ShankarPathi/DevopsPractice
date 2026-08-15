FROM eclipse-temurin:21-jdk
LABEL maintainer="Shankar Pathi"
COPY target/spring-boot-docker-app.jar  /usr/app/
WORKDIR /usr/app/
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "spring-boot-docker-app.jar"]

