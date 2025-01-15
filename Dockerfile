# Use a base image with Java 17
FROM openjdk:17-jdk-alpine

EXPOSE 8080

# Set the working directory in the container
WORKDIR /app

# Copy the Maven wrapper files to the container
COPY mvnw .
COPY .mvn/ .mvn/
COPY pom.xml .

# Build the application using Maven
RUN ./mvnw package -DskipTests

# Copy the built JAR file to the container
COPY target/Welcome-Test-0.0.1-SNAPSHOT.jar app.jar

# Expose the port on which the application runs
EXPOSE 8080

# Define the command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]