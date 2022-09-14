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
    int resp;
    
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
                        hb.setSaldoAPagar(rs.getDouble(3));
                        hb.setCodigoClasificacion(rs.getInt(4));
                        hb.setCodigoSucursal(rs.getInt(5));
                        listaHabitacion.add(hb);
                    }
                    
                }catch(Exception e){
                    e.printStackTrace();
                }
            return listaHabitacion;
        }
        
         public int agregar(Habitacion hb){
        String sql = "insert into habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values (?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, hb.getEstado());
            ps.setDouble(2, hb.getSaldoAPagar());
            ps.setInt(3, hb.getCodigoClasificacion());
            ps.setInt(4, hb.getCodigoSucursal());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("No se pudo agregar el registro");
        }
        return resp;
    }
    
    public Habitacion listarCodigoHabitacion(int id){
        Habitacion hb = new Habitacion();
        String sql = "Select * from habitacion where numHabitacion = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                hb.setEstado(rs.getString(2));
                hb.setSaldoAPagar(rs.getDouble(3));
                hb.setCodigoClasificacion(rs.getInt(4));
                hb.setCodigoSucursal(rs.getInt(5));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return hb;
    }
    
    public int actualizar(Habitacion hb){
        String sql = "update habitacion set estado = ?, saldoAPagar = ?, codigoClasificacion = ?, codigoSucursal = ? where numHabitacion = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, hb.getEstado());
            ps.setDouble(2, hb.getSaldoAPagar());
            ps.setInt(3, hb.getCodigoClasificacion());
            ps.setInt(4, hb.getCodigoSucursal()); 
            ps.setInt(5, hb.getNumHabitacion());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "delete from habitacion where numHabitacion ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
        
        
}
