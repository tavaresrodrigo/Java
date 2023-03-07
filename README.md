# Java HelloWorld read-only container  

This is a simple Linux container that runs an HTTP server written in Java. The server responds to any requests to the root URL (/) with the message: "Hello, World! I'm a Java web application running in a Linux container :)". 

## Why read-only containers?

Read-only containers consist in making the root filesystem read-only, to prevent any changes from being made to the container's file system, it can help enforce the principle of immutable infrastructure, where the container is treated as disposable and replaced with a new instance whenever an update is needed. 

This can help reduce the risk of configuration drift and ensure that the container is always running the what was defined in the container image. Overall, read-only containers provide an additional layer of security and can help improve the reliability and consistency of containerized applications.

## Source code

This is the source code of the program:

```java
import java.io.IOException;
import java.io.OutputStream;
import com.sun.net.httpserver.HttpServer;

public class HelloWorld {
  public static void main(String[] args) throws IOException {
    HttpServer server = HttpServer.create();
    server.bind(new java.net.InetSocketAddress(8080), 0);
    server.createContext("/", (exchange -> {
      String response = "Hello, World! I'm a Java web application running in a Linux container :)\n";
      exchange.sendResponseHeaders(200, response.length());
      OutputStream os = exchange.getResponseBody();
      os.write(response.getBytes());
      os.close();
    }));
    server.start();
  }
}
```


## Build and Run the container
The commands below will build a container and run it in background mapping the port 8080 from your Desktop to the 8080 container port. 

### Clone the repository 
```console
$ git clone https://github.com/tavaresrodrigo/Java.git
$ cd helloJava
```

### Build the container.

```shell
$ docker build -t my-java-app .
```

### Run the container in read-only mode.

```shell
$ docker run -d -p 8080:8080 --name readonly --read-only --tmpfs=/run --tmpfs=/tmp my-java-app
```

### Test the web server.

```shell 
$ curl localhost:8080
Hello, World! I'm a Java web application running in a Linux container :)``` 
```

## Deploy it on Openshift.

To be able to deploy a read-only container in openshift we will need to create a Service Account and a SCC(Security Context Constraints). 

### Security Context Constraints

This SCC will enable the readOnlyRootFilesystem so the root filesystem of the container will be mounted as read-only. 

```shell
apiVersion: security.openshift.io/v1
kind: SecurityContextConstraints
metadata:
  name: readOnlyFS
readOnlyRootFilesystem: true
```

```shell
$ oc create -f scc.yaml
```

### Service account 

After the SCC is created we can create the Service Account and assigned the readOnlyFS SCC it.

``` shell
$ oc create sa readonly
```

Now we can create the deployment with the new service account.

```shell
oc new-app registry.redhat.io/ubi8/openjdk-17~https://github.com/tavaresrodrigo/helloJava -e JAVA_APP_JAR=HelloWorld.jar -e JAVA_MAIN_CLASS=HelloWorld --strategy=docker 

```
