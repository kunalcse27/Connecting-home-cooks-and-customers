//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
import java.sql.*;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/connecting_home_cooks";
        String username = "root";
        String password = "root";

        try (Connection con = DriverManager.getConnection(url, username, password)) {
            System.out.println("✅ Connection Successful!");

        
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT DATABASE();");

            if (rs.next()) {
                System.out.println("Connected to database: " + rs.getString(1));
            }

        } catch (SQLException e) {
            System.err.println("❌ Connection failed: " + e.getMessage());
        }
    }
}
