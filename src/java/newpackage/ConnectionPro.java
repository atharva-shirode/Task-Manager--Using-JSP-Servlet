package newpackage;

import java.sql.*;


public class ConnectionPro {
    public Connection con;
    
    public  Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_db","root","");
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
