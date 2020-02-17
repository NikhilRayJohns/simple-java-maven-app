FROM ubuntu:16.04
RUN apt-get update && \
    apt-get -y install openjdk-8-jdk && \
    apt-get -y install curl
EXPOSE 8082
ARG JAR_FILE=target/my-app-1.0-SNAPSHOT.jar
ADD ${JAR_FILE} my-app-1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/my-app-1.0-SNAPSHOT.jar"]
