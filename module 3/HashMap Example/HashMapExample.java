import java.util.HashMap;
import java.util.Scanner;

public class HashMapExample {
    public static void main(String[] args) {

        HashMap<Integer, String> students = new HashMap<>();
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of students: ");
        int n = sc.nextInt();

        // Add entries
        for (int i = 0; i < n; i++) {
            System.out.print("Enter student ID: ");
            int id = sc.nextInt();
            sc.nextLine(); // consume newline

            System.out.print("Enter student name: ");
            String name = sc.nextLine();

            students.put(id, name);
        }

        // Retrieve by ID
        System.out.print("\nEnter ID to search: ");
        int searchId = sc.nextInt();

        if (students.containsKey(searchId)) {
            System.out.println("Student Name: " + students.get(searchId));
        } else {
            System.out.println("Student not found!");
        }
    }
}