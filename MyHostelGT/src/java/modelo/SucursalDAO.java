package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SucursalDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;    
    
    public List listar(){
        String sql = "select * from sucursal";
        List<Sucursal> listaSucursal = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Sucursal su = new Sucursal();
                su.setCodigoSucursal(rs.getInt(1));
                su.setDescripcion(rs.getString(2));
                su.setPuntuacion(rs.getInt(3));
                su.setDireccion(rs.getString(4));
                su.setCodigoRegion(rs.getInt(5));
                su.setCodigoVolumen(rs.getInt(6));
                listaSucursal.add(su);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaSucursal;        
    }
}
