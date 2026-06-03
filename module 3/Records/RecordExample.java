import java.util.*;
import java.util.stream.*;

// Define record
record Person(String name, int age) {}

public class RecordExample {
    public static void main(String[] args) {

        // Create instances
        Person p1 = new Person("Ravi", 22);
        Person p2 = new Person("Sita", 17);
        Person p3 = new Person("Arjun", 25);

        // Print individual records
        System.out.println("Individual Records:");
        System.out.println(p1);
        System.out.println(p2);
        System.out.println(p3);

        // Store in list
        List<Person> people = Arrays.asList(p1, p2, p3);

        // Filter people with age >= 18
        List<Person> adults = people.stream()
                                   .filter(p -> p.age() >= 18)
                                   .collect(Collectors.toList());

        // Display filtered result
        System.out.println("\nAdults (age >= 18):");
        for (Person p : adults) {
            System.out.println(p);
        }
    }
}