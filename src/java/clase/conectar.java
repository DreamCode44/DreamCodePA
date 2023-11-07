package clase;
import java.sql.*;
import static java.lang.System.out;

public class conectar {
    Connection cn = null;
    
    public Connection conectar(){
        
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PA?"
                + "autoReconnect=true&useSSL=false", "root", "n0m3l0");
        
        }catch(ClassNotFoundException | SQLException error){
            out.print(error.toString());
        }
        return cn;
    }
}
