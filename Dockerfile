FROM ubi8/openjdk-17
COPY . /deployments
WORKDIR /deployments
RUN ls
RUN javac HelloWorld.java; jar cvfe HelloWorld.jar HelloWorld HelloWorld.class
ENV JAVA_APP_JAR HelloWorld.jar
EXPOSE 8080
CMD [ "/opt/jboss/container/java/run/run-java.sh" ]