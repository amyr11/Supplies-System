package finalproject_group1;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author amyrfrancisco
 */
public class ConnectDB {
    public static Connection Connect() {
        try {
            java.sql.Connection conn = null;
            Class.forName("org.apache.derby.jdbc.ClientDriver").getDeclaredConstructor().newInstance();
            String url = "jdbc:derby://localhost:1527/SuppliesDB;create=true";
            conn = DriverManager.getConnection(url,"dbadmin","dbadmin");
            System.out.println("Connected.");
            return conn;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return null;
        }
    }
}