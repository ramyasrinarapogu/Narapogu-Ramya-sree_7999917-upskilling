public class DecompileDemo {

    public int multiply(int a, int b) {
        return a * b;
    }

    public static void main(String[] args) {
        DecompileDemo obj = new DecompileDemo();

        int result = obj.multiply(5, 4);

        System.out.println("Result = " + result);
    }
}