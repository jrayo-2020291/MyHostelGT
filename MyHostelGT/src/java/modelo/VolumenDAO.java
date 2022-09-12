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
    int vol;

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
    
    
    public int agregar(Volumen vo){
        String sql = "insert into volumen (CodigoVolumen, volumen) values (?, ?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, vo.getCodigoVolumen());
            ps.setString(2, vo.getVolumen());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
       return vol;
    }
    
    public Volumen listarCodigoVolumen(int id){
            Volumen vo = new Volumen();
            String sql = "Select * from volumen where codigoVolumen = " + id ;
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    vo.setVolumen(rs.getString(2));
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        return vo;
    }
    
    public int actualizar(Volumen vo){
        String sql = "update Volumen set Volumen = ? where codigoVolumen = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, vo.getVolumen());
            ps.setInt(2, vo.getCodigoVolumen());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return vol;
    }
    
    public void eliminar (int id){
        String sql = "delete from Volumen where codigoVolumen = " + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}