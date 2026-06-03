import java.sql.*;

public class JDBCExample {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/college";
        String user = "root";
        String password = "Siri@123"; // CHANGE THIS

        Connection con = null;

        try {
            // 1. Connect
            con = DriverManager.getConnection(url, user, password);

            System.out.println("✅ Database Connected Successfully!");

            // 2. SELECT QUERY
            String query = "SELECT * FROM students";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            System.out.println("\n📌 Student Records:");

            while (rs.next()) {
                System.out.println(
                    rs.getInt("id") + " | " +
                    rs.getString("name") + " | " +
                    rs.getInt("age")
                );
            }

            // 3. INSERT QUERY (SAFE - NO DUPLICATE ERROR)
            String insertQuery = "INSERT INTO students(name, age) VALUES (?, ?)";
            PreparedStatement insertPs = con.prepareStatement(insertQuery);

            insertPs.setString(1, "Kiran");
            insertPs.setInt(2, 21);

            int rows = insertPs.executeUpdate();
            System.out.println("\n✅ Inserted Rows: " + rows);

            // 4. UPDATED DATA DISPLAY
            ResultSet rs2 = ps.executeQuery();

            System.out.println("\n📌 Updated Student Records:");

            while (rs2.next()) {
                System.out.println(
                    rs2.getInt("id") + " | " +
                    rs2.getString("name") + " | " +
                    rs2.getInt("age")
                );
            }

        } catch (Exception e) {
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