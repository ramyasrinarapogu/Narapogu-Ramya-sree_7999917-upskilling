import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class FileWritingExample {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter some text: ");
        String data = sc.nextLine();

        try {
            FileWriter writer = new FileWriter("output.txt");
            writer.write(data);
            writer.close();

            System.out.println("Data successfully written to output.txt");

        } catch (IOException e) {
            System.out.println("Error writing to file!");
        }
    }
}