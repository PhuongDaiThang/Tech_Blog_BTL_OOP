package dal;

import java.sql.*;

public class DBContext {
    protected Connection conn;
    public DBContext(){
        try{
            String url = "jdbc:mysql://localhost:3306/techblog";      
            String user = "root";
            String password = "thang2004phutho";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url,user,password);
        }
        catch(SQLException | ClassNotFoundException ex){
            System.out.println(ex);
        }
    }
}
