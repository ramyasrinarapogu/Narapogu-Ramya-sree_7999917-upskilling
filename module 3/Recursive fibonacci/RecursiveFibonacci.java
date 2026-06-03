import java.util.Scanner;

public class RecursiveFibonacci {

    // Recursive method
    public static int fibonacci(int n) {
        if (n == 0) {
            return 0;
        } else if (n == 1) {
            return 1;
        } else {
            return fibonacci(n - 1) + fibonacci(n - 2);
        }
    }

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a positive integer: ");
        int n = sc.nextInt();

        int result = fibonacci(n);

        System.out.println("Fibonacci number at position " + n + " is: " + result);
    }
}