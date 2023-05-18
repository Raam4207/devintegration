FROM openjdk:8
EXPOSE 8080
ADD target/devintegration.jar devintegration.jar
ENTRYPOINT ["java","-jar","/devintegration.jar"]
