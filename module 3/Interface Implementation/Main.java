// Interface
interface Playable {
    void play();
}

// Guitar class implementing interface
class Guitar implements Playable {
    public void play() {
        System.out.println("Guitar is playing 🎸");
    }
}

// Piano class implementing interface
class Piano implements Playable {
    public void play() {
        System.out.println("Piano is playing 🎹");
    }
}

public class Main {
    public static void main(String[] args) {

        // Create objects
        Guitar g = new Guitar();
        Piano p = new Piano();

        // Call methods
        g.play();
        p.play();
    }
}