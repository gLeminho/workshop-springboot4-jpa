# Estágio 1: Compilar o projeto usando o Maven
FROM maven:3-eclipse-temurin-26 AS build
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests

# Estágio 2: Rodar o projeto compilado
FROM eclipse-temurin:26-jre
WORKDIR /app
COPY --from=build /app/target/course-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]