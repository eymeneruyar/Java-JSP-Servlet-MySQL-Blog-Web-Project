package Utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {

    private final String driver = "com.mysql.cj.jdbc.Driver";
    private final String url = "jdbc:mysql://localhost:3306/servlet";
    private final String user = "root";
    private final String password = "";

    public Connection conn = null;

    public DB() {

        try {

            Class.forName(driver);
            conn = DriverManager.getConnection(url,user,password);
            System.out.println("Connection Success");

        } catch (Exception e) {
            System.err.println("Conncetion Error: " + e);
        }

    }

    public void close(){

        try {

            if( conn != null){
                conn.close();
            }

        } catch (Exception e) {
            System.err.println("Database Close Error: " + e);
        }

    }

}
