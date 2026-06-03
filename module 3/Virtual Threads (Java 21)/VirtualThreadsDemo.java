public class VirtualThreadsDemo {

    public static void main(String[] args) throws InterruptedException {

        int threadCount = 100000;

        // Virtual Threads
        long startVirtual = System.currentTimeMillis();

        Thread[] virtualThreads = new Thread[threadCount];

        for (int i = 0; i < threadCount; i++) {
            int id = i;

            virtualThreads[i] = Thread.startVirtualThread(() -> {
                System.out.println("Virtual Thread " + id);
            });
        }

        for (Thread t : virtualThreads) {
            t.join();
        }

        long endVirtual = System.currentTimeMillis();

        System.out.println("\nVirtual Threads Time: "
                + (endVirtual - startVirtual) + " ms");

        // Platform (Traditional) Threads
        long startPlatform = System.currentTimeMillis();

        Thread[] platformThreads = new Thread[1000];

        for (int i = 0; i < 1000; i++) {
            int id = i;

            platformThreads[i] = new Thread(() -> {
                System.out.println("Platform Thread " + id);
            });

            platformThreads[i].start();
        }

        for (Thread t : platformThreads) {
            t.join();
        }

        long endPlatform = System.currentTimeMillis();

        System.out.println("\nPlatform Threads Time: "
                + (endPlatform - startPlatform) + " ms");
    }
}