import java.sql.*;

public class TransactionDemo {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/bank";
        String user = "root";
        String password = "Siri@123"; // change this

        Connection con = null;

        try {
            // 1. Connect
            con = DriverManager.getConnection(url, user, password);

            // 2. Turn OFF auto commit (IMPORTANT)
            con.setAutoCommit(false);

            System.out.println("💳 Transaction Started...");

            // Transfer details
            int fromAccount = 1;
            int toAccount = 2;
            int amount = 1000;

            // 3. Debit query
            PreparedStatement debit = con.prepareStatement(
                "UPDATE accounts SET balance = balance - ? WHERE id = ?"
            );
            debit.setInt(1, amount);
            debit.setInt(2, fromAccount);

            int debitResult = debit.executeUpdate();

            // 4. Credit query
            PreparedStatement credit = con.prepareStatement(
                "UPDATE accounts SET balance = balance + ? WHERE id = ?"
            );
            credit.setInt(1, amount);
            credit.setInt(2, toAccount);

            int creditResult = credit.executeUpdate();

            // 5. Check both operations
            if (debitResult == 1 && creditResult == 1) {

                con.commit();
                System.out.println("✅ Transaction Successful!");
                System.out.println("₹" + amount + " transferred from Account " + fromAccount + " to " + toAccount);

            } else {

                con.rollback();
                System.out.println("❌ Transaction Failed. Rolled Back!");
            }

            // 6. Show final balances
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM accounts");

            System.out.println("\n📌 Final Account Balances:");
            while (rs.next()) {
                System.out.println(
                    rs.getInt("id") + " | " +
                    rs.getString("name") + " | " +
                    rs.getInt("balance")
                );
            }

        } catch (Exception e) {

            try {
                if (con != null) {
                    con.rollback(); // safety rollback
                    System.out.println("⚠ Error occurred. Transaction Rolled Back!");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            e.printStackTrace();

        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}