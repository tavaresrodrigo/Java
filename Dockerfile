FROM ubi8/openjdk-17
COPY . /deployments
WORKDIR /deployments
RUN javac HelloWorld.java; jar cvfe HelloWorld.jar HelloWorld HelloWorld.class
EXPOSE 8080
CMD ["java", "-jar", "HelloWorld.jar"]
