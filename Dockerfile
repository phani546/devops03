FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 8000
ADD target/*.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar -Dspring.config.location=/config/application-sbx.properties -Dspring.username=$CONFIG_USERNAME -Dspring.password=$CONFIG_PASSWORD /app.jar"]
