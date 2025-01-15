# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the Maven wrapper files to the container
COPY mvnw .
COPY .mvn/ .mvn/

# Copy the rest of the project files
COPY pom.xml .
COPY src ./src

# Grant execution permissions to the Maven wrapper
RUN chmod +x mvnw

# Package the application using Maven
RUN ./mvnw -B package

# Expose the application port
EXPOSE 8080


COPY target/Welcome-Test-0.0.1-SNAPSHOT.jar app.jar
# Run the application
CMD ["java", "-jar", "app.jar"]
