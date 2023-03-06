FROM ubi8/openjdk-17
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
ENV JAVA_APP_JAR HelloWorld.jar
ENV JAVA_MAIN_CLASS HelloWorld
EXPOSE 8080
CMD ["java", "-jar", "HelloWorld.jar"]
