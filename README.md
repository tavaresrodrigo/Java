# Hello world with Java :coffee:

This is a simple HTTP Server **"Hello world"** written in **Java**.

## Source code

This is the source code of the program:

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```


## Do it at your end

```console
git clone https://github.com/tavaresrodrigo/Java.git
cd Java
```

Compile the code.

```console
javac HelloWorld.java
```

## Run the program

Execute the program HelloWorld.

```console
java HelloWorld
```

## Linux container

Build a container.

```console
docker build -t my-java-app .
```

Run the container.

```console
docker run -d -p 8080:8080 --rm my-java-app
```

Test the web server.

```console 
$ curl localhost:8080
Hello, World!``` 
```