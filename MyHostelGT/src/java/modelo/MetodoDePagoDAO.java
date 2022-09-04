package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MetodoDePagoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public List listar(){
        String sql = "select * from metodoDePago";
        List<MetodoDePago> listaMetodoDePago = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                MetodoDePago MePa = new MetodoDePago();
                MePa.setCodigoMetodoPago(rs.getInt(1));
                MePa.setDescripcion(rs.getString(2));
                listaMetodoDePago.add(MePa);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaMetodoDePago;        
    }
}
