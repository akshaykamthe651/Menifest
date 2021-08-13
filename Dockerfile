FROM openjdk:8

ADD ./target/java-maven-junit-helloworld-2.0-SNAPSHOT.jar  java-maven-junit-helloworld-2.0-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","java-maven-junit-helloworld-2.0-SNAPSHOT.jar"]
					
