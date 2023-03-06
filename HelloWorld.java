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