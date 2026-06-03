import java.io.*;
import java.net.*;

class Server {

    public static void main(String[] args) {

        try {
            ServerSocket serverSocket = new ServerSocket(5000);

            System.out.println("Server started...");
            System.out.println("Waiting for client...");

            Socket socket = serverSocket.accept();

            System.out.println("Client connected!");

            BufferedReader clientInput = new BufferedReader(
                    new InputStreamReader(socket.getInputStream()));

            PrintWriter serverOutput = new PrintWriter(
                    socket.getOutputStream(), true);

            BufferedReader keyboard = new BufferedReader(
                    new InputStreamReader(System.in));

            while (true) {

                String clientMessage = clientInput.readLine();

                if (clientMessage == null ||
                        clientMessage.equalsIgnoreCase("exit")) {
                    break;
                }

                System.out.println("Client: " + clientMessage);

                System.out.print("Server: ");
                String serverMessage = keyboard.readLine();

                serverOutput.println(serverMessage);

                if (serverMessage.equalsIgnoreCase("exit")) {
                    break;
                }
            }

            socket.close();
            serverSocket.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}

class Client {

    public static void main(String[] args) {

        try {

            Socket socket = new Socket("localhost", 5000);

            System.out.println("Connected to Server!");

            BufferedReader serverInput = new BufferedReader(
                    new InputStreamReader(socket.getInputStream()));

            PrintWriter clientOutput = new PrintWriter(
                    socket.getOutputStream(), true);

            BufferedReader keyboard = new BufferedReader(
                    new InputStreamReader(System.in));

            while (true) {

                System.out.print("Client: ");
                String clientMessage = keyboard.readLine();

                clientOutput.println(clientMessage);

                if (clientMessage.equalsIgnoreCase("exit")) {
                    break;
                }

                String serverMessage = serverInput.readLine();

                System.out.println("Server: " + serverMessage);

                if (serverMessage.equalsIgnoreCase("exit")) {
                    break;
                }
            }

            socket.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}