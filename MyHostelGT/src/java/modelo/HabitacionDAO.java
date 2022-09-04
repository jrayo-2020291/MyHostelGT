package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HabitacionDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
        public List listar(){
            String sql = "select * from habitacion";
            List<Habitacion> listaHabitacion = new ArrayList<>();
                try{
                    con = cn.Conexion();
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();
                    
                    while(rs.next()){
                        Habitacion hb = new Habitacion();
                        hb.setNumHabitacion(rs.getInt(1));
                        hb.setEstado(rs.getString(2));
                        hb.setCodigoClasificacion(3);
                        hb.setCodigoHotel(rs.getInt(4));
                        listaHabitacion.add(hb);
                    }
                    
                }catch(Exception e){
                    e.printStackTrace();
                }
            return listaHabitacion;
        }
}

