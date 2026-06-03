public class TypeCastingExample {
    public static void main(String[] args) {
        double decimalNumber = 45.78;
        int wholeNumber = (int) decimalNumber;

        System.out.println("Original double value: " + decimalNumber);
        System.out.println("After casting to int: " + wholeNumber);
        int number = 20;
        double convertedNumber = number;

        System.out.println("Original int value: " + number);
        System.out.println("After casting to double: " + convertedNumber);
    }
}