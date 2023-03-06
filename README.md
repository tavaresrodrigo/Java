# Java HelloWorld container  

This is a simple HTTP server that responds with "Hello, World!" written in Java.

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
      String response = "Hello, World!\n";
      exchange.sendResponseHeaders(200, response.length());
      OutputStream os = exchange.getResponseBody();
      os.write(response.getBytes());
      os.close();
    }));
    server.start();
  }
}
```


## Running the program 

The commands below will execute the java program on your Operating System.

### Clone the repository 
```console
$ git clone https://github.com/tavaresrodrigo/Java.git
$ cd Java
```

### Compile the code.

```console
$ javac HelloWorld.java
```

### Run the program

```console
$ java HelloWorld
```

## Build and run the Linux container
The commands below will build a container and run it in background mapping the port 8080 from your Desktop to the 8080 container port. 

### Build the container.

```console
$ docker build -t my-java-app .
```

### Run the container.

```console
$ docker run -d -p 8080:8080 --rm my-java-app
```

### Test the web server.

```console 
$ curl localhost:8080
Hello, World!``` 
```