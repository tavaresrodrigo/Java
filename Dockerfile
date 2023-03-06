FROM ubi8/openjdk-17
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac HelloWorld.java
EXPOSE 8080
CMD ["java", "HelloWorld"]
