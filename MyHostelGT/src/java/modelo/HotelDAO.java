package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;    
    
        public List listar(){
        String sql = "select * from hotel";
        List<Hotel> listaHotel = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Hotel ho = new Hotel();
                ho.setCodigoHotel(rs.getInt(1));
                ho.setNombreHotel(rs.getString(2));
                ho.setPuntuacion(rs.getString(3));
                ho.setCodigoRegion(rs.getString(4));
                ho.setCodigoVolumen(rs.getString(5));
                listaHotel.add(ho);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaHotel;        
    }
}
