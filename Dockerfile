FROM openjdk:17
COPY target/task-api.jar task-api.jar
ENTRYPOINT ["java", "-jar", "task-api.jar"]