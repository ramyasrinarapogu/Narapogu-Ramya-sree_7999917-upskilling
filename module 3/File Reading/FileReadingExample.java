import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class FileReadingExample {
    public static void main(String[] args) {

        try {
            // Open file
            File file = new File("output.txt");

            // Read file
            Scanner reader = new Scanner(file);

            System.out.println("File contents:");

            while (reader.hasNextLine()) {
                String line = reader.nextLine();
                System.out.println(line);
            }

            reader.close();

        } catch (FileNotFoundException e) {
            System.out.println("Error: File not found!");
        }
    }
}