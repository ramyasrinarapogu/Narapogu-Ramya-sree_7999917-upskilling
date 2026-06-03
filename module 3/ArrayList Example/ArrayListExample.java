import java.util.ArrayList;
import java.util.Scanner;

public class ArrayListExample {
    public static void main(String[] args) {

        ArrayList<String> students = new ArrayList<>();
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of students: ");
        int n = sc.nextInt();
        sc.nextLine(); // consume newline

        // Add names
        for (int i = 0; i < n; i++) {
            System.out.print("Enter name " + (i + 1) + ": ");
            String name = sc.nextLine();
            students.add(name);
        }

        // Display names
        System.out.println("\nStudent Names:");
        for (String name : students) {
            System.out.println(name);
        }
    }
}