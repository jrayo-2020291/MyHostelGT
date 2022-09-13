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
    int resp;
    
    public List listar(){
        String sql = "select * from metodoDePago";
        List <MetodoDePago> listaMetodoDePago = new ArrayList<>();
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
    
    public int agregar(MetodoDePago MePago){
        String sql = "insert into MetodoDePago(descripcion) values (?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, MePago.getDescripcion());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("No se pudo agregar el registro");
        }
        return resp;
    }
    
    public MetodoDePago listarCodigoMetodoPago(int id){
        MetodoDePago MePago = new MetodoDePago();
        String sql = "Select * from MetodoDePago where codigoMetodoPago = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                MePago.setDescripcion(rs.getString(2));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return MePago;
    }
    
    public int actualizar(MetodoDePago MePago){
        String sql = "update metodoDePago set descripcion = ? where codigoMetodoPago = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, MePago.getDescripcion());
            ps.setInt(2, MePago.getCodigoMetodoPago());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "delete from MetodoDePago where codigoMetodoPago ="+id;
        System.out.println(sql);
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
}
