# Build stage
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /build
COPY pom.xml . 
RUN mvn dependency:go-offline 
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime stage
FROM amazoncorretto:17 
ARG PROFILE=dev
ARG APP_VERSION=0.0.1

WORKDIR /app
COPY --from=build /build/target/EDeliver-backend-*.jar /app/

EXPOSE 9090

ENV DB_URL=jdbc:mysql://mysql-server:3306/edeliver
ENV ACTIVE_PROFILE=${PROFILE}
ENV JAR_VERSION=${APP_VERSION}

CMD java -jar -Dspring.profiles.active=${ACTIVE_PROFILE} -Dspring.datasource.url=${DB_URL} EDeliver-backend-${JAR_VERSION}-SNAPSHOT.jar 