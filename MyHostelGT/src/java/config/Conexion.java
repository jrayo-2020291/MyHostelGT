package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection conexion;
      
    public Connection Conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
<<<<<<< HEAD
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBMyHostelGT?useSSL=false", "root", "19263");   
=======
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBMyHostelGT?useSSL=false", "root", "admin");
>>>>>>> Develop
        }catch(Exception e){
            e.printStackTrace();
        }  
        return conexion;
    }
}
