package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VolumenDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List listar(){
        String sql = "Select * from volumen";
        List <Volumen> listaVolumen = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Volumen vo = new Volumen();
                vo.setCodigoVolumen(rs.getInt(1));
                vo.setVolumen(rs.getString(2));
                listaVolumen.add(vo);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listaVolumen;
    }
}