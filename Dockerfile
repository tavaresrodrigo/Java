FROM ubi8/openjdk-17
COPY . /deployments
WORKDIR /deployments
RUN javac /deployments/HelloWorld.java; jar cvfe /deployments/HelloWorld.jar HelloWorld HelloWorld.class
RUN ls /deployments
ENV JAVA_APP_JAR HelloWorld.jar
EXPOSE 8080
CMD [ "/opt/jboss/container/java/run/run-java.sh" ]