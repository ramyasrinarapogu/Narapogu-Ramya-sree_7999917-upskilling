import java.util.*;

public class LambdaSortExample {
    public static void main(String[] args) {

        // Create list
        List<String> names = new ArrayList<>();
        names.add("Ravi");
        names.add("Sita");
        names.add("Arjun");
        names.add("Kiran");

        // Sort using lambda
        Collections.sort(names, (a, b) -> a.compareTo(b));

        // Display sorted list
        System.out.println("Sorted Names:");
        for (String name : names) {
            System.out.println(name);
        }
    }
}