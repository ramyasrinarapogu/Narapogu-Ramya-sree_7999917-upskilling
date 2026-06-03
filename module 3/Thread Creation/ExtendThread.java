class MyThread extends Thread {
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Thread 1 is running: " + i);
        }
    }
}

class MyThread2 extends Thread {
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Thread 2 is running: " + i);
        }
    }
}

public class ExtendThread {
    public static void main(String[] args) {

        MyThread t1 = new MyThread();
        MyThread2 t2 = new MyThread2();

        t1.start(); // start thread 1
        t2.start(); // start thread 2
    }
}