import java.util.*;
import java.util.stream.*;

public class StreamExample {
    public static void main(String[] args) {

        // Create list
        List<Integer> numbers = Arrays.asList(10, 15, 20, 25, 30, 35, 40);

        // Filter even numbers using Stream API
        List<Integer> evenNumbers = numbers.stream()
                                           .filter(n -> n % 2 == 0)
                                           .collect(Collectors.toList());

        // Display result
        System.out.println("Even Numbers:");
        for (int num : evenNumbers) {
            System.out.println(num);
        }
    }
}