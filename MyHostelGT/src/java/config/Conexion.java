package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection conexion;
      
    public Connection Conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");

<<<<<<< Updated upstream
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBMyHostelGT?useSSL=false", "root", "admin");   
=======
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBMyHostelGT?useSSL=false", "root", "Lewonski2004");   
>>>>>>> Stashed changes

        }catch(Exception e){
            e.printStackTrace();
        }  
        return conexion;
    }
}
