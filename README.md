# Java HelloWorld container  

This is a simple Linux container that runs an HTTP server written in Java. The server responds to any requests to the root URL (/) with the message: "Hello, World! I'm a Java web application running in a Linux container :)". 

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
$ cd Java
```

### Build the container.

```shell
$ docker build -t my-java-app .
```

### Run the container.

```shell
$ docker run -d -p 8080:8080 --rm my-java-app
```

### Test the web server.

```shell 
$ curl localhost:8080
Hello, World! I'm a Java web application running in a Linux container :)``` 
```