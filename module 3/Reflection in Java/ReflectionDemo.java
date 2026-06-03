import java.lang.reflect.Method;
import java.lang.reflect.Parameter;

class Student {

    public void display(String name) {
        System.out.println("Student Name: " + name);
    }

    public void showAge(int age) {
        System.out.println("Age: " + age);
    }
}

public class ReflectionDemo {

    public static void main(String[] args) {

        try {

            // Load class dynamically
            Class<?> cls = Class.forName("Student");

            System.out.println("Methods in Student class:");

            Method[] methods = cls.getDeclaredMethods();

            for (Method method : methods) {

                System.out.println("\nMethod Name: " + method.getName());

                Parameter[] params = method.getParameters();

                for (Parameter p : params) {
                    System.out.println("Parameter Type: "
                            + p.getType().getSimpleName());
                }
            }

            // Create object dynamically
            Object obj = cls.getDeclaredConstructor().newInstance();

            // Invoke method dynamically
            Method m = cls.getDeclaredMethod("display", String.class);

            System.out.println("\nInvoking display() using Reflection:");
            m.invoke(obj, "John");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}