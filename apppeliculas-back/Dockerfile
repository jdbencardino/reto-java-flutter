FROM openjdk:8-jdk-alpine

EXPOSE 8080

ARG JAR_FILE=target/apppeliculas-*.jar

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]

RUN mkdir -p /Users/santiagolondono

COPY resources /Users/santiagolondono