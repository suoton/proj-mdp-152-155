# Dockerfile
FROM maven:3.6.3-jdk-8 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:9.0
COPY --from=builder /app/target/WebAppCal-1.3.5.war /usr/local/tomcat/webapps/
