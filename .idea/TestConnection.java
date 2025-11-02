import java.sql.*;

public class TestConnection {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/home_cook_platform";
        String username = "root";
        String password = "root";

        try {
            Connection con = DriverManager.getConnection(url, username, password);
            System.out.println("✅ Connection Successful!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}