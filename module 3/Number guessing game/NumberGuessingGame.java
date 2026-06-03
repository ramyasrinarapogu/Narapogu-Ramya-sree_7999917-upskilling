import java.util.Scanner;
import java.util.Random;

public class NumberGuessingGame {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        Random rand = new Random();

        int randomNumber = rand.nextInt(100) + 1; // 1 to 100
        int guess = 0;

        while (guess != randomNumber) {

            System.out.print("Enter your guess (1-100): ");
            guess = sc.nextInt();

            if (guess > randomNumber) {
                System.out.println("Too high! Try again.");
            } else if (guess < randomNumber) {
                System.out.println("Too low! Try again.");
            } else {
                System.out.println("Correct! You guessed the number.");
            }
        }

    }
}