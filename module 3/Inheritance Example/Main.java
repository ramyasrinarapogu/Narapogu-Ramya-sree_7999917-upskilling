// Base class
class Animal {
    void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

// Subclass (inherits Animal)
class Dog extends Animal {
    // Overriding method
    void makeSound() {
        System.out.println("Bark");
    }
}

public class Main {
    public static void main(String[] args) {

        // Create Animal object
        Animal a = new Animal();
        a.makeSound();

        // Create Dog object
        Dog d = new Dog();
        d.makeSound();
    }
}